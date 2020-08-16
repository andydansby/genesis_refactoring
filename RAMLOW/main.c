//assembly files are in ramMain.asm as indicated by ramMain.lst
//#pragma output CRT_ORG_CODE = 24200

//https://github.com/fjpena/genesis-zx

#define MAX_ENEMIES 8


struct Entity
{
	unsigned char x;
	unsigned char y;
	unsigned char sprnum;	// Number of the entity sprite: if 0, this entity is not active
	unsigned char movement;	// movement type, from one of the predefined ones
	unsigned char energy;
	unsigned char param1;
	unsigned char param2;	// Two parameters, to store some information that is entity-specific
};

struct Enemy
{
	unsigned char x;        // Tile in X
	unsigned char x_desp;   // Displacement in tile (0-23)
	unsigned char y;        // Y position
	unsigned char sprnum;	// Number of the enemy sprite: if 0, this enemy is not active
	unsigned char movement;	// movement type, from one of the predefined ones
	unsigned char energy;
	unsigned char param1;
	unsigned char param2;	// Two parameters, to store some information that is entity-specific
};
/* This is a clone of the Entity structure, just for the enemy_locations array. 
 It adds a parameter for displacement within tile!
ATTENTION - HARD coded addresses*/

/* Array of enemy locations in the game
	We use the same Entity structure, with just one difference: X now means the tile
	up to 128 enemies per level, 8 bytes per enemy: 1K*/
struct Enemy enemy_locations[128] = 0;

struct Entity active_enemies[MAX_ENEMIES] = 0;//x,y,sprnum,movement,energy,param1,param2]

struct Entity my_active_shoots[MAX_ENEMIES] = 0;//x,y,sprnum,movement,energy,param1,param2


struct Entity enemy_active_shoots[MAX_ENEMIES] = 0;

struct Entity *current_e = 0;	// Useful for functions needing a global variable...

#include <arch/zx.h>
#include <stdio.h>//standard input output
#include <input.h>
#include <stdlib.h>//standard library

#include <intrinsic.h>//temp to place labels
//powerful troubleshooting tool


#include "engine.h"
//engine.h is FOUND in RAMMAIN


//#include "structs.h"
#include "variables.h"


#include "externs.h"

#include "wyzplayer.h"

//ATTENTION, NEED TO CHECK
//#include "externs.h"
//#include "ramMain.h"
// bankswitching code here

//#include <compress/zx7.h>//try to switch to zx7 in the future
//#include <compress/aplib.h>

#include "levelutils.h"
#include "graphicutils.h"


//__fastcall__ fastcall
//Fastcall linkage allows one parameter to be passed by register in a subset of DEHL.  So if the parameter is 8-bit, the value will be in L.  If the parameter is 16-bit, the value is in HL and if it is 32-bit the value is in DEHL.



//extern void __FASTCALL__ interuptSetup(void);

extern void __FASTCALL__ screenLoop(void);

extern void __FASTCALL__ DrawGameMap (void);


extern void __FASTCALL__ InitSprCacheList (void);

extern void __FASTCALL__ ScreenSwitchFlipFlagNO (void);
extern void __FASTCALL__ ScreenSwitchFlipFlagYES (void);

extern void __FASTCALL__ colorPlayScreen(unsigned char color);

void initilizeVariables(void)
{
	//set game start variables
	//including lives, energy etc
	//where we set up score, lives, energy etc.
	ship_x = 0;
	ship_y = 0;
	map_xpos = 0;
	map_displacement = 0;
	
	speed_x = 0;
	speed_y = 0;
	frames_to_shoot = 0;
	
//	current_screen = 7;//which screen to flip flop to (shadow screen)
	//used for Page flipping shadow screen
	//when used with xor 2 will flipflop from bank 7 to bank 5
	max_shoots = 4;
	

	level_pointer = 0;
	
	
	for (i = 0; i < MAX_ENEMIES; i++);
	{
		active_enemies[i].sprnum = 0;
		my_active_shoots[i].sprnum =0;
		enemy_active_shoots[i].sprnum = 0;
	}
	
	// Activate enemies
	new_enemy = 0;
	
	//this is causing hangup
	while(enemy_locations[new_enemy].x < 11)
	{
		NewEnemy(&enemy_locations[new_enemy]);
		new_enemy++;
	}

	
	
	
}


