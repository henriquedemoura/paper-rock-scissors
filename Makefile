# -*- MakeFile -*-

#target: dependencies
#	actions

all: rock-paper-scissors.play assemblers

# link main.o and roundmec.o
rock-paper-scissors.play: bin/main.o bin/roundmec.o
	gcc bin/main.o bin/roundmec.o -o rock-paper-scissors.play

# preprocess, compile and assemble main.c
bin/main.o: src/main.c
	gcc -c src/main.c -I headers -o bin/main.o

# preprocess, compile and assemble roundmec.c and roundmec.h
bin/roundmec.o: src/roundmec.c headers/roundmec.h
	gcc -c src/roundmec.c -I headers -o bin/roundmec.o

# remove all .o that builds rock-paper-scissors.play
clean:
	rm bin/*.o assembly/*.s rock-paper-scissors.play

# create the assembler file of all .c
assemblers:
	gcc -S src/roundmec.c -I headers -o assembly/roundmec.s
	gcc -S src/main.c -I headers -o assembly/main.s