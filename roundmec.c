#include "roundmec.h"

int verify_input(int* gamer_choice)
{
	return (*gamer_choice != 1) && (*gamer_choice != 2) && (*gamer_choice != 3) ? 1 : 0;
}

void display_choices(void)
{
	CLEAR_TERMINAL(); 
	printf("Welcome to paper-rock-scissors!\n\n");
	printf("What do you want to play?\n");
	printf("1. Paper\n2. Rock\n3. Scissors\n");
}

int get_input(char* input)
{
	int gamer_choice = 0;
	memset(input, 0, sizeof(input)); // reset buffer

	/* Verify input */
	if (isdigit(scanf("%s", input)) == 0)
	{
		gamer_choice = atoi(input);
		if ((gamer_choice < 0) || (gamer_choice > 3))
			gamer_choice = 0;
	}
	return gamer_choice;
}

void run_round_against_machine(int* gamer_choice, int* machine_choice, char** choices)
{
	CLEAR_TERMINAL(); 
	
	*machine_choice = (rand() % 3) + 1;

	printf("You chose %s.\n", choices[*gamer_choice-1]);
	printf("The machine chose %s!\n", choices[*machine_choice-1]);
	printf("[...]\n");
}

int announce_round_winner(int* gamer_choice, int* machine_choice)
{
	if (*gamer_choice == *machine_choice)
	{
		printf("Draw!\n");
		return 0;
	} 
	else if (  ((*gamer_choice == 0) && (*machine_choice == 1)) 
			|| ((*gamer_choice == 1) && (*machine_choice == 2)) 
			|| ((*gamer_choice == 2) && (*machine_choice == 0))) 
	{
		printf("You win.\n");
		return 1;
	}
	else
	{
		printf("You lose.\n");
		return -1;
	}
}