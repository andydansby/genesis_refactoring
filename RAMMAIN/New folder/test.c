//assembly files are in ramMain.asm as indicated by ramMain.lst


#include <arch/zx.h>
#include <stdio.h>//standard input output

#include "externs.h"
#include "ramMain.h"
// bankswitching code here

//#include <compress/zx7.h>//try to switch to zx7 in the future
#include <compress/aplib.h>


#include "engine.h"
//engine.h is FOUND in RAMMAIN
//ATTENTION, this has many hard coded addresses that need to be resolved

#include "constants.h"
//ATTENTION, this has many hard coded addresses that need to be resolved

#include "variables.h"

#include "structs.h"



//-----------
#include "utils.h"

#include "wyzplayer.h"

#include "levelutils.h"

#include "movement.h"

#include "graphicutils.h"
#include "collision.h"

#include "displayloop.h"//used to display sprites and screen in game loop

#include "mainmenu.h"

#include "playercontrols.h"


	
/*
#include "movement.h"
//my includes
#include "variables.h"
#include "utils.h"
#include "playercontrols.h"
#include "wyzplayer.h"
#include "levelutils.h"
#include "graphicutils.h"
#include "collision.h"
#include "displayloop.h"//used to display sprites and screen in game loop
*/


//#include "mainmenu.h"
//#pragma output STACKPTR=24600



void initilizeVariables(void)
{
	unsigned char ship_x;
	unsigned char ship_y;
	unsigned char map_xpos;
	unsigned char map_displacement;
	unsigned char max_shoots;
	unsigned char frames_to_shoot;
//	unsigned char current_screen;
	
	char speed_x;
	char speed_y;
	
	// init everything
	ship_x=ship_y=map_xpos=map_displacement=0;
	speed_x=speed_y=frames_to_shoot=0;
	 
//	current_screen = 7;
	//used for Page flipping shadow screen
	//when used with xor 2 will flipflop from bank 7 to bank 5
	 
	max_shoots=4;
	 
	map_displacement = 0;
	map_xpos = 0;
}



//try to move this to uncontended RAM
void interupt (void)
{
	//35826 ON 1output.tap
	//27758 on 1x.tzx
	//only seems to run once at the start of the level before game start
	//in other versions runs in contended RAM
	
	interuptSetup();//found in externs.h - points to ramlow.asm
}



void spriteCache (void)
{
	//initialize sprite cache list
	//__asm
	//	call InitSprCacheList
	//	;// ATTENTION PROBLEM
	//__endasm

/*	
__asm
	halt
	call _borderTest
__endasm
*/
	
	InitSprCacheList();
	
	
}


void gamesetup(void)
{
	
	
	wyz_load_music(0);//seems ok
	
	
	load_level(0);//crashs
	
	
	
	load_background();	
	
	
	clear_screen();
	
	
	initilizeVariables();
	
	
	interupt();
	//interuptSetup();//found in externs.h - points to ramlow.asm

	spriteCache();
}

void junkLoop (void)
{
	for(;;)
	{
__asm
	;;halt
	call _borderTest
__endasm		
	}

}

void testloop (void)
{
	for(;;)
	{
		
		
		
		display_loop();
		
		map_displacement ++;
		
		if (map_displacement > 0xb)
		{
			map_displacement = 0;
			map_xpos++;
		}
		
		
		//borderTest();
	}
}



void gameloop(void)
{

	for(;;)
	{
		//display_loop0();// drawing routines for map, calling sprites and music play
		//found in displayloop.h
		
/*__asm
	halt
	call _display_loop
__endasm*/



	testloop();

	//display_loop();


		
		//display_loop();
		
		
		// tester to place in endless loop with border color

		if(joy & JOY_UP)
		{
			if(speed_y > -4) speed_y --;
		}
		else if(joy & JOY_DOWN)
		{
			if(speed_y < 4) speed_y ++;
		}
		else if(speed_y > 0) speed_y--;	// No keys pressed, decrease speed
		else if(speed_y < 0) speed_y++;


		if(joy & JOY_LEFT)
		{
			if(speed_x > -4) speed_x --;
		}
		else if(joy & JOY_RIGHT)
		{
			if(speed_x < 4) speed_x++;
		}
		else if(speed_x > 0) speed_x--;
		else if(speed_x < 0) speed_x++;

		if (joy & JOY_FIRE)
		{
			if (!frames_to_shoot)
			{
				NewShoot(ship_x+32, ship_y,0);
				frames_to_shoot=5;
			}
		}

		// Update ship speed if needed

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

		// Move map to new position
		map_displacement++;
		if (map_displacement > 0xb)
		{
			map_displacement = 0;
			map_xpos++;
		}

		// Move active enemies and shoots
		for(i=0;i<MAX_ENEMIES;i++)
		{
			if (active_enemies[i].sprnum)	// This enemy is active
			{
				(movement_funcs[active_enemies[i].movement])(&active_enemies[i]); 
			}

			if (my_active_shoots[i].sprnum)	// This shoot is active
			{
				(movement_funcs[my_active_shoots[i].movement])(&my_active_shoots[i]);
			}

			if (enemy_active_shoots[i].sprnum)	// This enemy shoot is active
			{
				(movement_funcs[enemy_active_shoots[i].movement])(&enemy_active_shoots[i]);
			}
		}
		// Activate/deactivate new enemies

		while(enemy_locations[new_enemy].x < (map_xpos+11))
		{
			NewEnemy(&enemy_locations[new_enemy]);
			new_enemy++;
		}

		// Process shoots
		if (frames_to_shoot) frames_to_shoot--; // Less time to wait
		
		for(i=0;i<max_shoots;i++)
		{
			if (my_active_shoots[i].sprnum)	// This shoot is active
			{
				dummy_b = shoot_hits_enemy(&(my_active_shoots[i]));
				
				if(dummy_b != 255)	// This shoot has hit an enemy
				{
					active_enemies[dummy_b].sprnum=4;	// exploding!
					
					active_enemies[dummy_b].movement=MOVE_EXPLOSION;
					
					my_active_shoots[i].sprnum = 0;
				}
			}
		}

		// Check collisions with enemies	 
		dummy_b = enemy_hits_ship();
		if(dummy_b != 255) 
		{
			__asm
				ld a, 4
				out ($fe), a
			__endasm
		}
		else
		{
			__asm
				ld a, 0
				out ($fe), a
			__endasm  
		}
	}

}


void main(void)
{
	//mainMenu();
	//mainMenuSelection();

	gamesetup();

	
	
	//ATTENTION
	//working on this loop now
	gameloop();
	
	
	

	for (i = 0 ;i < MAX_ENEMIES; i++)
	{
		active_enemies[i].sprnum=my_active_shoots[i].sprnum=enemy_active_shoots[i].sprnum=0;
	}
	
	// Activate enemies
	new_enemy=0;
	
	//ATTENTION commented out for troubleshooting
	
	//causes program to hang
	/*while(enemy_locations[new_enemy].x < 11)
	{
		NewEnemy (&enemy_locations[new_enemy]);
		new_enemy ++;
	}*/


	

}


