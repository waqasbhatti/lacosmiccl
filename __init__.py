import os
import string
import numpy
import pyopencl as cl
import pyopencl.array as cl_array
import astropy.io.fits as fits

_moduleName = __name__
_modulePath = os.path.dirname(__file__)
_sourceDir = os.path.join(_modulePath, "kernels")
# no binary caching for now
#_binaryCache = os.path.join(_sourceDir, "binary_cache")

_minMemorySize = 2**30		# Useing 256 MB of ram, so to be safe system should have 1 GB

_devicePrecedence = [cl.device_type.ACCELERATOR, cl.device_type.GPU, cl.device_type.CPU, cl.device_type.ALL]

class RuntimeError(RuntimeError):
	pass

class _KernelSource:
	def __init__(self, name):
		self.name = name
		self.filename = os.path.join(_sourceDir, name) + ".cl"
		try:
			file = open(self.filename, 'r')
		except IOError as error:
			raise RuntimeError("Failed to load source for kernel '{}' :{}".format(self.name, error))
		self.source = file.read()
		file.close()
	def getSource(self):
		return self.source

_kernelSourceNames = [	"median_filter_kernels",
						"lacosmic_kernels" ]
_kernelSources = [_KernelSource(name) for name in _kernelSourceNames]

class _ImageKernelHandler:
	__commandQueue = None
	__imageShape = None
	__imageShape_int2 = None
	
	def __callKernel(self, kernel, *args):
		kernel(self.__commandQueue, self.__imageShape, None, self.__imageShape_int2, *args)
		self.__commandQueue.finish()
	
	def __init__(self, commandQueue):
		self.__commandQueue = commandQueue
	
	def setImageShape(self, imageShape):
		self.__imageShape = imageShape
		self.__imageShape_int2 = cl_array.vec.make_int2(*imageShape)
	
	def addKernel(self, kernel):
		setattr(self, kernel.function_name, lambda *args: self.__callKernel(kernel, *args))
	
	def enqueueCopy(self, dest, source, **kwargs):
		self.__event = cl.enqueue_copy(self.__commandQueue, dest, source, **kwargs)
		self.__commandQueue.finish()

_imageKernelNames = ["medianFilterKernel3x3", "medianFilterKernel5x5", "medianFilterKernel7x7", "fillKernel", "cosmicLaplacianKernel", "noiseAndBackgroundKernel", "largeStructureKernel", "growKernel", "creatMaskKernel", "cleanOutputKernel"]

