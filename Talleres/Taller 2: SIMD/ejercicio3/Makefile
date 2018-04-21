CC = gcc
CFLAGS = -g -Wall
RM = rm -f
SRC = ejercicio3
OBJS = ejercicio3.o
PROG = mult

all: $(PROG)

$(PROG): $(OBJS)
				$(CC) $(OBJS) -o $(PROG)

$(OBJS): $(SRC).c
				$(CC) $(CFLAGS) -c $(SRC).c

clean:
				$(RM) $(PROG) $(OBJS)
