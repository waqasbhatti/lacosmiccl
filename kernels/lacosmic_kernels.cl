// Fill kernel - fills an image with a set value

kernel void fillKernel(const int2 imageSize, global float* image, const float fillValue)
{
	image[get_global_id(0) * imageSize.y + get_global_id(1)] = fillValue;
}

// Laplacian kernel
// Simulates subdividing the image by 4, then convolving with the laplacian kernel, then block averaging back to original size
// Laplacian kernel is ((0, -1, 0), (-1, 4, -1), (0, -1, 0))

kernel void cosmicLaplacianKernel(const int2 imageSize, global float* inImage, global float* laplacian)
{
	int x = get_global_id(0);
	int y = get_global_id(1);
	
	int xOffset = x * imageSize.y;

	float topValue = inImage[(max(x - 1, 0) * imageSize.y) + y];
	float bottomValue = inImage[(min(x + 1, imageSize.x - 1) * imageSize.y) + y];
	float leftValue = inImage[xOffset + max(y - 1, 0)];
	float centerValue2 = inImage[xOffset + y] * 2.0f;
	float rightValue = inImage[xOffset + min(y + 1, imageSize.y - 1)];
	
	float derivatives[4];
	
	// Compute derivatives and get rid of negative values
	
	derivatives[0] = max(centerValue2 - topValue - leftValue, 0.0f);
	derivatives[1] = max(centerValue2 - leftValue - bottomValue, 0.0f);
	derivatives[2] = max(centerValue2 - bottomValue - rightValue, 0.0f);
	derivatives[3] = max(centerValue2 - rightValue - topValue, 0.0f);
	
	// Average and divide by two (since each edge counted twice)
	
	laplacian[xOffset + y] = (derivatives[0] + derivatives[1] + derivatives[2] + derivatives[3])/8.0f;
}

// Create noise model, divide laplacian by noise, then by 2 (because laplacian is counted twice)

kernel void noiseAndBackgroundKernel(const int2 imageSize, global float* laplacian, global float* input_med5, global float* noise, global float* sigmap, const float gain, const float readNoiseSq)
{
	int offset = get_global_id(0) * imageSize.y + get_global_id(1);
	
	float noise_value, sigmap_value;
	
	noise_value = sqrt( (max(input_med5[offset], 0.0001f) * gain) + readNoiseSq) / gain;
	sigmap_value = laplacian[offset] / noise_value;
	noise[offset] = noise_value;
	sigmap[offset] = sigmap_value;
}

// Large structure, cosmic candidates

kernel void largeStructureKernel(const int2 imageSize, global float* input_med3, global float* input_med37, global float* noise, global float* sigmap, global float* sigmap_med5, global float* firstsel, const float sigclip, const float objlim)
{
	int offset = get_global_id(0) * imageSize.y + get_global_id(1);
	
	float sigmap_value, firstsel_value, value, starreject_value;
	
	sigmap_value = sigmap[offset] - sigmap_med5[offset];
	
	firstsel_value = (sigmap_value < sigclip) ? 0.0f : (sigmap_value > 0.1f) ? 1.0f : sigmap_value; // firstsel
	value = (input_med3[offset] - input_med37[offset]) / noise[offset]; // med3
	value = max(value, 0.01f); // med3
	starreject_value = firstsel_value * sigmap_value / value;
	starreject_value = (starreject_value < objlim) ? 0.0f : (starreject_value > 0.5f) ? 1.0f : starreject_value;
	
	sigmap[offset] = sigmap_value;
	firstsel[offset] = firstsel_value * starreject_value;
}

// Grow CRs and check against sigmap

kernel void growKernel(const int2 imageSize, global float* firstsel, global float* finalsel, global float* sigmap, const float sigclip)
{
	int x = get_global_id(0);
	int y = get_global_id(1);
	int xOffset = x * imageSize.y;
	
	int u;
	int v1; // left
	int v2; // right
	
	float gfirstsel = 0.0f;
	
	v1 = max(y - 1, 0);
	v2 = min(y + 1, imageSize.y - 1);
	
	u = max(x - 1, 0);
	
	gfirstsel += firstsel[u * imageSize.y + v1];
	gfirstsel += firstsel[u * imageSize.y + y];
	gfirstsel += firstsel[u * imageSize.y + v2];
	
	gfirstsel += firstsel[xOffset + v1];
	gfirstsel += firstsel[xOffset + y];
	gfirstsel += firstsel[xOffset + v2];
	
	u = min(x + 1, imageSize.x - 1);
	
	gfirstsel += firstsel[u * imageSize.y + v1];
	gfirstsel += firstsel[u * imageSize.y + y];
	gfirstsel += firstsel[u * imageSize.y + v2];
	
	gfirstsel = (gfirstsel > 0.5f) ? 1.0f : gfirstsel;
	gfirstsel *= sigmap[xOffset + y];
	gfirstsel = (gfirstsel < sigclip) ? 0.0f : (gfirstsel > 0.1f) ? 1.0f : gfirstsel;
	
	finalsel[xOffset + y] = gfirstsel;  // in place
}

// Create mask

kernel void creatMaskKernel(const int2 imageSize, global float* inImage, global float* outMask, global float* finalsel, global float* inputMask, global float* haveCR)
{
	int offset = get_global_id(0) * imageSize.y + get_global_id(1);
	
	float inputMask_value, outMask_value, finalsel_value, haveCR_value;
	
	outMask_value = outMask[offset];
	finalsel_value = finalsel[offset];
	haveCR_value = (1.0f - outMask_value) * finalsel_value;
	haveCR_value = (haveCR_value > 0.5f) ? 1.0f : 0.0f;
	outMask_value += finalsel_value;
	outMask_value = min(outMask_value, 1.0f);
	inputMask_value = (1.0f - (10000.0f * outMask_value)) * inImage[offset];
	
	outMask[offset] = outMask_value;
	inputMask[offset] = inputMask_value;
	haveCR[offset] = haveCR_value;
}

// Clean output

kernel void cleanOutputKernel(const int2 imageSize, global float* outImage, global float*outMask, global float* inputMask_med5)
{
	int offset = get_global_id(0) * imageSize.y + get_global_id(1);
	
	float oldOutput, outMask_value;
	
	oldOutput = outImage[offset];
	outMask_value = outMask[offset];
	
	outImage[offset] = ((1.0f - outMask_value) * oldOutput) + (inputMask_med5[offset] * outMask_value);
}

// Fastish sum algorithm - collapse each row

kernel void collapseRowKernel(global float* inImage, global float* sumVec, const int rowLen)
{
	int x = get_global_id(0);
	int xOffset = x * rowLen;
	
	int i;
	float sum = 0.0f;
	
	for (i = 0; i < rowLen; i++)
	{
		sum += inImage[xOffset + i];
	}
	
	sumVec[x] = sum;
}