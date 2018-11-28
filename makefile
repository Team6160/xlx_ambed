CXX=g++
CFLAGS=-Os -Wall -std=c++11 -pthread
LDFLAGS=-Os -Wall -std=c++11 -pthread 
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=ambed

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(OBJECTS) -lftd2xx -Wl,-rpath,/usr/local/lib -o $@

.cpp.o:
	$(CXX) $(CFLAGS) -c -o $@ $<

clean:
	$(RM) xlxd *.o *.d *.bak

install:
	cp $(EXECUTABLE) /usr/local/bin/
	cp ~/Systemd/ambed.service /lib/systemd/system/
	cp ~/Systemd/ambed.timer /lib/systemd/system/
