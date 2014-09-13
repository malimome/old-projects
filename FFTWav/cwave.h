#ifndef CWavH
#define CWavH

class CWav
{
public:
	int 	myChunkSize;
	int		mySubChunk1Size;
	short 	myFormat;
	short 	myChannels;
	int   	mySampleRate;
	int   	myByteRate;
	short 	myBlockAlign;
	short 	myBitsPerSample;
	int		myDataSize;
	char* 	myData;

	short *my_signal;
	int mySignalSize;

private:
	FILE *outStream;	

public:
	CWav() {};
	CWav(const char *);
	~CWav();
	void readInput(char *filename);
	void writeHeader(int channels, int numberSamples, int bitsPerSample,
						 double outputRate);
	void writeSignal(short *outputSignal, int numberSamples);

private:
	size_t fwriteIntLSB(int data);
	size_t fwriteShortLSB(short int data);

};

#endif
