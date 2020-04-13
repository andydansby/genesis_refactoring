#ifndef ENGINE_H
#define ENGINE_H



void wtf (void)
{	
}

// Function definitions...is there a way to automate this?
__asm
;; THESE are hard coded addresses
;; need to eliminate
;//	DEFC get_joystick = $8752
;//	DEFC CreaTablaTiles = $8830
;//	DEFC setrambank = $8489
;//	DEFC DrawMap = $8101
;//	DEFC drawsprite = $84B6
;//	DEFC switchscreen = $8498
;//	DEFC InitSprCacheList = $866E
;//	DEFC SetIM2 = $890B
__endasm




// Joystick definitions

#define JOY_KEMPSTON	0
#define JOY_SINCLAIR1	1
#define JOY_SINCLAIR2	2
#define JOY_KEYS	3

#define JOY_UP		0x1
#define JOY_DOWN	0x2
#define JOY_LEFT	0x4
#define JOY_RIGHT	0x8
#define JOY_FIRE	0x10

// Key definitions

#define KEY_CAPS 	0xfe01
#define KEY_Z 		0xfe02 	
#define KEY_X 		0xfe03
#define KEY_C 		0xfe04
#define KEY_V 		0xfe05
#define KEY_A 		0xfd01
#define KEY_S 		0xfd02
#define KEY_D 		0xfd03
#define KEY_F 		0xfd04
#define KEY_G 		0xfd05
#define KEY_Q 		0xfb01
#define KEY_W 		0xfb02
#define KEY_E 		0xfb03
#define KEY_R 		0xfb04
#define KEY_T 		0xfb05
//#define KEY_1 		0xf701
//#define KEY_2 		0xf702
//#define KEY_3 		0xf703
//#define KEY_4 		0xf704
//#define KEY_5 		0xf705
#define KEY_0 		0xef01
#define KEY_9 		0xef02
#define KEY_8 		0xef03
#define KEY_7 		0xef04
#define KEY_6 		0xef05
#define KEY_P 		0xdf01
#define KEY_O 		0xdf02
#define KEY_I 		0xdf03
#define KEY_U 		0xdf04
#define KEY_Y 		0xdf05
#define KEY_ENTER 	0xbf01
#define KEY_L 		0xbf02
#define KEY_K 		0xbf03
#define KEY_J 		0xbf04
#define KEY_H 		0xbf05
#define KEY_SPACE 	0x7f01
#define KEY_SS 		0x7f02
#define KEY_M 		0x7f03
#define KEY_N 		0x7f04
#define KEY_B 		0x7f05

#endif
