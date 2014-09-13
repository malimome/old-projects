
#define PI         3.141592653589793
#define TWO_PI     (2.0 * PI)
#define SWAP(a,b)  tempr=(a);(a)=(b);(b)=tempr

void four1FFT(double data[], int nn, int isign);
void complexDFT(double x[], int N);
void postProcessComplex(double x[], int N);
void convolveFreq(CWav *inputSignal, CWav *impulse, const char *);
void convolveFreq2(CWav *inputSignal, CWav *impulse, const char *);



