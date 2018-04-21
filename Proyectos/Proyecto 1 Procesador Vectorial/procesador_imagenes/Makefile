CC = g++
CFLAGS = -g -Wall
SRC = main.cpp
PROG = img

OPENCV = `pkg-config opencv --cflags --libs`
LIBS = $(OPENCV)

$(PROG): $(SRC);	$(CC) $(CFLAGS) -o $(PROG) $(SRC) $(LIBS)

clean:
				rm -f *.o $(PROG)
