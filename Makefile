# -*- MakeFile -*-

#target: dependencies
#	actions

CC=gcc
DEPS = headers
CFLAGS= -I $(DEPS) -Wall

all: rock-paper-scissors.play

# link main.o and roundmec.o
rock-paper-scissors.play: bin/main.o bin/roundmec.o
	$(CC) bin/main.o bin/roundmec.o -o rock-paper-scissors.play

# preprocess, compile and assemble main.c
bin/main.o: src/main.c headers/main.h
	$(CC) -c src/main.c $(CFLAGS) -o bin/main.o

# preprocess, compile and assemble roundmec.c and roundmec.h
bin/roundmec.o: src/roundmec.c headers/roundmec.h
	$(CC) -c src/roundmec.c $(CFLAGS) -o bin/roundmec.o

# remove all .o that builds rock-paper-scissors.play
clean:
	rm bin/*.o rock-paper-scissors.play

# remove all .o that builds rock-paper-scissors.play
cleanall:
	rm bin/*.o assembly/*.s rock-paper-scissors.play

# create the assembler file of all .c
assemblers:
	$(CC) -S src/roundmec.c $(CFLAGS) -o assembly/roundmec.s
	$(CC) -S src/main.c $(CFLAGS) -o assembly/main.s