class LACosmicCL:
	__kernelSourceStr = None
	__haveRun = False
	
	# Internal methods
	
	def __printv(self, message):
		if self.verbose: print(_moduleName + ": " + message)
	def __initCL(self):
		self.__printv("Initializing OpenCL...")
		self.__printv("Using device: {}".format(self.device.get_info(cl.device_info.NAME)))
		self.context = cl.Context([self.device])
		self.queue = cl.CommandQueue(self.context, self.device)
		self.__initKernels()
	def __initMemory(self):
		self.__printv("Initializing memory...")
		
		# Temp buffers needed to run lacosmic - not the easiest to read but saves memory
		
		self.t0Buffer = cl.Buffer(self.context, 0, self.nBytes)
		self.t1Buffer = cl.Buffer(self.context, 0, self.nBytes)
		self.t2Buffer = cl.Buffer(self.context, 0, self.nBytes)
		self.t3Buffer = cl.Buffer(self.context, 0, self.nBytes)
		self.t4Buffer = cl.Buffer(self.context, 0, self.nBytes)
		
		self.cleanBuffer = cl.Buffer(self.context, 0, self.nBytes)
		self.maskBuffer = cl.Buffer(self.context, 0, self.nBytes)
		
		self.sumSubBuffer = cl.Buffer(self.context, cl.mem_flags.WRITE_ONLY, self.valueSize * self.dataShape[0]);
	def __initKernels(self, rebuild=False):
		if rebuild or self.__kernelSourceStr == None:
			self.__printv("Reading kernels from source...")
			self.__kernelSourceStr = string.join([s.getSource() for s in _kernelSources], "\n\n\n")
		self.__printv("Building kernels...")
		self.program = cl.Program(self.context, self.__kernelSourceStr)
		try:
			self.program.build()
		except cl.RuntimeError as error:
			raise RuntimeError(error)
		self.imageHandler = _ImageKernelHandler(self.queue)
		for kernel in self.program.all_kernels():
			if kernel.function_name in _imageKernelNames:
				self.imageHandler.addKernel(kernel)
	
	def __getData(self, buf):
		outData = numpy.empty_like(self.inData)
		self.imageHandler.enqueueCopy(outData, buf, is_blocking=True)
		return outData
	def __writeTo(self, filename, data):
		newHDU = type(self.inFile[self.fitsExtension])(data=data, header=self.inFile[self.fitsExtension].header, scale_back=True)
		outFile = fits.HDUList(self.inFile)
		outFile[self.fitsExtension] = newHDU
		outFile.writeto(filename, clobber=True)
	
	def __findGoodDevice(self, devicePrecedence=_devicePrecedence):
		self.__printv("Looking valid OpenCL devices...")
		platforms = cl.get_platforms()
		goodDevices = []
		
		for deviceType in devicePrecedence:
			for platform in platforms:
				try:
					devices = platform.get_devices(deviceType)
				except cl.RuntimeError:
					continue
				for device in devices:
					if (device.get_info(cl.device_info.GLOBAL_MEM_SIZE) >= _minMemorySize) and (not device in goodDevices):
						goodDevices.append(device)
		
		if len(goodDevices) == 0:
			raise RuntimeError("No valid OpenCL devices found.")
		self.__printv("Found {} valid devices.".format(len(goodDevices)))
		return goodDevices[0]
	
	# External methods
	
	def __init__(self, filename, extension=0, devicePrecedence=_devicePrecedence, verbose=False):
		self.setVerbose(verbose)
		
		self.device = self.__findGoodDevice()
		self.__initCL()
		self.loadFile(filename, extension)
	
	def verbose(self):
		return self.verbose
	def setVerbose(self, v):
		self.verbose = v
	
	def setDevice(self, device):
		self.device = device
		self.__initCL()
		self.__initMemory()
	
	def loadFile(self, filename, extension=0):
		self.__printv("Attempting to load file: {}".format(filename))
		self.inFile = fits.open(filename)
		self.fitsExtension = extension
		self.inData = self.inFile[extension].data
		self.nBytes = self.inData.nbytes
		self.valueSize = self.inData.dtype.itemsize		# should be size of float32 or whatever
		self.dataShape = self.inData.shape
		self.imageHandler.setImageShape(self.dataShape)
		self.__initMemory()
	
	def getRawData(self):
		return self.inData
	def getCleanData(self):
		if not self.__haveRun: raise RuntimeError("Cannot retrieve output data before running.")
		self.__printv("Copying cleaned image from device memory...")
		return self.__getData(self.cleanBuffer)
	def getMaskData(self):
		if not self.__haveRun: raise RuntimeError("Cannot retrieve output data before running.")
		self.__printv("Copying mask from device memory...")
		return self.__getData(self.maskBuffer)
	def writeCleanDataTo(self, filename):
		cleanData = self.getCleanData()
		self.__printv("Writing cleaned image to: {}".format(filename))
		self.__writeTo(filename, cleanData)
	def writeMaskDataTo(self, filename):
		maskData = self.getMaskData()
		self.__printv("Writing mask to: {}".format(filename))
		self.__writeTo(filename, maskData)
	
	# Iraf default parameters:
	# gain=2.0, readnoise=6.0, sigclip=4.5, sigfrac=0.5, objlim=1.0
	
	def run(self, nIter=4, gain=2.0, readnoise=6.0, sigclip=4.5, sigfrac=0.5, objlim=3.0, pssl=0.0):
		self.__printv("Running lacosmic...")
		
		self.__printv("Using parameters: gain = {}, readnoise = {}, sigclip = {}, sigfrac = {}, objlim = {}, pssl = {}".format(gain, readnoise, sigclip, sigfrac, objlim, pssl))
		
		# Convert all arguments to float32
		gain = numpy.float32(gain)
		readnoise = numpy.float32(readnoise)
		sigclip = numpy.float32(sigclip)
		sigfrac = numpy.float32(sigfrac)
		objlim = numpy.float32(objlim)
		pssl = numpy.float32(pssl)
		
		sumTempArray = numpy.zeros(self.dataShape[0])	# Temp array for counting number of cosmics
		
		# Copy input to output - each iteration will operate on output
		self.__printv("Transferring data to device memory...")
		self.imageHandler.enqueueCopy(self.cleanBuffer, self.inData, is_blocking=True)
		# Zero output mask - the enqueue fill funciton only exists in OpenCL 1.1+
		self.imageHandler.fillKernel(self.maskBuffer, numpy.float32(0.0))
		
		# Deal with sky level
		
		for i in range(1, nIter + 1):
			self.__printv("Iteration {}".format(i))
			# Compute gain if needed - to be implemented later
			
			# Compute laplacian
			self.imageHandler.cosmicLaplacianKernel(self.cleanBuffer, self.t0Buffer) # t0 = deriv2
			
			# background and noise
			self.imageHandler.medianFilterKernel5x5(self.cleanBuffer, self.t1Buffer) # t1 = med5
			self.imageHandler.noiseAndBackgroundKernel(self.t0Buffer, self.t1Buffer, self.t2Buffer, self.t3Buffer, gain, readnoise*readnoise)
			# t0 = deriv2, t1 = med5, t2 = noise, t3 = sigmap
			# Apparently float32**2 is float64, so multiplying readnoise by itself
			
			# Remove large structure, select candidate CRs
			self.imageHandler.medianFilterKernel5x5(self.t3Buffer, self.t4Buffer) # t3 = sigmap, t4 = med5
			self.imageHandler.medianFilterKernel3x3(self.cleanBuffer, self.t0Buffer) # t0 = med3
			self.imageHandler.medianFilterKernel7x7(self.t0Buffer, self.t1Buffer) # t0 = med3, t1 = med7
			self.imageHandler.largeStructureKernel(self.t0Buffer, self.t1Buffer, self.t2Buffer, self.t3Buffer, self.t4Buffer, self.t0Buffer, sigclip, objlim)
			# t0 = med3, t1 = med7, t2 = noise, t3 = sigmap, t4 = med5, t0 = firstsel
			# Should be okay since the large structure kernel reads all values before doing anything with them
			
			# Grow CRs by one pixel and check in sigmap
			self.imageHandler.growKernel(self.t0Buffer, self.t1Buffer, self.t3Buffer, sigclip) # t0 = firstsel, t1 = gfirstsel, t3 = sigmap
			self.imageHandler.growKernel(self.t1Buffer, self.t0Buffer, self.t3Buffer, sigfrac * sigclip) # t1 = gfirstsel, t0 = finalsel, t3 = sigmap
			
			# Create out mask, count CRs
			self.imageHandler.creatMaskKernel(self.cleanBuffer, self.maskBuffer, self.t0Buffer, self.t1Buffer, self.t2Buffer)
			# clean = oldoutput, mask = mask, t0 = finalsel, t1 = inputmask, t2 = haveCR (will be summed to count CRs)
			
			# Create cleaned output
			self.imageHandler.medianFilterKernel5x5(self.t1Buffer, self.t3Buffer) # t1 = inputmask, t3 = med5
			# This median filter should actually reject values below -9999 but hopefully that doesn't matter
			self.imageHandler.cleanOutputKernel(self.cleanBuffer, self.maskBuffer, self.t3Buffer) # t3 = med5
			
			self.__printv("Completed iteration {}.  Counting cosmic rays...".format(i))
			
			nCRs = numpy.sum(self.__getData(self.t2Buffer))
			
			# Count CRs
			#self.program.collapseRowKernel(self.queue, self.dataShape[:1], None, self.t2Buffer, self.sumSubBuffer, numpy.int32(self.dataShape[1]))
			#cl.enqueue_copy(self.queue, sumTempArray, self.sumSubBuffer)
			#nCRs = numpy.sum(sumTempArray)
			self.__printv("Found {:.0f} cosmic rays in iteration {}.".format(nCRs, i))
			if nCRs == 0: break
			
		# Deal with sky level
		
		self.__haveRun = True
	def test_med5(self):
		self.__printv("Running 5x5 median filter test...")
		self.program.medianFilterKernel5x5(self.queue, self.dataShape, None, self.inBuffer, self.cleanBuffer, self.dataShapeInt2)
		self.__haveRun = True