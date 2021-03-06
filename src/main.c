// SPDX-License-Identifier: GPL-3.0
/*
 * Copyright (C) 2020 Henrique de Moura Sinezio
 *
 * Author: Henrique de Moura Sinezio <henriquedemourasinezio@gmail.com>
 *
 * main.c:	runs the game
 *
 */

/* System libraries*/
#include <stdio.h>		// printf() and scanf()
#include <stdlib.h>		// srand() and rand(); EXIT_SUCCESS and EXIT_FAILURE
#include <time.h>		// time()
#include <errno.h>		// error handling

/* Private libraries*/
#include "main.h"
#include "roundmec.h"

/* Global variables */
char *choices[3] = {"Paper", "Rock", "Scissors"};

int main(void)
{
	/*Prepare main game variables*/
	char *input = malloc(BUFFER_SIZE * sizeof(char));

	if (!input)
		return -ENOMEM;
	int gamer_choice = 0, machine_choice = 0;
	// int round_point = 0; for future implementation
	/* Intializes random number generator */
	time_t t;

	srand((unsigned int)time(&t));

	/* Gets main player move */
	while (verify_input(&gamer_choice)) {
		display_choices();
		gamer_choice = get_input(input);
	}

	/* Compute machine move */
	run_round_against_machine(&gamer_choice, &machine_choice, choices);

	/* TO BE ADD: Compute game and annouce winner */
	//round_point = announce_round_winner(&gamer_choice, &machine_choice);
	//#if DEBUG == 1
	//	printf("DEBUG: Round_point: %d\n", round_point);
	//#endif

	/* Memory Deallocation*/
	free(input);

	return EXIT_SUCCESS;
}
