#ifndef MAIN_H
#define MAIN_H

extern void __FASTCALL__ clean_screen_asm(void);

extern void __FASTCALL__ setrambank(void);
extern void __FASTCALL__ switchscreen(void);


extern void __FASTCALL__ depack(void);

extern void __FASTCALL__ loadLevelRamBank(void);

extern void __FASTCALL__ loadPrepTiles(void);

extern int __FASTCALL__ read_joystick();

extern int __FASTCALL__ get_joystick();




// WYZ player functions
void wyz_load_music (unsigned char mzk_number)
{
	__asm
		ld hl, 2
		add hl, sp
		ld a, (hl)              ; A gets the song number
		push af

		di
		call CARGA_CANCION	
		ei

		ld a, 3
		ld (SOUND_SFX), a	; by default we select sound and sfx, unless changed later

	        pop af
		ld c, a			; C gets the song number
		ld b, 0

		ld hl, _fxchannel_music
		add hl, bc
		ld a, (hl)
		ld (FX_CHANNEL),a
		call STOP_FX
	__endasm
}

void wyz_stop_music(void)
{
	__asm
		di	
		CALL STOP_PLAYER
		ei
		halt
	__endasm
}

void wyz_play(void)
{
	__asm
		call WYZ_PLAY
	__endasm
}

void wyz_effect(unsigned char effect)
{
	__asm
		ld a, (23388)
		and $07			; keep low bits
		push af			; save current state
		ld b, 0
		di
		call _setrambank		; go to ram bank 0 to play FX
		ei

		ld hl, 4
		add hl, sp
		ld b, (hl)              ; B gets the effect number
		call LOAD_FX

		di
		pop af			; recover RAM bank state
		ld b, a
		call _setrambank		; go back to normal state
		ei
	__endasm
}

void gameISR(void)
{
	joy=read_joystick(joystick_type);
	
	__asm
		ld a,r
		jp p, noscreenswitch	; the highest bit of R is 0, no screen switch yet
		call _switchscreen	; switch screen yabba
		ld a, r
		and $7f
		ld r,a	; clear the highest bit of the R register. It will be used to flag for a screen switch
	.noscreenswitch
		ld a, (23388)
		and $07			; keep low bits
		push af			; save current state
		ld b, 0
		call _setrambank		; go to ram bank 0 for the music ISR
		call WYZ_PLAY
		pop af
		ld b, a
		call _setrambank		; go back to normal state
		ld a, (_frameskip_counter)
		inc a
		ld (_frameskip_counter), a
		ld a, (_border_color)
		and a
		ret z
		dec a
		ld (_border_color), a
		out ($fe), a
	__endasm
}





//ATTENTION this is a mixed c and asm function need to rewrite
void load_level(unsigned char level)		
{
	////////////////////
	/*__asm
		di
		push bc
		ld b, 4
		call setrambank		; Levels in RAM4
		pop bc
	__endasm*/	
	loadLevelRamBank();
	////////////////////
	
	level_pointer=(unsigned char*)level_address[level];
	CurLevel_NTiles = *(level_pointer)++;
	CurLevel_XLength = *(level_pointer)++;	// Load the basic level data
	int_pointer=level_pointer;
	length_tiles = *(int_pointer);
	level_pointer+=2;
	int_pointer=level_pointer;
	length_map = *(int_pointer);
	level_pointer+=2;	
	// Prepare tiles, preshift them, store them in their final location
	// We will use the map area as decompression buffer
	
	////////////////////
	/*__asm	
		ld de, $a000
		ld hl, (_level_pointer)
		call _depack
		ld de, $a000
		ld a, (_CurLevel_NTiles)
		ld b,a
		call CreaTablaTiles
	__endasm*/
	loadPrepTiles();
	////////////////////

	// now, copy the map (uncompress) to its final location
	level_pointer += length_tiles;
	
	__asm
		ld de, $a000
		ld hl, (_level_pointer)
		call _depack
	__endasm
	
        // Copy enemy table
        level_pointer=(unsigned char*)enemy_address[level];
        dummy_i = *level_pointer; // Number of enemies in level
        level_pointer++;
        dummy_i *= sizeof (struct Enemy);
		
	__asm
		ld de, (_enemy_locations)
		ld hl, (_level_pointer)
			ld bc, (_dummy_i)
			ldir
		ld b, 0
		call _setrambank		; vuelta a la normalidad
		ei
	__endasm
}




#endif

