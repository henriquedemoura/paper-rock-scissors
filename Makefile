# -*- MakeFile -*-

#target: dependencies
#	actions

# link main.o and roundmec.o
rock-paper-scissors.play: main.o roundmec.o
	gcc main.o roundmec.o -o rock-paper-scissors.play

# preprocess, compile and assemble main.c
main.o: main.c
	gcc -c main.c

# preprocess, compile and assemble roundmec.c and roundmec.h
roundmec.o: roundmec.c roundmec.h
	gcc -c roundmec.c

# remove all .o that builds rock-paper-scissors.play
clean:
	rm *.o rock-paper-scissors.play

# create the assembler file of all .c
assemblers:
	gcc -S *.c 