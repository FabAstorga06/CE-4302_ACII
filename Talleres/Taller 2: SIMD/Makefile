CC = gcc
CFLAGS = -g -Wall
RM = rm -f
SRC = hello_simd
OBJS = hello_simd.o
PROG = simd

all: $(PROG)

$(PROG): $(OBJS)
				$(CC) $(OBJS) -o $(PROG)

$(OBJS): $(SRC).c
				$(CC) $(CFLAGS) -c $(SRC).c

clean:
				$(RM) $(PROG) $(OBJS)
