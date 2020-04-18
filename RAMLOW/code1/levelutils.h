#ifndef LEVELUTILS_H
#define LEVELUTILS_H


void load_level(unsigned char level)
{
	
// performs bank switch	to 4
__asm
	EXTERN _load_levelpart1
	call _load_levelpart1
__endasm

//------------------------------
//intrinsic_label(level_pointer_begin);//$6084
	level_pointer = (unsigned int*) level_address[level];
	//this points to the level address in BANK 4
//intrinsic_label(level_pointer_end);//$6098
//HL ends up with $C000

//	level_pointer = (unsigned char*)level_address[level];
//#601F  this is gold standard line
//creates a pointer error
//------------------------------


//intrinsic_label(CurLevel_NTiles_begin);//$6098
	CurLevel_NTiles = (*level_pointer)++;
//intrinsic_label(CurLevel_NTiles_end);//$60AA
//level 0 HL = $17 = 23 good?
//level 1 HL = $17 = 23 good?
//level 2 HL = $1e = 30 ?
//level 3 HL = $20 = 32 ?

	CurLevel_XLength = (*level_pointer)++;	// Load the basic level data
	
	
	int_pointer = (unsigned int*)level_pointer;//604E


	length_tiles = *(int_pointer);
	level_pointer+=2;
	
	
	int_pointer = (unsigned int*)level_pointer;
	
	
	length_map = (*int_pointer);//this line caused crash in the past
	
	level_pointer+=2;
	
	// Prepare tiles, preshift them, store them in their final location
	// We will use the map area as decompression buffer
	//remember, we are still in RAM4

intrinsic_label(troubleshoot_DrawMap_2);
__asm
extern _load_levelpart2
call _load_levelpart2
__endasm
// THIS ROUTINE FUCKING UP MY WORLD

intrinsic_label(troubleshoot_DrawMap_3);


	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;



intrinsic_label(load_levelpart3_BEGIN);
__asm
extern _load_levelpart3
	call _load_levelpart3
;//seems stable to here
__endasm
intrinsic_label(load_levelpart3_END);



	// Copy enemy table
//	level_pointer=(unsigned char*)enemy_address[level];
//gold standard line
	level_pointer=(unsigned int*)enemy_address[level];
	
	
	

	dummy_i = *level_pointer; // Number of enemies in level
	
	level_pointer++;
	
	dummy_i *= sizeof (struct Enemy);


//this is corrupting / crashing here
//shows at ldir
//perhaps copying to already used area


intrinsic_label(load_levelpart4_BEGIN);
__asm
extern _load_levelpart4
call _load_levelpart4

;halt

;EXTERN _borderTestEndless	
;;call _borderTestEndless
__endasm
intrinsic_label(load_levelpart4_END);

}

#endif