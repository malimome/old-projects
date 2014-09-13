Author: Mohsen Alimomeni

Summary of changes for optimization:
• Profiling and time measurement:
Added profiling and time measurements:
Added gprof (-pg) to g++ compiler
Added clock() function to measure timing of the main function convolve (or manipulate)
clock_t start = clock();
convolveFreq(inputSignal, impulse, "outfft1.wav");
clock_t time = clock() - start;
cout << "Time took to run convolveFreq is roughly " << time << " CPU cycles or " << (double)time/CLOCKS_PER_SEC << " seconds or "
<<
(double)time/(CLOCKS_PER_SEC*60) << " minutes " << endl;

•
Algorithm-based optimization: (revision 4)
Adding support for convolution in frequency domain using the FFT algorithm to compute DFT.
The main function added is convolveFreq. This function calculates the convolution of two audio signals with FFT.
The output file for the convolution of the two signals is named "outfft.wav".
Regression test is done and the two wav files play the same music.
Timing is measured for both algorithms and the average results are as follows:
1- In time domain: Convolution took roughly 78 seconds.
1- In frequency domain: Convolution took roughly 0.85 seconds.
The results of gprof also admit this.

•
Manual code tunning:
1- (revision 3) Move all WAVE related function to Cwav class. Functions such as writeHeader, writeSignal, writeIntLSB, ..
2- (revision 5) in convolveFreq function:
Replacing two for loops with faster function that can perform the same task, i.e. memset.
3- (revision 5) in convolveFreq function:
Put calculations that result in a constant before the loop (that is powBPS: pow(2, BITS_PER_SEC))
These two modification resulted in minor performance optimization.
Average time took for this function before optimization: 0.85 seconds
Average time took for this function after optimization: 0.83 seconds
4- (revision 7) Optimization: Joining two for loops together and do the calculation in one loop.
Result:
There was an overhead of roughly 5 seconds. So this change decreased the performance.
Convolution in Time domain took around 77 seconds, but before this change it was 72 second.
5- (revision 11)
Minimize work inside loops
Put calculations that resutl in a constant before the loop
in fft function, isign is multiplied before the while loop, making it faster
Result: In average, I had 0.05 seconds of faster code.

• Compiler-level optimization:
Time took when no compiler options were given to perform both Time and Frequency domain operations:
152 second for Time domain and 1.9 seconds for frequency domain.
Time took when the following compiler options were given to perform both Time and Frequency domain operations: -O3 -
ffast-math (the second option is not enabled in -O3)
70 second for Time domain and 0.75 seconds for frequency domain.
In both cases, regression test was successful.
So by the above results: The final version has "-O3 -ffast-math" options.
output of gprof on final version: (in file gprof.out)

Added Stereo support for both impulse and input audio.
The function convolveFreq2 was added to compute the effect of a stereo impulse on a stereo signal.
