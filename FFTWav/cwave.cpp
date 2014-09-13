/******************************************************************************
 *     
 *     Description:   Read a WAV file
 *
 *     Author:        Mohsen Alimomeni
 *
 *     Date:          November 21, 2009
 *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <fstream>
#include <iostream>

#include "cwave.h"

using namespace std;

CWav::CWav(const char *filename)
{
	outStream = fopen(filename, "wb");
}

CWav::~CWav()
{
	fclose(outStream);
}

void CWav::readInput(char *filename)
{
	
	ifstream inFile( filename, ios::in | ios::binary);
	//printf("Reading wav file...\n"); // for debugging only
	inFile.seekg(4, ios::beg);
	inFile.read( (char*) &myChunkSize, 4 ); // read the ChunkSize
	
	inFile.seekg(16, ios::beg);
	inFile.read( (char*) &mySubChunk1Size, 4 ); // read the SubChunk1Size
	
	//inFile.seekg(20, ios::beg);
	inFile.read( (char*) &myFormat, sizeof(short) ); // read the file format.  This should be 1 for PCM
	
	//inFile.seekg(22, ios::beg);
	inFile.read( (char*) &myChannels, sizeof(short) ); // read the # of channels (1 or 2)
	
	//inFile.seekg(24, ios::beg);
	inFile.read( (char*) &mySampleRate, sizeof(int) ); // read the samplerate
	
	//inFile.seekg(28, ios::beg);
	inFile.read( (char*) &myByteRate, sizeof(int) ); // read the byterate
	
	//inFile.seekg(32, ios::beg);
	inFile.read( (char*) &myBlockAlign, sizeof(short) ); // read the blockalign
	
	//inFile.seekg(34, ios::beg);
	inFile.read( (char*) &myBitsPerSample, sizeof(short) ); // read the bitspersample
	
	inFile.seekg(40, ios::beg);
	inFile.read( (char*) &myDataSize, sizeof(int) ); // read the size of the data
	
	
	// read the data chunk
	myData = new char[myDataSize];
	inFile.seekg(44, ios::beg);
	inFile.read(myData, myDataSize);
	
	inFile.close(); // close the input file
	
	my_signal = NULL;
	
	if ( myBitsPerSample == 8 )
	{
		mySignalSize = myDataSize;
		my_signal = new short[mySignalSize];
		for ( int i = 0; i < myDataSize; i++ )
			my_signal[i] = (short)( (unsigned char) myData[i] );
		
	}
	else {
		mySignalSize = myDataSize / 2;
		my_signal = new short[mySignalSize];
		short val;
		for ( int i = 0; i < myDataSize; i+=2 )
		{
			val = (short)( (unsigned char) myData[i] );
			val += (short)( (unsigned char) myData[i+1] ) * 256;
			my_signal[i/2] = val;
		}
	}
}

/******************************************************************************
 *
 *       function:       writeHeader
 *
 *       purpose:        Writes the header in WAVE format to the output file.
 *
 *		arguments:		channels:  the number of sound output channels
 *						numberSamples:  the number of sound samples
 *                       outputRate:  the sample rate
 *						outputFile:  the output file stream to write to
 *                       
 *       internal
 *       functions:      fwriteIntLSB, fwriteShortLSB
 *
 *       library
 *       functions:      ceil, fputs
 *
 ******************************************************************************/
void CWav::writeHeader(int channels, int numberSamples, int bitsPerSample,
						 double outputRate)
{
	/*  Calculate the total number of bytes for the data chunk  */
	int dataChunkSize = channels * numberSamples * (bitsPerSample / 8);
	
	/*  Calculate the total number of bytes for the form size  */
	int formSize = 36 + dataChunkSize;
	
	/*  Calculate the total number of bytes per frame  */
	short int frameSize = channels * (bitsPerSample / 8);
	
	/*  Calculate the byte rate  */
	int bytesPerSecond = (int)ceil(outputRate * frameSize);
	
	/*  Write header to file  */
	/*  Form container identifier  */
	fputs("RIFF", outStream);
	
	/*  Form size  */
	fwriteIntLSB(formSize);
	
	/*  Form container type  */
	fputs("WAVE", outStream);
	
	/*  Format chunk identifier (Note: space after 't' needed)  */
	fputs("fmt ", outStream);
	
	/*  Format chunk size (fixed at 16 bytes)  */
	fwriteIntLSB(16);
	
	/*  Compression code:  1 = PCM  */
	fwriteShortLSB(1);
	
	/*  Number of channels  */
	fwriteShortLSB((short)channels);
	
	/*  Output Sample Rate  */
	fwriteIntLSB((int)outputRate);
	
	/*  Bytes per second  */
	fwriteIntLSB(bytesPerSecond);
	
	/*  Block alignment (frame size)  */
	fwriteShortLSB(frameSize);
	
	/*  Bits per sample  */
	fwriteShortLSB(bitsPerSample);
	
	/*  Sound Data chunk identifier  */
	fputs("data", outStream);
	
	/*  Chunk size  */
	fwriteIntLSB(dataChunkSize);
}

void CWav::writeSignal(short *outputSignal, int numberSamples)
{
	for (int i = 0; i < numberSamples; i++ )
		fwriteShortLSB(outputSignal[i]);
	
	fflush(outStream);
}

/******************************************************************************
 *
 *       function:       fwriteIntLSB
 *
 *       purpose:        Writes a 4-byte integer to the file stream, starting
 *                       with the least significant byte (i.e. writes the int
 *                       in little-endian form).  This routine will work on both
 *                       big-endian and little-endian architectures.
 *
 *       internal
 *       functions:      none
 *
 *       library
 *       functions:      fwrite
 *
 ******************************************************************************/
size_t CWav::fwriteIntLSB(int data)
{
	unsigned char array[4];
	
  array[3] = (unsigned char)((data >> 24) & 0xFF);
  array[2] = (unsigned char)((data >> 16) & 0xFF);
  array[1] = (unsigned char)((data >> 8) & 0xFF);
  array[0] = (unsigned char)(data & 0xFF);
  return fwrite(array, sizeof(unsigned char), 4, outStream);
}

/******************************************************************************
 *
 *       function:       fwriteShortLSB
 *
 *       purpose:        Writes a 2-byte integer to the file stream, starting
 *                       with the least significant byte (i.e. writes the int
 *                       in little-endian form).  This routine will work on both
 *                       big-endian and little-endian architectures.
 *
 *       internal
 *       functions:      none
 *
 *       library
 *       functions:      fwrite
 *
 ******************************************************************************/
size_t CWav::fwriteShortLSB(short int data)
{
  unsigned char array[2];
	
  array[1] = (unsigned char)((data >> 8) & 0xFF);
  array[0] = (unsigned char)(data & 0xFF);
  return fwrite(array, sizeof(unsigned char), 2, outStream);
}


