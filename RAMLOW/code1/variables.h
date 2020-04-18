#ifndef VARIABLES_H
#define VARIABLES_H

//#define MAX_ENEMIES 8


//define in asm to force placement
// in ramlow.asm

	// Game variables
	unsigned char ship_x = 0;	//unsigned char ship_x;
	unsigned char ship_y = 0;	//unsigned char ship_y;


	char speed_x = 0;	//char speed_x;
	char speed_y = 0;	//char speed_y;


	unsigned char frames_to_shoot = 0;// Can we shoot now?
//unsigned char frames_to_shoot;

	//unsigned char current_screen;//which screen to flip flop to (shadow screen)
	//used for Page flipping shadow screen
	//when used with xor 2 will flipflop from bank 7 to bank 5
	//this is moved to assembly since it is used for screen flipping

	unsigned char map_xpos = 0;	//unsigned char map_xpos;


	unsigned char map_displacement = 0;  // Displacement in tile: 0000YYXX, where XX is the displacement in pixels (0, 1==2, 2==4, 3==6), and YY is the displacement in chars (0-2).	//unsigned char map_displacement;

	unsigned char max_shoots = 1; 	// Maximum number of shoots allowed with the current weapon	//unsigned char max_shoots;





	unsigned char CurLevel_XLength = 0;		// Length in X of the current level

	unsigned char CurLevel_NTiles = 0;		// Number of tiles for the current level

	unsigned int keys[] = {KEY_Q,KEY_A,KEY_O,KEY_P,KEY_SPACE};

	unsigned char joy = 0;	//unsigned char joy;

	unsigned char new_enemy = 0;	//unsigned char new_enemy;

// Loop counters and temporary variables

	unsigned char i = 0;	//unsigned char i;
	unsigned char j = 0;	//unsigned char j;
	unsigned char dummy_b = 0;	//unsigned char dummy_b;
	unsigned int dummy_i = 0;	//unsigned int dummy_i;
	unsigned int dummy_i2 = 0;	//unsigned int dummy_i2;
	unsigned char isrdummy = 0;	//unsigned char isrdummy;



	unsigned int length_tiles = 0;	//unsigned int length_tiles;
	unsigned int length_map = 0;	//unsigned int length_map;

	char shoot_xchar = 0;	//char shoot_xchar;
	char shoot_ychar = 0;	//char shoot_ychar;
	char enemy_xchar = 0;	//char enemy_xchar;
	char enemy_ychar = 0;	//char enemy_ychar;

	int diff_x = 0;
	int diff_y = 0;





	struct Entity active_enemies[MAX_ENEMIES] = 
	{
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0}
	};
//x,y,sprnum,movement,energy,param1,param2
//-------------------------------	
	struct Entity my_active_shoots[MAX_ENEMIES] =
	{
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0}
	};
//x,y,sprnum,movement,energy,param1,param2
//-------------------------------
	
	struct Entity enemy_active_shoots[MAX_ENEMIES] = 
	{
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0}
	};
	
	struct Entity *current_e = 0;	// Useful for functions needing a global variable...

	// Array of enemy locations in the game
	// We use the same Entity structure, with just one difference: X now means the tile
	// up to 128 enemies per level, 8 bytes per enemy: 1K
	struct Enemy enemy_locations[128] = 
	{
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0}
	};


//ATTENTION HARD CODED ADDRESSES
//NEED TO FIX
unsigned int level_address[3] =
{
	0xC000,
	0xC6C7,
	0xCD8E,
	0xD2B9
	
};//level addresses
//_level0map
//_level1map
//_level2map
//_level3map
//level addresses		0xC000,	0xC6C7, 0xCBF2


//ATTENTION HARD CODED ADDRESSES
//NEED TO FIX
unsigned int enemy_address[3]=
{
	0xC65E,
	0xCD25,
	0xD250,
	0xD740
};// Enemy addresses
//_enemies0
//_enemies1
//_enemies2
//_enemies3


/*	extern unsigned int _level1map;//$C000
	extern unsigned int _level2map;//$C6C7
	extern unsigned int _level3map;//$CBF2
	extern unsigned int _level4map;//$D0E2
	extern unsigned int _level5map;//$D0E2
	extern unsigned int _level6map;//$D0E2
	extern unsigned int _level7map;//$D0E2
*/

// Levels have compressed data, let's see how it goes when loading them
//https://www.studytonight.com/c/declaring-and-initializing-pointer.php

	unsigned int *level_pointer = 0;//unsigned char *level_pointer = NULL;
	unsigned int *int_pointer = 0;
	// Array of existing enemies and shoots (max 8 enemies for now)



	
#endif
