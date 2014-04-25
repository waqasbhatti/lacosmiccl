kernel void medianFilterKernel3x3(const int2 imageSize, const global read_only float* inImage, global write_only float* outImage)
{
	int x = get_global_id(0);
	int y = get_global_id(1);
	
	int clampX = imageSize.x - 1;
	int clampY = imageSize.y - 1;
	
	float medianTemp[9];
	
	float tempMin;
	float tempMax;
	
	int uOffset;
	int v[3];

	v[0] = max(y - 1, 0);
	v[1] = y;
	v[2] = min(y + 1, clampY);
	
	uOffset = imageSize.y * max(x - 1, 0);
	
	medianTemp[0] = inImage[uOffset + v[0]];
	medianTemp[1] = inImage[uOffset + v[1]];
	medianTemp[2] = inImage[uOffset + v[2]];
	
	uOffset = imageSize.y * x;
	
	medianTemp[3] = inImage[uOffset + v[0]];
	medianTemp[4] = inImage[uOffset + v[1]];
	medianTemp[5] = inImage[uOffset + v[2]];
	
	uOffset = imageSize.y * min(x + 1, clampX);
	
	medianTemp[6] = inImage[uOffset + v[0]];
	medianTemp[7] = inImage[uOffset + v[1]];
	medianTemp[8] = inImage[uOffset + v[2]];
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	outImage[(x * imageSize.y) + y] = medianTemp[4];
}

kernel void medianFilterKernel5x5(const int2 imageSize, const global read_only float* inImage, global write_only float* outImage)
{
	int x = get_global_id(0);
	int y = get_global_id(1);
	
	int clampX = imageSize.x - 1;
	int clampY = imageSize.y - 1;
	
	float medianTemp[25];
	
	float tempMin;
	float tempMax;
	
	int uOffset;
	int v[5];

	v[0] = max(y - 2, 0);
	v[1] = max(y - 1, 0);
	v[2] = y;
	v[3] = min(y + 1, clampY);
	v[4] = min(y + 2, clampY);
	
	uOffset = imageSize.y * max(x - 2, 0);
	
	medianTemp[0] = inImage[uOffset + v[0]];
	medianTemp[1] = inImage[uOffset + v[1]];
	medianTemp[2] = inImage[uOffset + v[2]];
	medianTemp[3] = inImage[uOffset + v[3]];
	medianTemp[4] = inImage[uOffset + v[4]];
	
	uOffset = imageSize.y * max(x - 1, 0);
	
	medianTemp[5] = inImage[uOffset + v[0]];
	medianTemp[6] = inImage[uOffset + v[1]];
	medianTemp[7] = inImage[uOffset + v[2]];
	medianTemp[8] = inImage[uOffset + v[3]];
	medianTemp[9] = inImage[uOffset + v[4]];
	
	uOffset = imageSize.y * x;
	
	medianTemp[10] = inImage[uOffset + v[0]];
	medianTemp[11] = inImage[uOffset + v[1]];
	medianTemp[12] = inImage[uOffset + v[2]];
	medianTemp[13] = inImage[uOffset + v[3]];
	medianTemp[14] = inImage[uOffset + v[4]];
	
	uOffset = imageSize.y * min(x + 1, clampX);
	
	medianTemp[15] = inImage[uOffset + v[0]];
	medianTemp[16] = inImage[uOffset + v[1]];
	medianTemp[17] = inImage[uOffset + v[2]];
	medianTemp[18] = inImage[uOffset + v[3]];
	medianTemp[19] = inImage[uOffset + v[4]];
	
	uOffset = imageSize.y * min(x + 2, clampX);
	
	medianTemp[20] = inImage[uOffset + v[0]];
	medianTemp[21] = inImage[uOffset + v[1]];
	medianTemp[22] = inImage[uOffset + v[2]];
	medianTemp[23] = inImage[uOffset + v[3]];
	medianTemp[24] = inImage[uOffset + v[4]];
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	outImage[(x * imageSize.y) + y] = medianTemp[12];
}

