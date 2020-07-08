#ifndef LEVELUTILS_H
#define LEVELUTILS_H


extern void __FASTCALL__ load_levelpart1(void);

extern void __FASTCALL__ load_levelpart2(void);

extern void __FASTCALL__ load_levelpart3(void);

extern void __FASTCALL__ load_levelpart4(void);


void load_level(unsigned char level)
{
	
// performs bank switch	to 4
	load_levelpart1();


//---------------------------
//HL ends up with $C000
//results at $6098	GOOD
//results pushed to #6844 GOOD
	level_pointer=(unsigned char*) level_address[level];
	
intrinsic_label(level_pointer_results);
	//this points to the level0 address in BANK 4
	
	
//REPRESENTS address that compressed level data streamed is stored at (defined in variables.h)
//---------------------------

// HL ends up with 0x17 (23)
//results at #60A7
//results pushed to #6844 GOOD
	CurLevel_NTiles = *(level_pointer)++;
	
intrinsic_label(CurLevel_NTiles_results);

//REPRESENTS Number of Tiles

//---------------------------
// HL ends up with 0xFF (255)
//results at #60B6
//results pushed to #6846
	CurLevel_XLength = *(level_pointer)++;
	// Load the basic level data

intrinsic_label(CurLevel_XLength_results1);

//represents length of MAP = FF

//---------------------------
// HL ends up with C002
//results at #60BC
//results pushed to #6846

	int_pointer = (unsigned int*)level_pointer;//different from GS
	//int_pointer=level_pointer;GS
	
intrinsic_label(int_pointer_results);

//represents where to find length of tile data
//---------------------------
// HL ends up with C004
//results at $60CD
//results pushed to #6844


	length_tiles = *(int_pointer);
	
	
	level_pointer+=2;
	
intrinsic_label(length_tiles_results);
//represents where to find length of level data

//---------------------------
//stop
//60D3 = C004
 
	//int_pointer = (unsigned int*)level_pointer;//different from GS
	int_pointer=level_pointer;
intrinsic_label(int_pointer2_results);


//---------------------------
//HL = #0204
	length_map = (*int_pointer);//this line caused crash in the past
	
intrinsic_label(length_map_results);

//represents length of Level Data
//---------------------------


	level_pointer+=2;
	
intrinsic_label(level_pointer2_results);
	
	// Prepare tiles, preshift them, store them in their final location
	// We will use the map area as decompression buffer
	//remember, we are still in RAM4


	load_levelpart2();//$65EC
	
intrinsic_label(load_levelpart2_result);
//$60E7



//MAP seems to decompress properly
//Good to here


/////////////////////////////


	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;

intrinsic_label(level_pointer3_results);//$60F2

	load_levelpart3();//$65F0
	
intrinsic_label(load_levelpart3_result);//#60f5


//GS #892C	CHECK $ #8A8A

//#892c <-- exists as loaded
//$8937	within 892c

//$890b routine that copys
//$6088
//$8001
//#8a8a
/*
	// Copy enemy table
	level_pointer=(unsigned char*)enemy_address[level];
//gold standard line



intrinsic_label(level_pointer4_results);


/*	
	//changed level_pointer to unsigned char
	//level_pointer=(unsigned int*)enemy_address[level];
	//unsigned int enemy_address[3]
	//unsigned char *level_pointer = 0;
	



	dummy_i = *level_pointer;
	
intrinsic_label(dummy_i_1_results);//$6111
// Number of enemies in level
//troubleshoot_2_ASSIGNMENT
//	$6108
// I think #6CD4 is where variable will be stored
// #6CD4 = 4D C3 = C34D


	level_pointer++;
//troubleshoot_3_ASSIGNMENT
//	$6111
intrinsic_label(level_pointer5_results);//$611B




	dummy_i *= sizeof (struct Enemy);
	
intrinsic_label(dummy_i_2_results);//$6124
//troubleshoot_4_ASSIGNMENT


//this is corrupting / crashing here
//shows at ldir
//perhaps copying to already used area

//	load_levelpart4();

__asm
extern _load_levelpart4
call _load_levelpart4


__endasm

intrinsic_label(_load_levelpart4_results);//$6127
*/
}

#endif