/******************************************************************************
 *     
 *     Description:   This program generates a two-second 440 Hz test tone and
 *                    writes it to a .wav file.  The sound file has 16-bit
 *                    samples at a sample rate of 44.1 kHz, and is monophonic. 
 *
 *     Author:        Mohsen Alimomeni
 *
 *     Date:          November 21, 2009
 *
 ******************************************************************************/


/*  HEADER FILES  ************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <fstream>
#include <iostream>
#include <time.h>
#include "cwave.h"
#include "dftfft.h"
using namespace std;

#define DEBUG_MODE

/*  CONSTANTS  ***************************************************************/
/*  Test tone frequency in Hz  */
#define FREQUENCY			440.0

/*  Test tone duration in seconds  */
#define DURATION			2.0				

/*  Standard sample rate in Hz  */
#define SAMPLE_RATE			44100.0

/*  Standard sample size in bits  */
#define BITS_PER_SAMPLE		16

/*  Standard sample size in bytes  */		
#define BYTES_PER_SAMPLE	(BITS_PER_SAMPLE/8)

/*  Number of channels  */
#define MONOPHONIC			1
#define STEREOPHONIC		2


/*  FUNCTION PROTOTYPES  *****************************************************/
void createTestTone(double frequency, double duration,
					int numberOfChannels, int bitsPerSample, int sampleRate, const char *filename);

void manipulate(CWav *, int manipulateChoice, const char *);
void manipulate(CWav *, CWav *impulse, const char *);

void convolve(short x[], int N, float h[], int M, short y[], int P);
void convolve(short x[], int N, CWav *impulse, short y[], int P);


/******************************************************************************
 *
 *	function:	main
 *
 *	purpose:	Creates the test tone and writes it to the
 *               specified .wav file.
 *			
 *   arguments:	argv[1]:  the filename for the output .wav file
 *                       
 ******************************************************************************/

int main (int argc, char *argv[])
{
	char *inputFileName, *outputFilename, *impulseFile;
	char *out= (char *)"outputTime.wav";	
	char *in = (char *)"testCase1.wav";
	char *im = (char *)"smallCave.wav";
	if (argc>=2){
		inputFileName = argv[1];	
		impulseFile = argv[2]; 
		outputFilename = argv[3];
	} else {
		inputFileName = in;
		impulseFile = im;
		outputFilename = out;
	}
	
	/*  Create the sine wave test tone, using the specified
	 frequency, duration, and number of channels, writing to
	 a .wav file with the specified output filename  */
	//createTestTone(FREQUENCY, DURATION, MONOPHONIC, BITS_PER_SAMPLE, SAMPLE_RATE, outputFilename);
	//testReadTone(outputFilename);
	//testReadTone(inputFileName);
	
	CWav *inputSignal;
	inputSignal = new CWav();
	inputSignal->readInput(inputFileName);
	
	//manipulate(0);
	
	CWav *impulse = new CWav();
	impulse->readInput(impulseFile);
	
	cout << "Input Signal: " << inputSignal->mySignalSize << ", Impulse Size: " << impulse->mySignalSize << endl;
	
	//manipulate(0);
	//clock_t start = clock();
	//manipulate(inputSignal, impulse, outputFilename);
	//clock_t time  = clock() - start;
	//cout << "Time took to run convolve is roughly " << time << " CPU cycles or " << (double)time/CLOCKS_PER_SEC << " seconds or " << (double)time/(CLOCKS_PER_SEC*60) << " minutes " << endl;
	
	clock_t start = clock();
	if (impulse->myChannels ==1)
		convolveFreq(inputSignal, impulse, "outfft1.wav");
	else if (impulse->myChannels ==1)
		convolveFreq2(inputSignal, impulse, "outfft2.wav");
	clock_t time  = clock() - start;
	cout << "Time took to run convolveFreq is roughly " << time << " CPU cycles or " << (double)time/CLOCKS_PER_SEC << " seconds or " << (double)time/(CLOCKS_PER_SEC*60) << " minutes " << endl;
	
	/*  End of program  */
	return 0;
}



/******************************************************************************
 *
 *       function:       createTestTone
 *
 *       purpose:        Calculates and writes out a sine test tone to file
 *
 *		arguments:		frequency:  frequency of the test tone in Hz
 *						duration:  length of the test tone in seconds
 *                       numberOfChannels:  number of audio channels
 *						filename:  name of the file to create
 *                       
 *       internal
 *       functions:      writeWaveFileHeader, fwriteShortLSB
 *
 *       library
 *       functions:      ceil, pow, fopen, fprintf, sin, rint, fclose
 *
 ******************************************************************************/