kernel void medianFilterKernel7x7(const int2 imageSize, const global read_only float* inImage, global write_only float* outImage)
{
	int x = get_global_id(0);
	int y = get_global_id(1);
	
	int clampX = imageSize.x - 1;
	int clampY = imageSize.y - 1;
	
	float medianTemp[49];
	
	float tempMin;
	float tempMax;
	
	int uOffset;
	int v[7];

	v[0] = max(y - 3, 0);
	v[1] = max(y - 2, 0);
	v[2] = max(y - 1, 0);
	v[3] = y;
	v[4] = min(y + 1, clampY);
	v[5] = min(y + 2, clampY);
	v[6] = min(y + 3, clampY);
	
	uOffset = imageSize.y * max(x - 3, 0);
	
	medianTemp[0] = inImage[uOffset + v[0]];
	medianTemp[1] = inImage[uOffset + v[1]];
	medianTemp[2] = inImage[uOffset + v[2]];
	medianTemp[3] = inImage[uOffset + v[3]];
	medianTemp[4] = inImage[uOffset + v[4]];
	medianTemp[5] = inImage[uOffset + v[5]];
	medianTemp[6] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * max(x - 2, 0);
	
	medianTemp[7] = inImage[uOffset + v[0]];
	medianTemp[8] = inImage[uOffset + v[1]];
	medianTemp[9] = inImage[uOffset + v[2]];
	medianTemp[10] = inImage[uOffset + v[3]];
	medianTemp[11] = inImage[uOffset + v[4]];
	medianTemp[12] = inImage[uOffset + v[5]];
	medianTemp[13] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * max(x - 1, 0);
	
	medianTemp[14] = inImage[uOffset + v[0]];
	medianTemp[15] = inImage[uOffset + v[1]];
	medianTemp[16] = inImage[uOffset + v[2]];
	medianTemp[17] = inImage[uOffset + v[3]];
	medianTemp[18] = inImage[uOffset + v[4]];
	medianTemp[19] = inImage[uOffset + v[5]];
	medianTemp[20] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * x;
	
	medianTemp[21] = inImage[uOffset + v[0]];
	medianTemp[22] = inImage[uOffset + v[1]];
	medianTemp[23] = inImage[uOffset + v[2]];
	medianTemp[24] = inImage[uOffset + v[3]];
	medianTemp[25] = inImage[uOffset + v[4]];
	medianTemp[26] = inImage[uOffset + v[5]];
	medianTemp[27] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * min(x + 1, clampX);
	
	medianTemp[28] = inImage[uOffset + v[0]];
	medianTemp[29] = inImage[uOffset + v[1]];
	medianTemp[30] = inImage[uOffset + v[2]];
	medianTemp[31] = inImage[uOffset + v[3]];
	medianTemp[32] = inImage[uOffset + v[4]];
	medianTemp[33] = inImage[uOffset + v[5]];
	medianTemp[34] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * min(x + 2, clampX);
	
	medianTemp[35] = inImage[uOffset + v[0]];
	medianTemp[36] = inImage[uOffset + v[1]];
	medianTemp[37] = inImage[uOffset + v[2]];
	medianTemp[38] = inImage[uOffset + v[3]];
	medianTemp[39] = inImage[uOffset + v[4]];
	medianTemp[40] = inImage[uOffset + v[5]];
	medianTemp[41] = inImage[uOffset + v[6]];
	
	uOffset = imageSize.y * min(x + 3, clampX);
	
	medianTemp[42] = inImage[uOffset + v[0]];
	medianTemp[43] = inImage[uOffset + v[1]];
	medianTemp[44] = inImage[uOffset + v[2]];
	medianTemp[45] = inImage[uOffset + v[3]];
	medianTemp[46] = inImage[uOffset + v[4]];
	medianTemp[47] = inImage[uOffset + v[5]];
	medianTemp[48] = inImage[uOffset + v[6]];
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[43], medianTemp[44]);
	tempMax = max(medianTemp[43], medianTemp[44]);
	
	medianTemp[43] = tempMin;
	medianTemp[44] = tempMax;
	
	tempMin = min(medianTemp[44], medianTemp[45]);
	tempMax = max(medianTemp[44], medianTemp[45]);
	
	medianTemp[44] = tempMin;
	medianTemp[45] = tempMax;
	
	tempMin = min(medianTemp[45], medianTemp[46]);
	tempMax = max(medianTemp[45], medianTemp[46]);
	
	medianTemp[45] = tempMin;
	medianTemp[46] = tempMax;
	
	tempMin = min(medianTemp[46], medianTemp[47]);
	tempMax = max(medianTemp[46], medianTemp[47]);
	
	medianTemp[46] = tempMin;
	medianTemp[47] = tempMax;
	
	tempMin = min(medianTemp[47], medianTemp[48]);
	tempMax = max(medianTemp[47], medianTemp[48]);
	
	medianTemp[47] = tempMin;
	medianTemp[48] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[43], medianTemp[44]);
	tempMax = max(medianTemp[43], medianTemp[44]);
	
	medianTemp[43] = tempMin;
	medianTemp[44] = tempMax;
	
	tempMin = min(medianTemp[44], medianTemp[45]);
	tempMax = max(medianTemp[44], medianTemp[45]);
	
	medianTemp[44] = tempMin;
	medianTemp[45] = tempMax;
	
	tempMin = min(medianTemp[45], medianTemp[46]);
	tempMax = max(medianTemp[45], medianTemp[46]);
	
	medianTemp[45] = tempMin;
	medianTemp[46] = tempMax;
	
	tempMin = min(medianTemp[46], medianTemp[47]);
	tempMax = max(medianTemp[46], medianTemp[47]);
	
	medianTemp[46] = tempMin;
	medianTemp[47] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[43], medianTemp[44]);
	tempMax = max(medianTemp[43], medianTemp[44]);
	
	medianTemp[43] = tempMin;
	medianTemp[44] = tempMax;
	
	tempMin = min(medianTemp[44], medianTemp[45]);
	tempMax = max(medianTemp[44], medianTemp[45]);
	
	medianTemp[44] = tempMin;
	medianTemp[45] = tempMax;
	
	tempMin = min(medianTemp[45], medianTemp[46]);
	tempMax = max(medianTemp[45], medianTemp[46]);
	
	medianTemp[45] = tempMin;
	medianTemp[46] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[43], medianTemp[44]);
	tempMax = max(medianTemp[43], medianTemp[44]);
	
	medianTemp[43] = tempMin;
	medianTemp[44] = tempMax;
	
	tempMin = min(medianTemp[44], medianTemp[45]);
	tempMax = max(medianTemp[44], medianTemp[45]);
	
	medianTemp[44] = tempMin;
	medianTemp[45] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[43], medianTemp[44]);
	tempMax = max(medianTemp[43], medianTemp[44]);
	
	medianTemp[43] = tempMin;
	medianTemp[44] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[42], medianTemp[43]);
	tempMax = max(medianTemp[42], medianTemp[43]);
	
	medianTemp[42] = tempMin;
	medianTemp[43] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[41], medianTemp[42]);
	tempMax = max(medianTemp[41], medianTemp[42]);
	
	medianTemp[41] = tempMin;
	medianTemp[42] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[40], medianTemp[41]);
	tempMax = max(medianTemp[40], medianTemp[41]);
	
	medianTemp[40] = tempMin;
	medianTemp[41] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[39], medianTemp[40]);
	tempMax = max(medianTemp[39], medianTemp[40]);
	
	medianTemp[39] = tempMin;
	medianTemp[40] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[38], medianTemp[39]);
	tempMax = max(medianTemp[38], medianTemp[39]);
	
	medianTemp[38] = tempMin;
	medianTemp[39] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[37], medianTemp[38]);
	tempMax = max(medianTemp[37], medianTemp[38]);
	
	medianTemp[37] = tempMin;
	medianTemp[38] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[36], medianTemp[37]);
	tempMax = max(medianTemp[36], medianTemp[37]);
	
	medianTemp[36] = tempMin;
	medianTemp[37] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[35], medianTemp[36]);
	tempMax = max(medianTemp[35], medianTemp[36]);
	
	medianTemp[35] = tempMin;
	medianTemp[36] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[34], medianTemp[35]);
	tempMax = max(medianTemp[34], medianTemp[35]);
	
	medianTemp[34] = tempMin;
	medianTemp[35] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[33], medianTemp[34]);
	tempMax = max(medianTemp[33], medianTemp[34]);
	
	medianTemp[33] = tempMin;
	medianTemp[34] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[32], medianTemp[33]);
	tempMax = max(medianTemp[32], medianTemp[33]);
	
	medianTemp[32] = tempMin;
	medianTemp[33] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[31], medianTemp[32]);
	tempMax = max(medianTemp[31], medianTemp[32]);
	
	medianTemp[31] = tempMin;
	medianTemp[32] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[30], medianTemp[31]);
	tempMax = max(medianTemp[30], medianTemp[31]);
	
	medianTemp[30] = tempMin;
	medianTemp[31] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[29], medianTemp[30]);
	tempMax = max(medianTemp[29], medianTemp[30]);
	
	medianTemp[29] = tempMin;
	medianTemp[30] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[28], medianTemp[29]);
	tempMax = max(medianTemp[28], medianTemp[29]);
	
	medianTemp[28] = tempMin;
	medianTemp[29] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[27], medianTemp[28]);
	tempMax = max(medianTemp[27], medianTemp[28]);
	
	medianTemp[27] = tempMin;
	medianTemp[28] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[26], medianTemp[27]);
	tempMax = max(medianTemp[26], medianTemp[27]);
	
	medianTemp[26] = tempMin;
	medianTemp[27] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[25], medianTemp[26]);
	tempMax = max(medianTemp[25], medianTemp[26]);
	
	medianTemp[25] = tempMin;
	medianTemp[26] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	tempMin = min(medianTemp[24], medianTemp[25]);
	tempMax = max(medianTemp[24], medianTemp[25]);
	
	medianTemp[24] = tempMin;
	medianTemp[25] = tempMax;
	
	tempMin = min(medianTemp[0], medianTemp[1]);
	tempMax = max(medianTemp[0], medianTemp[1]);
	
	medianTemp[0] = tempMin;
	medianTemp[1] = tempMax;
	
	tempMin = min(medianTemp[1], medianTemp[2]);
	tempMax = max(medianTemp[1], medianTemp[2]);
	
	medianTemp[1] = tempMin;
	medianTemp[2] = tempMax;
	
	tempMin = min(medianTemp[2], medianTemp[3]);
	tempMax = max(medianTemp[2], medianTemp[3]);
	
	medianTemp[2] = tempMin;
	medianTemp[3] = tempMax;
	
	tempMin = min(medianTemp[3], medianTemp[4]);
	tempMax = max(medianTemp[3], medianTemp[4]);
	
	medianTemp[3] = tempMin;
	medianTemp[4] = tempMax;
	
	tempMin = min(medianTemp[4], medianTemp[5]);
	tempMax = max(medianTemp[4], medianTemp[5]);
	
	medianTemp[4] = tempMin;
	medianTemp[5] = tempMax;
	
	tempMin = min(medianTemp[5], medianTemp[6]);
	tempMax = max(medianTemp[5], medianTemp[6]);
	
	medianTemp[5] = tempMin;
	medianTemp[6] = tempMax;
	
	tempMin = min(medianTemp[6], medianTemp[7]);
	tempMax = max(medianTemp[6], medianTemp[7]);
	
	medianTemp[6] = tempMin;
	medianTemp[7] = tempMax;
	
	tempMin = min(medianTemp[7], medianTemp[8]);
	tempMax = max(medianTemp[7], medianTemp[8]);
	
	medianTemp[7] = tempMin;
	medianTemp[8] = tempMax;
	
	tempMin = min(medianTemp[8], medianTemp[9]);
	tempMax = max(medianTemp[8], medianTemp[9]);
	
	medianTemp[8] = tempMin;
	medianTemp[9] = tempMax;
	
	tempMin = min(medianTemp[9], medianTemp[10]);
	tempMax = max(medianTemp[9], medianTemp[10]);
	
	medianTemp[9] = tempMin;
	medianTemp[10] = tempMax;
	
	tempMin = min(medianTemp[10], medianTemp[11]);
	tempMax = max(medianTemp[10], medianTemp[11]);
	
	medianTemp[10] = tempMin;
	medianTemp[11] = tempMax;
	
	tempMin = min(medianTemp[11], medianTemp[12]);
	tempMax = max(medianTemp[11], medianTemp[12]);
	
	medianTemp[11] = tempMin;
	medianTemp[12] = tempMax;
	
	tempMin = min(medianTemp[12], medianTemp[13]);
	tempMax = max(medianTemp[12], medianTemp[13]);
	
	medianTemp[12] = tempMin;
	medianTemp[13] = tempMax;
	
	tempMin = min(medianTemp[13], medianTemp[14]);
	tempMax = max(medianTemp[13], medianTemp[14]);
	
	medianTemp[13] = tempMin;
	medianTemp[14] = tempMax;
	
	tempMin = min(medianTemp[14], medianTemp[15]);
	tempMax = max(medianTemp[14], medianTemp[15]);
	
	medianTemp[14] = tempMin;
	medianTemp[15] = tempMax;
	
	tempMin = min(medianTemp[15], medianTemp[16]);
	tempMax = max(medianTemp[15], medianTemp[16]);
	
	medianTemp[15] = tempMin;
	medianTemp[16] = tempMax;
	
	tempMin = min(medianTemp[16], medianTemp[17]);
	tempMax = max(medianTemp[16], medianTemp[17]);
	
	medianTemp[16] = tempMin;
	medianTemp[17] = tempMax;
	
	tempMin = min(medianTemp[17], medianTemp[18]);
	tempMax = max(medianTemp[17], medianTemp[18]);
	
	medianTemp[17] = tempMin;
	medianTemp[18] = tempMax;
	
	tempMin = min(medianTemp[18], medianTemp[19]);
	tempMax = max(medianTemp[18], medianTemp[19]);
	
	medianTemp[18] = tempMin;
	medianTemp[19] = tempMax;
	
	tempMin = min(medianTemp[19], medianTemp[20]);
	tempMax = max(medianTemp[19], medianTemp[20]);
	
	medianTemp[19] = tempMin;
	medianTemp[20] = tempMax;
	
	tempMin = min(medianTemp[20], medianTemp[21]);
	tempMax = max(medianTemp[20], medianTemp[21]);
	
	medianTemp[20] = tempMin;
	medianTemp[21] = tempMax;
	
	tempMin = min(medianTemp[21], medianTemp[22]);
	tempMax = max(medianTemp[21], medianTemp[22]);
	
	medianTemp[21] = tempMin;
	medianTemp[22] = tempMax;
	
	tempMin = min(medianTemp[22], medianTemp[23]);
	tempMax = max(medianTemp[22], medianTemp[23]);
	
	medianTemp[22] = tempMin;
	medianTemp[23] = tempMax;
	
	tempMin = min(medianTemp[23], medianTemp[24]);
	tempMax = max(medianTemp[23], medianTemp[24]);
	
	medianTemp[23] = tempMin;
	medianTemp[24] = tempMax;
	
	outImage[(x * imageSize.y) + y] = medianTemp[24];
}

