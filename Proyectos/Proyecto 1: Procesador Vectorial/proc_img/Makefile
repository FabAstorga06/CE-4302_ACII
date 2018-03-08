CC = gcc
CFLAGS = -g -Wall
SRC = image_proc.c
PROG = img

OPENCV = `pkg-config opencv --cflags --libs`
LIBS = $(OPENCV)

$(PROG):$(SRC)
				$(CC) $(CFLAGS) -o $(PROG) $(SRC) $(LIBS)

clean:
				rm -f *.o $(PROG)
