#ifndef LEVELUTILS_H
#define LEVELUTILS_H


void load_level(unsigned char level)
{
	
// performs bank switch	
__asm
	EXTERN _load_levelpart1
	call _load_levelpart1
__endasm


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
	
	intrinsic_label(load_levelpart2_BEGIN);
__asm
extern _CreaTablaTiles
extern _MAP_START
extern _load_levelpart2
call _load_levelpart2
__endasm
	intrinsic_label(load_levelpart2_END);

	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;



intrinsic_label(load_levelpart3_BEGIN);
__asm
extern _depack
extern _MAP_START
extern _load_levelpart3
	call _load_levelpart3
;//seems stable to here
__endasm
intrinsic_label(load_levelpart3_END);



	// Copy enemy table
	level_pointer=(unsigned char*)enemy_address[level];

	dummy_i = *level_pointer; // Number of enemies in level
	
	level_pointer++;
	
	dummy_i *= sizeof (struct Enemy);


//this is corrupting / crashing here
//shows at ldir
//perhaps copying to already used area



__asm
extern _load_levelpart4
call _load_levelpart4

;halt

;;EXTERN _borderTestEndless	
;;call _borderTestEndless
__endasm


}

#endif