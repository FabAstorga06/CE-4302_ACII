CC = gcc
CFLAGS = -g -Wall
RM = rm -f
SRC = ejercicio2
OBJS = ejercicio2.o
PROG = max

all: $(PROG)

$(PROG): $(OBJS)
				$(CC) $(OBJS) -o $(PROG)

$(OBJS): $(SRC).c
				$(CC) $(CFLAGS) -c $(SRC).c

clean:
				$(RM) $(PROG) $(OBJS)
