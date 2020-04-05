#ifndef WYZPLAYER_H
#define WYZPLAYER_H


	extern void __FASTCALL__ CARGA_CANCION();//load song
	
	void __FASTCALL__ wyz_load_music (unsigned char mzk_number)
	{
		bank(0);//wyz player is in bank 0 above 49152
		//fastcall will use the L register
		__asm
			;ld A, L	; A gets the song number		
			LD A,0	; SONG #0 (THE 1ST OF THE LIST)	49156
			call _CARGA_CANCION	
		__endasm
	}



	// WYZ player functions

/*	void wyz_load_music (unsigned char mzk_number)
	{
		//jump to bank 0
		dummy_b=mzk_number;		
		__asm
			di
			ld a, (_dummy_b)
			call CARGA_CANCION	
			ei
		__endasm		
	}*/

	void wyz_stop_music(void)
	{
		
		__asm
			di	
			CALL _STOP_PLAYER
			ei
		__endasm
		
	}

	void wyz_play(void)
	{
		__asm
			call _INICIO	;//call WYZ_PLAY
		__endasm
	}

#endif