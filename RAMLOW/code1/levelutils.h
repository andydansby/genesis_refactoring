#ifndef LEVELUTILS_H
#define LEVELUTILS_H



void load_level(unsigned char level)
{
__asm
	di;;33422
	
;//	push bc
;//	ld b, 4
;//	call _BankRam;// Levels in RAM4 levelutils
;//supposed to call setrambank (33672), but it goes to somewhere else in memory
;// call _borderTest
;//	pop bc

__endasm

	bank(4);

	level_pointer = (unsigned int*) level_address[level];
	level_pointer = (unsigned char*)level_address[level];//#601F

	//ld hl,#6CBA (6CBA = level_address = 0)
	//ends with 680B holding info 84 6D (680B = _level_pointer)
	//gold standard routine is #6191
	// in gold standard  ends with hl set to C000
	//ld hl,#75a1  ld hl with address #75a1
	//7591 has 00 C0
	

	CurLevel_NTiles = (*level_pointer)++;
	//#6033
	//ld HL, (#680B) / inc HL
	//ends with A = 0 and placed in 67EA (67EA = _CurLevel_NTiles)



	CurLevel_XLength = (*level_pointer)++;	// Load the basic level data
	int_pointer = (unsigned int*)level_pointer;//604E

	length_tiles = *(int_pointer);
	level_pointer+=2;
	
	int_pointer = (unsigned int*)level_pointer;
	
	length_map = (*int_pointer);//this line causes crash
	
	level_pointer+=2;
	
	// Prepare tiles, preshift them, store them in their final location
	// We will use the map area as decompression buffer
	//remember, we are still in RAM4
	
__asm

EXTERN _depack
EXTERN _MAP_START
EXTERN _CreaTablaTiles




;//ld de, $a000
;//have a feeling the problem is here hard coded addy
;//MAP_START = A000 	defc MAP_START	= $A000
;// in engine.asm
	ld de, _MAP_START	
	ld hl, (_level_pointer)	
	call _depack;;

;//ld de, $a000;;hard coded addy
	ld de, _MAP_START	
	ld a, (_CurLevel_NTiles)
	ld b,a
	
	call _CreaTablaTiles;
__endasm

	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;
		
__asm

EXTERN _depack
	ld de, _MAP_START;// ld de, $a000
	ld hl, (_level_pointer)
	call _depack

;//seems stable to here
__endasm

	// Copy enemy table
	level_pointer=(unsigned char*)enemy_address[level];

	dummy_i = *level_pointer; // Number of enemies in level
	
	level_pointer++;
	
	dummy_i *= sizeof (struct Enemy);


//this is corrupting / crashing here
//shows at ldir
//perhaps copying to already used area
__asm




	;//_enemy_locations is an unsigned struct in variables.h
	;//struct Enemy enemy_locations[128]; // up to 128 enemies per level, 8 bytes per enemy: 1K
	ld de, _enemy_locations	
	;//ld DE, AEC1		AEC1=0
	;//aec1 = 44737 vs 76c2 = 30402
	;//----------------------------
	
	;//unsigned char *level_pointer;
	ld hl, (_level_pointer)
	;//;ld HL, (AEB5)	AEB5=5F/95
	;//----------------------------
	
	ld bc, (_dummy_i)
	;//ld BC, (AEB9)	AEB9=0
	
	
	
	ldir
	
	;//Repeats LDI (LD (DE),(HL), then increments DE, HL, and decrements BC) until BC=0
	;//DE = AEC1
	;//HL = C65F
	;//BC = 0000 = FFFF


//back to bank (0)
//	bank(0);//ATTENTION

;//ATTENTION
;;halt;//6132
__endasm

	bank(0);

__asm	
	;ld b, 0
	;call setrambank	; back to normal
	ei
	
;//EXTERN _borderTestEndless
;//call _borderTestEndless
__endasm
	

/*
EXTERN _borderTestEndless
halt
call _borderTestEndless
*/



}

#endif