
//main.bin: main.c movement.o behavior.o engine.h movement.h behavior.h structs.h constants.h sprdefs.h
//	zcc +zx -vn -O3 -zorg=24600 main.c movement.o behavior.o -lndos -o main.bin -m

//movement.o: movement.c structs.h
//	zcc +zx -vn -O3 -c movement.c -m

//behavior.o: behavior.c structs.h
//	zcc +zx -vn -O3 -c behavior.c -m

//engine.bin: engine.asm  input.asm rambanks.asm drawmap.asm drawsprite.asm create_shifted_tables.asm im2.asm starfield.asm
//	pasmo engine.asm engine.bin engine.sym


//#define MAX_ENEMIES 8 move to variables as const
static const unsigned char MAX_ENEMIES;



#include <arch/zx.h>
#include <input.h>
#include <stdlib.h>//standard library
#include <string.h>
//#include <compress/aplib.h>
#include <compress/zx7.h>

#include "structs.h"//
#include "movement.h"//
#include "behavior.h"//
#include "constants.h"//
#include "sprdefs.h"//
#include "engine.h"

#include "variables.h"
#include "main.h"



//1052 of test.c
void activate_final_enemy(void)
{
	if(!fenemy_activation_counter)
	{
		__asm
			di
			push bc
			ld b, 4
			call _setrambank		; Levels in RAM4
			pop bc
		__endasm
	}
	level_pointer=(unsigned char*)finalenemy_address[current_level];
	dummy_i = final_enemy_components = *(level_pointer)++;	// Load the basic final enemy data
	// Copy to enemy table (we are overwriting, which should not be a problem)
	dummy_i *= sizeof (struct Enemy);
	
	__asm
		ld de, (_enemy_locations)
		ld hl, (_level_pointer)
        ld bc, (_dummy_i)
        ldir
	__endasm
	
	__asm
		extern _active_enemies;; ATTENTION Coming in from another bank
		
		ld a, (_final_enemy_components)
		ld b, a
		
		ld hl, _active_enemies
		
		ld de, (_enemy_locations)
	.initfenemyloop
		ld a, (de)		; fenemy->x
		ld (hl), a		; active_enemies[i].x=fenemy->x;
		inc hl
		inc de
		inc de
		ld a, (de)		; fenemy->y
		ld (hl), a		; active_enemies[i].y=fenemy->y;
		inc hl
		inc de
		ld (hl), EXPLOSION_SPR	;active_enemies[i].sprnum=EXPLOSION_SPR;	
		inc hl
		ld a, (de)		; fenemy->enemy_type
		ld (hl),a		; active_enemies[i].type= fenemy->enemy_type;
		inc hl
		inc de	
		ld (hl), MOVE_EXPLOSION		; active_enemies[i].movement=MOVE_EXPLOSION;
		inc hl
		inc de
	;	ld a, (de)		; 	fenemy->energy;
	;	ld (hl), a		; active_enemies[i].energy = fenemy->energy;
		ld (hl), 0		; active_enemies[i].energy = 0, so the enemy is only vulnerable after the explosions
		inc hl
		inc de
		ld (hl), 4		;active_enemies[i].param1=4;  
		inc hl
		inc de
		ld a, (de)
		ld (hl), a		; active_enemies[i].param2=fenemy->param2;
		inc hl
		inc de			; DE now points to the next enemy
		ld (hl), 0		; active_enemies[i].param3=0;
		inc hl
		ld (hl), 0		; active_enemies[i].param4=0;
		inc hl
		ld (hl), BEHAV_DO_NOTHING ;	 active_enemies[i].behavior = BEHAV_DO_NOTHING;
		inc hl
		ld (hl), 0		; active_enemies[i].behav_param=0;
		inc hl			; HL now points to the next enemy
		djnz initfenemyloop
	__endasm
	
}



//2212 of test.c
void gameloop(void)
{
	 while(mayday < 7)
	{
	}
}




void main(void)
{
	//clean_screen_asm();
	//while (1);
}