void gamesetup(void)
{
	
	__asm
;;	halt
	__endasm
	
	//ATTENTION disabled for now
	//wyz_load_music(0);
	
	//setup r register
	//asm routine 1
	
	initilizeVariables();
	
	
	
	

	
	load_level(0);//
	//ATTENTION
	//levels 0 OK
	
	//-------------------------------------
	// FF	BB	P2	P1	P0	I2	I1	I0
	//BLACK		000		= 0
	//BLUE		001		= 1
	//RED		010		= 2
	//MAGENTA	011		= 3
	//GREEN		100		= 4
	//CYAN		101		= 5
	//YELLOW	110		= 6
	//WHITE		111		= 7
	// 5 = black paper cyan ink
	colorPlayScreen(5);// colors the attribues in the top 2/3's of the attributes to a color
//	colorPlayScreen(0b00000101);
	//(0b00001101);
	//-------------------------------------




//pay attention to _MAP_START $8000	/ 32768
// place Breakpoint to #9001 / 36865
}

void endlessLoop()
{
	// error happens at #8A8A push hl to 8AA4 ret
	// then flows to 8aa5 to 8C62
	
	//while in bank 0
	
	while (1)
	{
		__asm
		nop
		__endasm
	}
}


//breakpoints
//ScreenSwitchFlipFlagNO	$6582
//ScreenSwitchFlipFlagYES	$6589
//screenLoop				$67D3
//DrawGameMap				$67A6
//_DrawMap					$9001
//_gameloop					$654D

//ScreenSwitchFlipFlagNO ();//$6585
//ScreenSwitchFlipFlagYES ();//$658C

//_gameloop
void gameloop (void)
{

	while (1)
	{
		//with im2 off, uncomment below
		//ScreenSwitchFlipFlagNO ();//$6585
		
		
		//_screenLoop
		screenLoop();
		
		//joystick controls go here
		
		
		
		// Move map to new position
		/*map_displacement++;
		if (map_displacement > 0xb)
		{
			map_displacement = 0;
			map_xpos++;
		}*/
		
		//with im2 off, uncomment below
		//ScreenSwitchFlipFlagYES ();//$658C
		
		
	}//end while
	
	
/*__asm
call _borderTest
;;halt
__endasm*/

	// Update ship speed if needed
	/*
		ship_x += speed_x;
		if (ship_x > 224)
		{
			if(speed_x > 0) ship_x = 224;
				else ship_x=0;
		}
		ship_y += speed_y;
		
		if (ship_y > 112)
		{
			if(speed_y > 0) ship_y = 112;
				else ship_y=0;
		}

		map_displacement++;
		if (map_displacement > 0xb)
		{
			map_displacement = 0;
			map_xpos++;
		}*/
}

//_screenLoop
//_main	main_c, code_compiler, main.c:1022
//$650D
void main(void)
{
__asm
	

	extern _Set_screen_flip_flag
	extern _Interrupt_setup
	
	;;identifing marker to see where in memory MAIN is located

	call _Set_screen_flip_flag
	
	nop;//used as a marker
	
	
	call _Interrupt_setup
	
	nop;//used as a marker
__endasm
	
	////interuptSetup();//ISRSetup();

	////mainMenu();
	////mainMenuSelection();
	
	
	//InitSprCacheList();
	//spriteCache();	//call $654B
	//_DrawMap routine OK here
	
	load_background();
	
	
	clear_screen();
	
	

	gamesetup();
	//make sure to check that load_level doesn't wreck $9000
	
//	endlessLoop();

	gameloop();
}

//IMPORTANT need to have blank line at very end

