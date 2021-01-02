/* System libraries*/
#include <stdio.h> 		// printf() and scanf()
#include <stdlib.h> 	// srand() and rand(); EXIT_SUCESS and EXIT_FAILURE
#include <time.h> 		// time()

/* Private libraries*/
#include "roundmec.h"

/* Definitions */
#define DEBUG 0
#define BUFFER_SIZE 40

/* Global variables */
char* choices[3] = {"Paper", "Rock", "Scissors"};

int main (void) 
{
	/*Prepare main game variables*/
	char* input = malloc(BUFFER_SIZE * sizeof(char));
	int gamer_choice = 0, machine_choice = 0;
	int round_point = 0;
	/* Intializes random number generator */
	time_t t;
	srand((unsigned) time(&t));

	/* Gets main player move */
	while (verify_input(&gamer_choice))
	{

		display_choices();

		gamer_choice = get_input(input);

	}

	/* Compute machine move */
	run_round_against_machine(&gamer_choice, &machine_choice, choices);

	/* Compute game and annouce winner */
	round_point = announce_round_winner(&gamer_choice, &machine_choice);
	#if DEBUG == 1
		printf("DEBUG: Round_point: %d\n", round_point);
	#endif

	/* Memory Deallocation*/
	free(input);

	return EXIT_SUCCESS;
}