void createTestTone(double frequency, double duration,
					int numberOfChannels, int bitsPerSample, int sampleRate, const char *filename)
{
	int i;
	
	/*  Calculate the number of sound samples to create,
	 rounding upwards if necessary  */
	int numberOfSamples = (int)ceil(duration * sampleRate);
	
	/*  Calculate the maximum value of a sample  */
	int maximumValue = (int)pow(2.0, (double)bitsPerSample - 1) - 1;
	
	CWav outWav(filename);
	/*  Write the WAVE file header  */
	outWav.writeHeader(numberOfChannels, numberOfSamples, bitsPerSample,
						sampleRate);
	
	/*  Create the sine tone and write it to file  */
	/*  Since the frequency is fixed, the angular frequency
	 and increment can be precalculated  */
	double angularFrequency = 2.0 * PI * frequency;
	double increment = angularFrequency / sampleRate;
	
	short *testTone = new short[numberOfSamples];
	
	for (i = 0; i < numberOfSamples; i++) {
		/*  Calculate the sine wave in the range -1.0 to + 1.0  */
		double value = sin(i * increment);
		/*  Convert the value to a 16-bit integer, with the
		 range -maximumValue to + maximumValue.  The calculated
		 value is rounded to the nearest integer  */
		testTone[i] = rint(value * maximumValue);
		/*  Write out the sample as a 16-bit (short) integer
		 in little-endian format  */
//		fwriteShortLSB(sampleValue, outputFileStream);
		/*  If stereo output, duplicate the sample in the right channel  */
//		if (numberOfChannels == STEREOPHONIC)
//			fwriteShortLSB(sampleValue, outputFileStream);
	}
	outWav.writeSignal(testTone, numberOfSamples);
}


void manipulate(CWav *inputSignal, int manipulateChoice, const char *outputFile)
{
	float *impulse_response = new float[1000];
	int impulse_size;

	for ( int j = 0; j < 1000; j++ )
		impulse_response[j] = 0;
	

	switch (manipulateChoice) {
		case 0:
			/*  Create an "identity" impulse response.  The output should be
			 the same as the input when convolved with this  */
			impulse_response[0] = 1;
			impulse_size = 1;			
			break;
		case 1: // turn down the volume
			impulse_response[0] = 0.1;
			impulse_response[1] = 0.2;
			impulse_response[2] = 0.1;
			impulse_size = 3;	
			break;
		default:
			for ( int j = 0; j < 1000; j++ )
				impulse_response[j] = 1.0/50;
			impulse_size = 1000;	
			break;
	}

	int output_size = inputSignal->mySignalSize + impulse_size - 1;
	short *output_signal = new short[output_size];
	convolve(inputSignal->my_signal, inputSignal->mySignalSize, impulse_response, impulse_size, output_signal, output_size);
	/*  Calculate the number of sound samples to create,
	 rounding upwards if necessary  */
	int numberOfSamples = output_size;
	
	CWav outWav(outputFile);
	/*  Write the WAVE file header  */
	outWav.writeHeader(inputSignal->myChannels, numberOfSamples, inputSignal->myBitsPerSample,
						inputSignal->mySampleRate);
	outWav.writeSignal(output_signal, numberOfSamples);	
}

void manipulate(CWav *inputSignal, CWav *impulse, const char *outputFile)
{
	int output_size = inputSignal->mySignalSize + impulse->mySignalSize - 1;
	short *output_signal = new short[output_size];
	
	convolve(inputSignal->my_signal, inputSignal->mySignalSize, impulse, output_signal, output_size);
	
	/*  Calculate the number of sound samples to create,
	 rounding upwards if necessary  */
	int numberOfSamples = output_size;
	/*  Open a binary output file stream for writing */
	CWav outWave(outputFile);
	outWave.writeHeader(inputSignal->myChannels, numberOfSamples, inputSignal->myBitsPerSample,
									inputSignal->mySampleRate);

	outWave.writeSignal(output_signal, numberOfSamples);
}

void convolve(short x[], int N, float *h, int M, short y[], int P) {
	int n, m;
	/*	Make sure the output buffer is the right size: P = N + M - 1	*/ 
	if (P != (N + M - 1)) {
		printf("Output signal vector is the wrong size\n"); printf("It is %-d, but should be %-d\n", P, (N + M - 1)); printf("Aborting convolution\n"); return;
	}
	/* Clear the output buffer y[] to all zero values */ 
	memset(y, 0, P*sizeof(short));
	/* Do the convolution */ /* Outer loop: process each input value x[n] in turn */ 
		/* Inner loop: process x[n] with each sample of h[] */ 
	for (n = 0; n < N; n++) {
		for (m = 0; m < M; m++)
			y[n+m] += (short)(x[n] * h[m]);
	}
}

void convolve(short x[], int N, CWav *impulse, short y[], int P) {
	/*	Make sure the output buffer is the right size: P = N + M - 1	*/ 
	if (P != (N + impulse->mySignalSize - 1)) {
		printf("Output signal vector is the wrong size\n"); printf("It is %-d, but should be %-d\n", P, (N + impulse->mySignalSize - 1)); printf("Aborting convolution\n"); return;
	}
	float *h = new float[impulse->mySignalSize];
	int powBPS = pow(2,impulse->myBitsPerSample);
	for ( int i = 0; i < impulse->mySignalSize; i++ ) // normalizing the impulse
		h[i] = (float)impulse->my_signal[i] / powBPS;
	
	convolve(x, N, h, impulse->mySignalSize, y, P);
}



