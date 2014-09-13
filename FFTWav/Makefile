CXXFLAGS = -ffast-math -O3 -Wall -fmessage-length=0

OBJS =	dsp.o cwave.o dftfft.o 

LIBS =

TARGET = convolve	

$(TARGET):	$(OBJS)
	$(CXX) -pg -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
