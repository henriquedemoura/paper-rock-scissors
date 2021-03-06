/* SPDX-License-Identifier: GPL-3.0 */
/*
 * Copyright (C) 2020 Henrique de Moura Sinezio
 *
 * Author: Henrique de Moura Sinezio <henriquedemourasinezio@gmail.com>
 *
 * main.h:	macros and function prototypes
 *
 */

#ifndef ROUNDMEC_H
#define ROUNDMEC_H

#include <stdio.h>		// printf() and scanf();
#include <stdlib.h>		// rand();
#include <ctype.h>		// isdigit()
#include <string.h>		// memset()

#define CLR_TMR 0

#if CLR_TMR == 1
	#define CLEAR_TERMINAL() printf("\e[1;1H\e[2J");
#else
	#define CLEAR_TERMINAL()
#endif

/* Prototypes */

int verify_input(int *gamer_choice);

void display_choices(void);

int get_input(char *input);

void run_round_against_machine(int *gamer_choice, int *machine_choice, char **choices);

int announce_round_winner(int *gamer_choice, int *machine_choice);

#endif
