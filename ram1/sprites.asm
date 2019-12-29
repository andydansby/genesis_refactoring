

;;org 0

;; SevenuP export info: X char, Char line, Y char
;; Sprites, at a global level. Full list:
;#BEGIN_ASM

	; 0 -  9: Main ship (32x16, 5 different animations)
	; 10 - 17: Main ship explosion (32x16, 4 anims)
	; 18 - 21: Enemy explosion (16x16, 4 anims)
	; 22:     sejuan's enemy, eye (16x16)
	; 23: 	  sejuan's cannon, looking left (16x16)
	; 24:     sejuan's cannon, looking right (16x16)
	; 25 -28: sejuan's cannon_eye, hanging from ceiling (16x16, 4 anims)
	; 29 -32: sejuan's enemy 2 (16x16, 4 anims)
	; 33 -36: sejuan's enemy, kamikaze (16x16, 4 anims)
	; 37 -40: sejuan's enemy, furby, walking (16x16, 4 anims)
	; 41 -44: sejuan's enemy, furby, preparing to jump (16x16, 4 anims)
	; 45 -46: sejuan's enemy, furby, jumping (16x16, 2 anims)
	; 47:     sejuan's cannon rocket, looking left (16x16)
	; 48:     sejuan's cannon rocket, looking right (16x16)
	; 49: 	  sejuan's cannon_eye shot, ray coming down (16x16)
	; 50:     Basic shot (16x16)
	; 51:	  Basic enemy shot (16x16)
	; 52:	  Laser (16x16)
	; 53:	  Homing missile (16x16)
	; 54:	  Bomb		 (16x16)
	; 55:	  Megashoot (16x16)
	; 56:     Power-up generator (16x16)

	; 57:	  Power-up type +1
	; 58: 	  Power-up type D
	; 59: 	  Power-up type T
	; 60: 	  Power-up type S
	; 61: 	  Power-up type M
	; 62: 	  Power-up type B
	; 63: 	  Power-up type C
	; 64:	  Final enemy level4, up sprite (16x16)
	; 65: 	  Final enemy level4, downleft (16x16)
	; 66: 	  Final enemy level4, downmiddle (16x16)
	; 67: 	  Final enemy level4, downright (16x16)
	; 68:	  Eye shot, for level 4's final enemy (16x16)

	; 69:	  anju's ship 1 (16x16)
	; 70: 	  anju's ship 2 (16x16)
	; 71:	  anju's ship 3 (16x16)
	; 72:	  anju's ship 4 (16x16)
	; 73:	  anju's turret (16x16, 3 anims)

	; 76:	  Final enemy level1 (32x32, 4 anims)
	; 92:	  Final enemy level1 shoots (actually anju's ship 1) (16x16)

	; 93:	Final enemy level2 (32x32, no anim)
	; 97:	Final enemy level2 shield (16x48)

	;100:	Asteroid (16x16, 4 anims)
	;104:	Space trash 1 (16x16)
	;105:	Space trash 2 (16x16)
	;106:	Space trash 3 (16x16)
	;107:	Space trash 4 (16x16)
	;108:	Space trash 5 (16x16)
	;109:   Asteroid explosion (16x16, 4 anims)
	;113:	Final enemy level3 (32x32, 4 anims)

	;129:	anju's ship2, bis (16x16)
	;130:	anju's ship3, bis (16x16)
	;131:	saltarin 	(16x16, 4 anims)
	;135:	cascoscuro	(16x16, 4 anims)
	;139:	egg		(16x16, 10 anims)
	;149:	uglyguy		(16x16, 3 anims)
	;152:	cascoscuro's missile	(16x16, 3 anims)
	;155:   sejuan's enemy 2 (16x16, 4 anims)
	;159: final enemy level5 (32x32, 4 anims)

	; 175: final enemy level6 (32x32, 4 anims)
	; 191: missile, final enemy level 6 (32x16)

	; 193: GENESIS (32x16, 5 different animations)

	; 203:	  anju's ship 1 (16x16)
	; 204: 	  anju's ship 2 (16x16)
	; 205:	  anju's ship 3 (16x16)
	; 206:	  anju's ship 4 (16x16)
	; 207:	  anju's turret (16x16, 3 anims)
	; 210: 	  paco's ship,  (32x16)
	; 212:    level 1 final enemy rebirth (32x32)

	; 216: Final enemy lelev 7 (32x32, 4 anims)
	; 232

	; GENESIS version sejuan

	;ship01:
	;	DEFB	  0,  0,  0,  0,  2,239,  0,112
	;	DEFB	  0,123,  3, 39,  3, 31,  0,255
	;	DEFB	  1, 32,  1,191,  1,159,  0, 15
	;	DEFB	  0, 94,  0,  0,  0,  0,  0,  0
	;ship02:
	;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	;	DEFB	248,  0, 15,  0,131,248,255,192
	;	DEFB	 30,  0,248,  0,192,  0,  0,  0
	;	DEFB	254,  0,  0,  0,  0,  0,  0,  0
	;shipup01:
	;	DEFB	  0,  0,  0,  0,  0,  0,  0, 15
	;	DEFB	  2,244,  0, 47,  3, 31,  6,224
	;	DEFB	  1, 63,  1,191,  1,159,  0, 62
	;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	;shipup02:
	;	DEFB	  0,  0,  0,  0,  0,  0,192,  0
	;	DEFB	112,  0, 15,  0,255,248,255,128
	;	DEFB	254,  0,248,  0,192,  0,255,  0
	;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	;shipdown01:
	;	DEFB	  0,  0,  0,  0,  0,  0,  1,123
	;	DEFB	  0, 56,  3, 29,  3, 15,  0,255
	;	DEFB	  1, 32,  1,191,  0, 31,  0, 47
	;	DEFB	  0,127,  0,  0,  0,  0,  0,  0
	;shipdown02:
	;	DEFB	  0,  0,  0,  0,  0,  0,240,  0
	;	DEFB	  0,  0,248,  0,135,192,255,248
	;	DEFB	126,  0,248,  0,192,  0,  0,  0
	;	DEFB	224,  0,  0,  0,  0,  0,  0,  0
	;shipleft01:
	;	DEFB	  0,  0,  0,  0,  3,190,  0,240
	;	DEFB	  0,123,  3, 39,  3, 95,  0,255
	;	DEFB	  1, 96,  1,159,  1,159,  0, 15
	;	DEFB	  0,125,  0,  0,  0,  0,  0,  0
	;shipleft02:
	;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	;	DEFB	248,  0, 15,  0,131,248,255,192
	;	DEFB	 30,  0,248,  0,192,  0,  0,  0
	;	DEFB	252,  0,  0,  0,  0,  0,  0,  0
	;shipright01:
	;	DEFB	  0,  0,  0,  0,  1,119,  0, 56
	;	DEFB	  0, 27,  3, 23,  3, 31,  0,255
	;	DEFB	  1, 32,  1,191,  1,159,  0, 15
	;	DEFB	  0, 22,  0,  0,  0,  0,  0,  0
	;shipright02:
	;	DEFB	  0,  0,  0,  0,128,  0,  0,  0
	;	DEFB	248,  0, 15,  0,131,248,255,192
	;	DEFB	 30,  0,248,  0,192,  0,  0,  0
	;	DEFB	255,  0,  0,  0,  0,  0,  0,  0
;#END_ASM



;; Nave normal, definitiva
PUBLIC _ship01
_ship01:
	DEFB	  0,  0,  0,  0,  0,253,  1,248
	DEFB	  2,  0,  0,240, 11,183, 11,247
	DEFB	 11,176,  0,245,  2,  0,  1,248
	DEFB	  0,253,  0,  0,  0,  0,  0,  0

PUBLIC _ship02
_ship02:
	DEFB	  0,  0,  0,  0,244,  0,  0,  0
	DEFB	  0,  0, 57,  0,106,128,121, 64
	DEFB	 12, 16,239,240,  7,224,  0,  0
	DEFB	244,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shipup01
_shipup01:
	DEFB	  0,  0,  0,  0,  0, 85,  0,  0
	DEFB	  0,176, 11,247, 11,176, 11,245
	DEFB	  0, 16,  2,162,  3,240,  1,249
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	
PUBLIC _shipup02
_shipup02:
	DEFB	  0,  0,  0,  0, 84,  0,  0,  0
	DEFB	 41,  0,122,128, 12, 32,239,240
	DEFB	  5, 80,170,160,  0,  0,244,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shipdown01
_shipdown01:
	DEFB	  0,  0,  0,  0,  0,  0,  0,251
	DEFB	  1,240,  2,160,  0, 16, 11,247
	DEFB	 11,181, 11,240,  0,177,  0,  0
	DEFB	  0, 85,  0,  0,  0,  0,  0,  0

PUBLIC _shipdown02
_shipdown02:
	DEFB	  0,  0,  0,  0,  0,  0,244,  0
	DEFB	  0,  0, 58,  0,121, 64,122,144
	DEFB	105, 64, 12, 16,239,224,  0,  0
	DEFB	 84,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shipleft01
_shipleft01:
	DEFB	  0,  0,  0,  0,  3,247,  7,224
	DEFB	 14,  0,  0,240, 11,183, 11,247
	DEFB	 11,176,  0,245, 14,  0,  7,224
	DEFB	  3,247,  0,  0,  0,  0,  0,  0

PUBLIC _shipleft02
_shipleft02:
	DEFB	  0,  0,  0,  0,208,  0,  0,  0
	DEFB	  0,  0, 57,  0,106,128,121, 64
	DEFB	 12, 16,239,240,  7,224,  0,  0
	DEFB	208,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shipright01
_shipright01:
	DEFB	  0,  0,  0,  0,  0,127,  0,254
	DEFB	  0,  4,  0,240, 11,183, 11,247
	DEFB	 11,176,  0,245,  0,  0,  0,254
	DEFB	  0,127,  0,  0,  0,  0,  0,  0

PUBLIC _shipright02
_shipright02:
	DEFB	  0,  0,  0,  0,125,  0,  0,  0
	DEFB	  0,  0, 57,  0,106,128,121, 64
	DEFB	 12, 16,239,240,  7,224,  0,  0
	DEFB	125,  0,  0,  0,  0,  0,  0,  0

PUBLIC _explship01_1
_explship01_1:
	DEFB	  0,  0,  0,  0,  0,120,  1,254
	DEFB	  3,255,  3,255,  7,243,  7,225
	DEFB	  7,192,  7,192,  3,225,  3,243
	DEFB	  1,254,  0,120,  0,  0,  0,  0

PUBLIC _explship01_2
_explship01_2:
	DEFB	  0,  0,  0,  0, 30,  0,127,128
	DEFB	127,192, 63,192,191,224,191,224
	DEFB	191,224,191,224, 63,192,127,192
	DEFB	127,128, 30,  0,  0,  0,  0,  0

PUBLIC _explship02_1
_explship02_1:
	DEFB	  0,  0,  0,  0,  0,120,  1,254
	DEFB	  3,225,  3,192,  7,128,  7,128
	DEFB	  7,128,  7,128,  3,192,  3,225
	DEFB	  1,254,  0,120,  0,  0,  0,  0

PUBLIC _explship02_2
_explship02_2:
	DEFB	  0,  0,  0,  0, 30,  0,127,128
	DEFB	127,192,127,192,252,224,248, 96
	DEFB	240, 32,240, 32,120, 64,124,192
	DEFB	127,128, 30,  0,  0,  0,  0,  0

PUBLIC _explship03_1
_explship03_1:
	DEFB	  0,  0,  0,  0,  0,120,  1,194
	DEFB	  3,  0,  3,  0,  6,  1,  6,  1
	DEFB	  6,  1,  6,  1,  3,  0,  3,  0
	DEFB	  1,194,  0,120,  0,  0,  0,  0

PUBLIC _explship03_2
_explship03_2:
	DEFB	  0,  0,  0,  0,  0,120,  1,194
	DEFB	  3,  0,  3,  0,  6,  1,  6,  1
	DEFB	  6,  1,  6,  1,  3,  0,  3,  0
	DEFB	  1,194,  0,120,  0,  0,  0,  0

PUBLIC _explship04_1
_explship04_1:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  1,  0,  1
	DEFB	  0,  1,  0,  1,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _explship04_2
_explship04_2:
	DEFB	  0,  0,  0,  0, 30,  0,112,128
	DEFB	192,  0,192,  0,128,  0,128,  0
	DEFB	128,  0,128,  0,192,  0,192,  0
	DEFB	112,128, 30,  0,  0,  0,  0,  0

PUBLIC _expl01
_expl01:
	DEFB	  0,  0,  7,224, 31,248, 63,252
	DEFB	 63,252,127,254,127,254,127,254
	DEFB	127,254,127,254,127,254, 63,252
	DEFB	 63,252, 31,248,  7,224,  0,  0

PUBLIC _expl02
_expl02:
	DEFB	  0,  0,  7,224, 31,248, 63,252
	DEFB	 63,252,127,254,127,142,127,  6
	DEFB	126,  2,126,  2,126,  2, 63,  4
	DEFB	 63,140, 31,248,  7,224,  0,  0

PUBLIC _expl03
_expl03:
	DEFB	  0,  0,  7,224, 31,248, 63,252
	DEFB	 63,  4,126,  2,124,  0,124,  0
	DEFB	124,  0,124,  0,124,  0, 62,  0
	DEFB	 63,  4, 31,248,  7,224,  0,  0

PUBLIC _expl04
_expl04:
	DEFB	  0,  0,  7,224, 28,  8, 48,  0
	DEFB	 48,  0, 96,  0, 96,  0, 96,  0
	DEFB	 96,  0, 96,  0, 96,  0, 48,  0
	DEFB	 48,  0, 28,  8,  7,224,  0,  0

PUBLIC _enem_sejuan1
_enem_sejuan1: 
	DEFB	 11,  0,  0,192, 14, 96, 55,120
	DEFB	 77,130, 80,220,129,193,135, 62
	DEFB	129,193, 80,220, 77,130, 55,120
	DEFB	 14, 96,  0,192, 11,  0,  0,  0

PUBLIC _cannon_sejuan_left
_cannon_sejuan_left:
	DEFB	  0,  0, 69,252,107,254, 55,195
	DEFB	 23,175,  7,  3, 47,111, 47,  3
	DEFB	 47,111, 47,  3, 47,255, 43,255
	DEFB	 40,  1, 15,254, 18,101, 58,245

PUBLIC _cannon_sejuan_right
_cannon_sejuan_right:
	DEFB	  0,  0, 63,162,127,214,195,236
	DEFB	245,232,192,224,246,244,192,244
	DEFB	246,244,192,244,255,244,255,212
	DEFB	128, 20,127,240,166, 72,175, 92

PUBLIC _eye_sejuan_ceiling_1
_eye_sejuan_ceiling_1:
	DEFB	 74,213,255,158, 30,188, 46,220
	DEFB	 65,194,137,201,129,129, 64,129
	DEFB	 97,166, 61,156,131,128, 87,  0
	DEFB	218,  0,  0,  0,  0,  0,  0,  0

PUBLIC _eye_sejuan_ceiling_2
_eye_sejuan_ceiling_2:
	DEFB	 74,213,255,158, 30,188, 44,204
	DEFB	125,222,145,209,129,193,125,223
	DEFB	124,190, 61,156,  2,128,  7,  0
	DEFB	102,  0, 20,  0, 48,  0,  0,  0

PUBLIC _eye_sejuan_ceiling_3
_eye_sejuan_ceiling_3:
	DEFB	 74,213,255,158, 30,188, 44,204
	DEFB	125,222,253,223,193,193,125,191
	DEFB	124,190, 61,156,  1,128,  1,128
	DEFB	  1,  0,  1,192,  0,160,  0,128

PUBLIC _eye_sejuan_ceiling_4
_eye_sejuan_ceiling_4:
	DEFB	 74,213,255,158, 30,188, 44,204
	DEFB	125,222,145,201,129,193,125,191
	DEFB	124,190, 61,156,  1,128,  1,128
	DEFB	  0, 72,  0,208,  0, 80,  0,  8

PUBLIC _enem_sejuan2_1
_enem_sejuan2_1:
	DEFB	  0,  0,  3,192, 12,  0, 16,117
	DEFB	 32,234, 67,218, 71,202,143,165
	DEFB	207,128,143,165, 71,202, 67,218
	DEFB	 32,234, 16,117, 12,  0,  3,192

PUBLIC _enem_sejuan2_2
_enem_sejuan2_2:
	DEFB	  0,  0,  0,  0,  0,  0,  3, 20
	DEFB	 60,234, 67,218, 71,202,143,164
	DEFB	207,128,143,164, 71,202, 67,218
	DEFB	 48,234, 12,116,  0,  0,  0,  0

PUBLIC _enem_sejuan2_3
_enem_sejuan2_3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,117
	DEFB	  0,232,  3,216,  7,200, 79,165
	DEFB	128,  0, 79,165,  7,200,  3,216
	DEFB	  0,232,  0,117,  0,  0,  0,  0

PUBLIC _enem_sejuan2_4
_enem_sejuan2_4:
	DEFB	  0,  0,  0,  0,  0,  0, 15, 17
	DEFB	 48,234, 67,218, 71,202,143,161
	DEFB	207,128,143,161, 71,202, 67,218
	DEFB	 32,234, 24,113,  7,128,  0,  0

PUBLIC _enem_sejuan_kamikaze_1
_enem_sejuan_kamikaze_1:
	DEFB	  0,  0,  0, 96,  0,248,  3,236
	DEFB	 15,206, 55, 26,120,127,251,235
	DEFB	251,235,120,127, 53, 26, 14,142
	DEFB	  3, 76,  0,152,  0, 96,  0,  0

PUBLIC _enem_sejuan_kamikaze_2
_enem_sejuan_kamikaze_2:
	DEFB	  0,  0,  0,  0,  0,  0,  0, 84
	DEFB	 31,190,124,255,251,235,248,235
	DEFB	124,123, 55,206, 15,  4,  0,248
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _enem_sejuan_kamikaze_3
_enem_sejuan_kamikaze_3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0, 84, 31,190,124,255
	DEFB	251,235,248,235,124,123, 55,206
	DEFB	 15,  4,  0,248,  0,  0,  0,  0

PUBLIC _enem_sejuan_kamikaze_4
_enem_sejuan_kamikaze_4:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  3,192,  4, 48, 48, 28,120,127
	DEFB	253,254,127,224, 24,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _enem_sejuan_furby_walk_1
_enem_sejuan_furby_walk_1:
	DEFB	 15,  0, 17,192, 14,224, 17, 48
	DEFB	 45, 88, 82,168,115,184, 45,124
	DEFB	 32,236, 61,116, 26,188, 27,152
	DEFB	 13,  0,  1,128, 11,192, 23,192

PUBLIC _enem_sejuan_furby_walk_2
_enem_sejuan_furby_walk_2:
	DEFB	  0,  0, 31,  0,  1,192, 14,224
	DEFB	 17, 48, 45, 88, 82,168,115,184
	DEFB	 45,124, 34,236, 62,244, 28, 60
	DEFB	 64,152, 39, 64, 62,136, 16, 24

PUBLIC _enem_sejuan_furby_walk_3
_enem_sejuan_furby_walk_3:
	DEFB	  0,  0, 16,  0, 15,  0,  1,192
	DEFB	 14,224, 17, 48, 45, 88, 82,168
	DEFB	112,184, 42,124, 37,108, 55,116
	DEFB	 26, 60, 22, 24, 15, 64, 31, 32

PUBLIC _enem_sejuan_furby_walk_4
_enem_sejuan_furby_walk_4:
	DEFB	  0,  0, 15,  0, 17,192, 14,224
	DEFB	 17, 48, 45, 88, 82,168,115,184
	DEFB	 45,124, 32,108, 61,180, 29, 56
	DEFB	 12,192,  2,112, 80, 56, 40, 56

PUBLIC _enem_sejuan_furby_prejump_1
_enem_sejuan_furby_prejump_1:
	DEFB	  0,  0,  0,  0, 15,  0, 17,192
	DEFB	 14,224, 17, 48, 45, 88, 82,168
	DEFB	112,184, 41,124, 34,172, 59,180
	DEFB	 29, 60,  1,152, 23,128, 47,128

PUBLIC _enem_sejuan_furby_prejump_2
_enem_sejuan_furby_prejump_2:
	DEFB	  0,  0,  0,  0,  7,  0,  1,192
	DEFB	 13,224, 16,224, 44,240, 54,240
	DEFB	 50,248, 37,120, 18,120, 27,104
	DEFB	 13, 80,  1,160, 23,128, 47,128

PUBLIC _enem_sejuan_furby_prejump_3
_enem_sejuan_furby_prejump_3:
	DEFB	  0,  0,  0,  0, 15,  0, 17,192
	DEFB	 14,224, 17, 48, 45, 88, 82,168
	DEFB	112,184, 41,124, 34,172, 59,180
	DEFB	 29, 60,  1,152, 23,128, 47,128

PUBLIC _enem_sejuan_furby_prejump_4
_enem_sejuan_furby_prejump_4:
	DEFB	  0,  0,  0,  0, 31,  0, 33,192
	DEFB	 14,224, 17, 96, 27, 48, 32,144
	DEFB	 44,208, 33, 24, 58,152, 59,176
	DEFB	 29, 96,  1,128, 23,128, 47,128

PUBLIC _enem_sejuan_furby_jump_1
_enem_sejuan_furby_jump_1:
	DEFB	 15,  0, 17,192, 14,224, 17, 48
	DEFB	 45, 88, 82,168,115,184, 45,124
	DEFB	 32,236, 61,116, 26,188, 27,152
	DEFB	 12,192,  0,116,  0, 52,  0,104

PUBLIC _enem_sejuan_furby_jump_2
_enem_sejuan_furby_jump_2:
	DEFB	 15,  0, 17,192, 14,224, 17, 48
	DEFB	 45, 88, 82,168,115,184, 45,124
	DEFB	 34,252, 62,124, 29,180, 27, 40
	DEFB	  2, 56, 38,144, 61,  0, 26,  0

PUBLIC _rocket_sejuan_left
_rocket_sejuan_left:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	 12,  0, 11,128,  7,192,  7,192
	DEFB	  7,224,  3,200,  0,152,  0, 32
	DEFB	  0, 96,  0,  0,  0,  0,  0,  0

PUBLIC _rocket_sejuan_right
_rocket_sejuan_right:
	DEFB	  0,  0,  0,  0,  0,  0,  0, 24
	DEFB	  0,232,  1,240,  1,240,  3,240
	DEFB	  9,224, 12,128,  2,  0, 35,  0
	DEFB	  0,  0,  8,  0,  0,  0,  0,  0

PUBLIC _eye_sejuan_shot
_eye_sejuan_shot:
	DEFB	  2,128,  2,160,  3,160,  2,160
	DEFB	  3,160,  3,160,  3,160,  3,128
	DEFB	  3,160,  3,160,  2,160,  3,160
	DEFB	  2,128,  2,160,  2,160,  2,160

PUBLIC _shoot1
_shoot1:
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;	DEFB	  0,  0,  0,  0,  0,  0, 14,248
;	DEFB	  6,252, 14,248,  0,  0,  0,  0
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;	DEFB	  0,  0,  0,  0,  0,  0, 89,254
;	DEFB	 89,254,  0,  0,  0,  0,  0,  0
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  2, 84, 89,190
	DEFB	 89,190,  2, 84,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shoot_enemy
_shoot_enemy:
	DEFB	  0,  0,  0,  0,  0,  0, 58, 58
	DEFB	 58, 58,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0, 58, 58
	DEFB	 58, 58,  0,  0,  0,  0,  0,  0

PUBLIC _shoot_laser
_shoot_laser:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,255,255,239,247, 18,  8
	DEFB	237,247,255,255,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shoot_homing
_shoot_homing:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0, 23,240
	DEFB	 27,208, 23,240,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shoot_bomb
_shoot_bomb:
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;	DEFB	 56,  0, 12,  0,  4,124, 27,230
;	DEFB	 63,250, 27,254,  4,124, 12,  0
;	DEFB	 56,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0, 24,  0,  4,  0, 19,124
	DEFB	 63,242, 19,124,  4,  0, 24,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _shoot_mega
_shoot_mega:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  1,192,  6, 32,  8,160, 11,144
	DEFB	  9,208,  5, 16,  4, 96,  3,128
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _item_powerup
_item_powerup:
	DEFB	  0,  0, 11,160, 49, 24,134,194
	DEFB	 63,248, 76,116, 89, 58,176, 84
	DEFB	179,218,246,212,123,170, 92, 84
	DEFB	 63,168,134, 66, 49, 24, 11,160

PUBLIC _powerup_plus1
_powerup_plus1:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244, 15,148,223, 26,218, 26
	DEFB	 81,155, 91,155, 47,144, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_d
_powerup_d:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8,116,217,186,217,218
	DEFB	 89,219, 89,187, 40,112, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_t
_powerup_t:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8, 20,218, 90,222,122
	DEFB	 94,123, 94,123, 44, 48, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_s
_powerup_s:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8, 20,217,250,216, 26
	DEFB	 95,155, 89,155, 40, 16, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_m
_powerup_m:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8, 20,217, 90,217, 90
	DEFB	 89, 91, 89, 91, 41, 80, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_b
_powerup_b:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8, 52,217,218,216, 58
	DEFB	 89,219, 89,219, 40, 48, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _powerup_c
_powerup_c:
	DEFB	  0,192,  3,192, 12,  0, 19,200
	DEFB	 15,244,  8, 20,217,218,217,250
	DEFB	 89,251, 89,219, 40, 16, 47,240
	DEFB	 19,200,  0, 48,  3,192,  3,  0

PUBLIC _final4_up
_final4_up:	
	DEFB	 15,240, 21,252, 63,126,  3,218
	DEFB	 56,125,109, 54, 86,157, 71, 78
	DEFB	110,157, 61, 58, 64,245, 63,170
	DEFB	 21, 81,  2,162,  0,  5,  0, 42

PUBLIC _final4_downleft
_final4_downleft:
	DEFB	  1, 85,  2,174,  5,255, 11,255
	DEFB	 31,170, 29,  0, 56,100, 48, 98
	DEFB	  0, 35,  0, 19,  0,  0,  0, 42
	DEFB	 12,127,  7,255,  2,174,  1, 85

PUBLIC _final4_downmiddle
_final4_downmiddle:
	DEFB	 85, 85,190,170,255,255,255,255
	DEFB	170,170,  0,  0,100,100, 98, 98
	DEFB	 35, 35, 19, 19,  0,  0,170,170
	DEFB	255,255,255,255,190,170, 85, 85

PUBLIC _final4_downright
_final4_downright:
	DEFB	 84, 14,171, 27,246,145,227, 73
	DEFB	240,161, 56, 99, 28, 86, 24, 45
	DEFB	 12, 62, 24,106, 28, 84, 56,232
	DEFB	241,208,255, 96,170,128, 84,  0

PUBLIC _final4_eyeshot
_final4_eyeshot:
	DEFB	  5, 65, 26,178, 63,234,127,250
	DEFB	 95,244,173,249,142,122,143,132
	DEFB	143,123,142,252,143,250, 95,245
	DEFB	125,250, 62,106, 27,178,  5, 65

PUBLIC _anju_ship1
_anju_ship1:
	DEFB	  0,  0,  0,112,  3,192, 47,214
	DEFB	  1, 86, 15,208, 16, 70, 59, 80
	DEFB	 59, 80, 16, 70, 15,214,  1, 80
	DEFB	 47,214,  3,192,  0,112,  0,  0

PUBLIC _anju_ship2
_anju_ship2:
	DEFB	  0,  0,  0,224,  1,202, 47,218
	DEFB	  1,128,  0,216,  2,  8,106,224
	DEFB	106,224,  2,  8,  0,216,  1,128
	DEFB	 47,218,  1,202,  0,224,  0,  0

PUBLIC _anju_ship3
_anju_ship3:
	DEFB	  0,  0,  0,  0,  0,  0, 93,192
	DEFB	 13,212,  0, 20,  3, 64,  8, 10
	DEFB	  3,106, 11,106,  3, 64,  0, 20
	DEFB	 13,212, 93,192,  0,  0,  0,  0

PUBLIC _anju_ship4
_anju_ship4:
	DEFB	  0,  0, 23,252,  0,176,  3,250
	DEFB	 15,234, 30,122, 29, 48, 58, 16
	DEFB	 56, 16, 28, 48, 30,122, 15,234
	DEFB	  3,250,  0,176, 23,252,  0,  0

PUBLIC _anju_turret_1
_anju_turret_1:
	DEFB	  0,  0, 16,  0, 42,  0, 29, 64
	DEFB	 14,160,  5,144,  3, 96,  6,192
	DEFB	  3,128,  1, 32,  4, 96,  0,  0
	DEFB	  9,232,  0,  0, 39,244, 39,248

PUBLIC _anju_turret_2
_anju_turret_2:
	DEFB	  0,  0,  1,192,  0,  0,  1,192
	DEFB	  1,192,  0,  0,  7,208,  7,208
	DEFB	  7,208,  0,  0,  3,160,  0,  0
	DEFB	  9,232,  0,  0, 39,244, 39,248

PUBLIC _anju_turret_3
_anju_turret_3:
	DEFB	  0,  0,  0,  8,  0, 84,  2,184
	DEFB	  5,112,  9,160,  6,192,  3, 96
	DEFB	  1,192,  4,128,  6, 32,  0,  0
	DEFB	 19,208,  0,  0, 39,244, 39,248


PUBLIC _final1_upleft_f1
_final1_upleft_f1:
	DEFB	  0,  0,  0,  0,  0, 15,  0, 48
	DEFB	  0, 71,  0,140,  1, 24,  1, 16
	DEFB	  3, 32,  2, 32, 14,  0, 26,  0
	DEFB	 61,192, 94,127,255,128,119,255

PUBLIC _final1_upright_f1
_final1_upright_f1:
	DEFB	  0,  0,  0,  0,224,  0, 24,  0
	DEFB	140,  0,  6,  0,  3,  0,  1,  0
	DEFB	  1,128,  0,128,  0,224,  0,176
	DEFB	  7,120,252,236,  3,254,255,188

PUBLIC _final1_downleft_f1
_final1_downleft_f1:
	DEFB	 62,255, 31,221, 39,255, 64,127
	DEFB	 66,  0, 68,  0, 68,  0,  4,  0
	DEFB	228,  0, 68,  0,  4,  0,  0,  0
	DEFB	 14,  0, 31,  0,  0,  0,  0,  0

PUBLIC _final1_downright_f1
_final1_downright_f1:
	DEFB	255,248,221,240,255,196,252,  4
	DEFB	  0,132,  0, 68,  0, 68,  0, 78
	DEFB	  0, 68,  0, 64,  0, 64,  0,  0
	DEFB	  0,224,  1,240,  0,  0,  0,  0

PUBLIC _final1_upleft_f2
_final1_upleft_f2:
	DEFB	  0,  0,  0,  0,  0,  0,  0, 15
	DEFB	  0, 48,  0, 71,  0,140,  1, 24
	DEFB	  1, 16,  3, 48,  2, 32, 10,  0
	DEFB	 26,  0, 61,192,126,127,239,128

PUBLIC _final1_upright_f2
_final1_upright_f2:
	DEFB	  0,  0,  0,  0,  0,  0,224,  0
	DEFB	 24,  0,140,  0,  6,  0,  3,  0
	DEFB	  1,  0,  1,128,  0,128,  0,192
	DEFB	  0,184,  7,112,252,252,  3,222

PUBLIC _final1_downleft_f2
_final1_downleft_f2:
	DEFB	127,255, 59,255, 31,110,  7,255
	DEFB	 64,127, 98,  0, 20,  0,  4,  0
	DEFB	  4,  0,  6,  0,  1,192,  0,224
	DEFB	  1,224,  0,  0,  0,  0,  0,  0

PUBLIC _final1_downright_f2
_final1_downright_f2:
	DEFB	255,252,254,248,239,240,255,192
	DEFB	252,  4,  0,136,  0, 80,  0, 64
	DEFB	  0, 64,  0,128,  3,  0, 15,  0
	DEFB	  7,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final1_upleft_f3
_final1_upleft_f3:
	DEFB	  0,  0,  0,  0,  0, 15,  0, 48
	DEFB	  0, 71,  0,136,  1, 16,  1, 16
	DEFB	  3, 32,  2, 32,  6,  0, 26,  0
	DEFB	 61,192,110,127,255,128,127,255

PUBLIC _final1_upright_f3
_final1_upright_f3:
	DEFB	  0,  0,  0,  0,224,  0, 24,  0
	DEFB	140,  0,  6,  0,  3,  0,  1,  0
	DEFB	  1,128,  0,128,  0,192,  0,176
	DEFB	  7,120,252,252,  3,222,255,252

PUBLIC _final1_downleft_f3
_final1_downleft_f3:
	DEFB	 61,255, 31,187,  7,255, 80,127
	DEFB	 98,  0,  4, 48,  4,184,  5, 48
	DEFB	  2,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final1_downright_f3
_final1_downright_f3:
	DEFB	255,120,187,240,255,192,252, 36
	DEFB	  0,152, 24, 64, 26, 64, 25, 64
	DEFB	  0,128,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final1_upleft_f4
_final1_upleft_f4:
	DEFB	  0,  0,  0, 15,  0, 48,  0, 71
	DEFB	  0,140,  1, 24,  1, 24,  3, 48
	DEFB	  2, 16,  6, 16, 26,  0, 61,192
	DEFB	110,127,255,128,119,255, 61,255

PUBLIC _final1_upright_f4
_final1_upright_f4:
	DEFB	  0,  0,224,  0, 24,  0,140,  0
	DEFB	  6,  0,  3,  0,  1,  0,  1,128
	DEFB	  0,128,  0,192,  0,176,  7,120
	DEFB	252,252,  3,222,255,252,255,120

PUBLIC _final1_downleft_f4
_final1_downleft_f4:
	DEFB	 31,187,  7,255, 64,127, 98,  0
	DEFB	 20,  0,  4,  0,  4,  0,  6,  0
	DEFB	  1,192,  0,224,  1,224,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final1_downright_f4
_final1_downright_f4:
	DEFB	187,244,255,196,252,  4,  0,136
	DEFB	  0, 80,  0, 64,  0, 64,  0,128
	DEFB	  3,  0, 15,  0,  7,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final1_shoot
_final1_shoot:
	DEFB	  0,  0,  0,112,  3,192, 47,214
	DEFB	  1, 86, 15,208, 16, 70, 59, 80
	DEFB	 59, 80, 16, 70, 15,214,  1, 80
	DEFB	 47,214,  3,192,  0,112,  0,  0


PUBLIC _final2_upleft
_final2_upleft:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  1
	DEFB	  0, 63,  0,252,  1,192,  7,128

PUBLIC _final2_upright
_final2_upright:
	DEFB	  0,  0,  0,  0,  0,  0, 15,128
	DEFB	 56,  0,120,  0,176,  0,174,  0
	DEFB	251,128, 65,192,146,192,102, 96
	DEFB	140, 96,218, 96,100, 96,  4, 64

PUBLIC _final2_downleft
_final2_downleft:
	DEFB	 15,  1, 14,  2, 14,  5,  7,133
	DEFB	  3,242,  1,255,  0,255,  0, 95
	DEFB	  1, 47,  2,215,  1, 87,  0, 39
	DEFB	  0, 16,  0, 15,  0,  0,  0,  0

PUBLIC _final2_downright
_final2_downright:
	DEFB	 15,128,240,128,  1,128, 15,  0
	DEFB	128,  0,247,  0,187,192,219,224
	DEFB	215,224,255,192,167,128,254,  0
	DEFB	  0,  0,232,  0,  0,  0,  0,  0

PUBLIC _final2_shield1
_final2_shield1:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  1,  0, 14
	DEFB	  0, 31,  0,119,  0,254,  7,120
	DEFB	  7,176,  3,192, 13,128, 30,  0

PUBLIC _final2_shield2
_final2_shield2:
	DEFB	 31,  0, 54,  0,124,  0,124,  0
	DEFB	 60,  0, 92,  0,228,  0,252,  0
	DEFB	252,  0,252,  0, 60,  0, 66,  0
	DEFB	126,  0,126,  0, 62,  0, 27,  0

PUBLIC _final2_shield3
_final2_shield3:
	DEFB	 31,128, 15,128,  6,224,  5,240
	DEFB	  3,220,  0,190,  0,127,  0, 27
	DEFB	  0, 15,  0,  3,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _asteroid_1
_asteroid_1:
	DEFB	  0,  0,  0,  0,  3, 64, 15,160
	DEFB	 31, 80, 27,160, 53,208, 59,168
	DEFB	 63, 80, 31,168, 29,208, 15,160
	DEFB	  3,  0,  0,  0,  0,  0,  0,  0

PUBLIC _asteroid_2
_asteroid_2:
	DEFB	  0,  0,  0,  0,  1,192,  7,240
	DEFB	 15,184, 15, 88, 27,188, 31,252
	DEFB	 14,232,  5, 84, 10,168,  5, 80
	DEFB	  2,128,  0,  0,  0,  0,  0,  0
	
PUBLIC _asteroid_3
_asteroid_3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,192
	DEFB	  5,240, 11,184, 21,248, 10,252
	DEFB	 21,220, 11,172,  5,216, 10,248
	DEFB	  5,240,  2,192,  0,  0,  0,  0

PUBLIC _asteroid_4
_asteroid_4:
	DEFB	  0,  0,  0,  0,  0,  0,  1, 64
	DEFB	 10,160, 21, 80, 42,160, 23,112
	DEFB	 63,248, 61,216, 26,240, 29,240
	DEFB	 15,224,  3,128,  0,  0,  0,  0

PUBLIC _sp_trash1
_sp_trash1:
	DEFB	 42,160,133, 84, 98, 42, 81, 84
	DEFB	 56,139, 24, 87,  4, 62, 66,125
	DEFB	  1,186, 83, 28,135,152,  8,116
	DEFB	135,168, 72,208, 20, 96,138,  0

PUBLIC _sp_trash2
_sp_trash2:
	DEFB	  0,208, 11,163,183,214,255,240
	DEFB	124,232,179,114,119,249,122,248
	DEFB	 63,188, 93, 52, 60,232, 63,180
	DEFB	 27, 65, 44,  2,  0,213, 16, 36

PUBLIC _sp_trash3
_sp_trash3:
	DEFB	 27, 40, 86, 84, 84,234, 97,247
	DEFB	 24,249, 97,113,240,164, 80, 98
	DEFB	224, 58, 85, 65,224, 33,127,166
	DEFB	170,168, 64, 43, 42,169,  5, 70

PUBLIC _sp_trash4
_sp_trash4:
	DEFB	 98,130,151, 53,206, 89, 20,232
	DEFB	 41,100,  6,200, 87, 20,251,168
	DEFB	157, 82,138,167, 68, 73, 34,156
	DEFB	148, 46,129,215, 68, 14, 56,  4

PUBLIC _sp_trash5
_sp_trash5:
	DEFB	  0,  0,  0,144,  3,173, 15,158
	DEFB	  3,175, 20, 29, 10,174, 29, 80
	DEFB	 47,245, 48,242, 12,229, 46,234
	DEFB	 24, 64, 28, 52, 48,128, 40, 96

PUBLIC _asteroid_expl1
_asteroid_expl1:
	DEFB	 15,224, 31, 60, 93,218,254,254
	DEFB	 51, 62,251,175,254,250,255, 59
	DEFB	255, 55,187,221,223,246,127,234
	DEFB	123, 84, 62,166,  7, 92,  0,  0

PUBLIC _asteroid_expl2
_asteroid_expl2:
	DEFB	 15,128, 95, 28, 29,218,206,222
	DEFB	 35, 30,249,175,252,  0,254,187
	DEFB	254, 55,186, 93,220,246,127,234
	DEFB	123, 84, 50,166,  7, 92,  0,  0

PUBLIC _asteroid_expl3
_asteroid_expl3:
	DEFB	 15,128, 31, 28, 29, 90, 14, 30
	DEFB	 35,  6,  0, 32,132,  0, 56,  0
	DEFB	124,  2,184, 24,248, 55,208,106
	DEFB	 96, 87,  0, 38, 16, 95,  0, 22

PUBLIC _asteroid_expl4
_asteroid_expl4:
	DEFB	224, 16,240,  6, 96,  5,224,  6
	DEFB	  0, 11,128,  7, 16,  0,  0,  9
	DEFB	  0,  0,  0,  1,  0,  0,  0,  0
	DEFB	 32,  0,  0,  8,192, 26,136, 54

PUBLIC _final3_upleft_f1
_final3_upleft_f1:
	DEFB	  0,  0,  0,  0,  0,  0,  0, 14
	DEFB	  0, 63, 64,188, 64,214, 97,251
	DEFB	 48,247, 51,154, 18,242, 20,129
	DEFB	  4, 24,  0,147, 96,151, 32, 80

PUBLIC _final3_upright_f1
_final3_upright_f1:
	DEFB	  0,  0,  0,  0,  0,  0, 62,  0
	DEFB	255,224, 63,224,124,216,255,232
	DEFB	168,180,252,246,252, 74, 62,  4
	DEFB	 61, 36,190, 28, 61, 71, 54,116

PUBLIC _final3_downleft_f1
_final3_downleft_f1:
	DEFB	 16,  8, 24,  0, 12,  0, 15,  3
	DEFB	  3,255,  1,253,  0,122,  0, 85
	DEFB	  0,  0, 15,128, 24,224, 16, 60
	DEFB	 24, 26, 12,  1,  4,  7,  4,  1

PUBLIC _final3_downright_f1
_final3_downright_f1:
	DEFB	124, 80,116, 30,233,207,216,164
	DEFB	241, 42,100,176,197, 32,  2,144
	DEFB	  0,160,  7,192, 13, 64, 11,128
	DEFB	177,  0,172,  0,216,  0,128,  0

PUBLIC _final3_upleft_f2
_final3_upleft_f2:
	DEFB	  0,  0,  0,  0,  0, 14,  0, 63
	DEFB	  0,188, 16,214, 49,251, 48,247
	DEFB	 51,154, 18,242, 20,129,  4, 24
	DEFB	  0,147, 16,151, 16,144, 48,  0

PUBLIC _final3_upright_f2
_final3_upright_f2:
	DEFB	  0,  0,  0,  0, 62,  0,255,224
	DEFB	 63,224,124,216,255,232,169,180
	DEFB	253,246,252,202, 62,  6, 61,104
	DEFB	190, 56, 61, 78, 54,232,124, 80

PUBLIC _final3_downleft_f2
_final3_downleft_f2:
	DEFB	 24,  0, 28,  0, 15,  3,  3,255
	DEFB	  1,253,  0,122,  0, 20,  0,  0
	DEFB	  0,  0, 62,224, 67,253, 96, 26
	DEFB	  0,  5,  0,  0,  0,  0,  0,  0

PUBLIC _final3_downright_f2
_final3_downright_f2:
	DEFB	116, 62,233,206,216,164,241, 40
	DEFB	 96,176,197, 32,  2,144,  0,160
	DEFB	  7,192, 13, 64, 91,128,177,  0
	DEFB	168,  0,208,  0,  0,  0,  0,  0

PUBLIC _final3_upleft_f3
_final3_upleft_f3:
	DEFB	  0,  0,  0, 14,  0, 63,  0,188
	DEFB	  0,214,  9,251, 16,247, 51,154
	DEFB	 50,242, 52,129, 20, 24,  0,147
	DEFB	  8,151, 25, 16, 24, 32, 24,  0

PUBLIC _final3_upright_f3
_final3_upright_f3:
	DEFB	  0,  0, 60,  0,255,128, 63,224
	DEFB	124,208,255,232,169,176,253,244
	DEFB	252, 72, 62,  4, 60,248,190, 28
	DEFB	 60, 68, 54,240,124, 80,116, 24

PUBLIC _final3_downleft_f3
_final3_downleft_f3:
	DEFB	 12,  0, 15,  3,  3,255,  1,253
	DEFB	  0,122,  0, 85,  0,  0,  0,  0
	DEFB	224,  0, 96,  5, 61,250,  7,229
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final3_downright_f3
_final3_downright_f3:
	DEFB	233,200,216,160,241, 32, 96,176
	DEFB	193, 32,  2,128,  0,160,  7,192
	DEFB	 61, 64, 91,128,177,  0,172,  0
	DEFB	192,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final3_upleft_f4
_final3_upleft_f4:
	DEFB	  0,  0,  0,  0,  0, 14,  0, 63
	DEFB	  0,188,  0,214, 33,251, 48,247
	DEFB	 51,154, 18,242, 20,129,  4, 24
	DEFB	  0,147, 32,151, 32,144, 16, 16

PUBLIC _final3_upright_f4
_final3_upright_f4:
	DEFB	  0,  0,  0,  0, 62,  0,255,224
	DEFB	 63,224,124,216,255,232,169,180
	DEFB	252,246,253, 74, 62,  4, 61, 36
	DEFB	190, 28, 61, 70, 54,116,124, 80

PUBLIC _final3_downleft_f4
_final3_downleft_f4:
	DEFB	 24,  0, 12,  0, 15,  3,  3,255
	DEFB	  1,253,  0,122,  0, 85,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,125,250
	DEFB	103,225,112,  7,  0,  1,  0,  0

PUBLIC _final3_downright_f4
_final3_downright_f4:
	DEFB	116, 28,233,204,216,164,241, 40
	DEFB	100,176,197, 32,  2,144,  0,160
	DEFB	  7,192, 13, 64, 11,128,177,  0
	DEFB	172,  0,216,  0,128,  0,  0,  0

PUBLIC _anju_ship2bis
_anju_ship2bis:
	DEFB	  0,  0,  0,224,  1,202, 47,218
	DEFB	  1,128,  0,216,  2,  8,106,224
	DEFB	106,224,  2,  8,  0,216,  1,128
	DEFB	 47,218,  1,202,  0,224,  0,  0

PUBLIC _anju_ship3bis
_anju_ship3bis:
	DEFB	  0,  0,  0,  0,  0,  0, 93,192
	DEFB	 13,212,  0, 20,  3, 64,  8, 10
	DEFB	  3,106, 11,106,  3, 64,  0, 20
	DEFB	 13,212, 93,192,  0,  0,  0,  0

PUBLIC _saltarin_1
_saltarin_1:
	DEFB	  0,  0,  0,  0,  0,  0, 64,  4
	DEFB	192,  6,128,  2,131,130,143,226
	DEFB	159,242,144, 18,214,214, 95,244
	DEFB	  0,  0, 23,224, 11, 64,  3,128

PUBLIC _saltarin_2
_saltarin_2:
	DEFB	  0,  0,  0,  0, 64,  4,192,  6
	DEFB	131,130,143,226,156, 50,152,210
	DEFB	150,194,208, 22, 95,244,  0,  0
	DEFB	  7,224,  0, 64,  3,128,  0, 64

PUBLIC _saltarin_3
_saltarin_3:
	DEFB	 64,  4,192,  6,131,130,143,226
	DEFB	152, 50,150,210,134,194,208, 22
	DEFB	 95,244,  0,  0,  7,224,  0, 64
	DEFB	  3,128,  0, 64,  1,128,  0,  0

PUBLIC _saltarin_4
_saltarin_4:
	DEFB	  0,  0,  0,  0, 32,  2, 96,  3
	DEFB	 65,193, 71,241, 76,121, 75, 25
	DEFB	 67,105,104, 11, 47,250,  0,  0
	DEFB	  3,240,  0, 32,  1,192,  0, 32

PUBLIC _cascoscuro_1
_cascoscuro_1:
	DEFB	  0,  4,  3,194, 15,242, 31,250
	DEFB	 63,252, 63,236, 64,254,111, 86
	DEFB	 64,254, 63,204, 63,252, 31,248
	DEFB	  7,224,  0, 64,  5,240, 11,240

PUBLIC _cascoscuro_2
_cascoscuro_2:
	DEFB	  0,  2,  0,  0,  3,194, 15,226
	DEFB	 31,250, 63,252, 63,236, 64,254
	DEFB	119, 86, 64,254,127,204, 63,224
	DEFB	  7,252,  0, 56,  3,112,  5,112

PUBLIC _cascoscuro_3
_cascoscuro_3:
	DEFB	  0,  1,  3,194, 15,242, 31,250
	DEFB	 63,252, 63,236, 64,254,123, 86
	DEFB	 64,254, 63,204, 63,252, 31,248
	DEFB	 67, 64,126,  8, 60, 16,  0, 96

PUBLIC _cascoscuro_4
_cascoscuro_4:
	DEFB	  0,  2,  3,194, 15,242, 31,250
	DEFB	 63,252, 63,236, 64,254,119, 86
	DEFB	 64,254, 63,204, 63,252, 31,248
	DEFB	  7,224, 32, 64, 57,240,  3,240

PUBLIC _egg_1
_egg_1:
	DEFB	  0,  0,  3,192, 14,176, 31, 88
	DEFB	 63,172, 31,212,127,170, 63,214
	DEFB	127,234,127,214,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_2
_egg_2:
	DEFB	  0,  0,  3,192, 14,176, 31, 88
	DEFB	 63,172, 31,212,100,170, 59,214
	DEFB	127,234,127,214,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_3
_egg_3:
	DEFB	  0,  0,  3,192, 14,176, 31, 88
	DEFB	 63,172, 31,196,103, 10, 56,214
	DEFB	127,106,127, 86,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_4
_egg_4:
	DEFB	  0,128,192, 70, 76, 48,  0, 88
	DEFB	 58,128,  3,  4, 96, 10, 56,214
	DEFB	127,106,127, 86,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_5
_egg_5:
	DEFB	  0,  0,  0,  0,  7,224, 25, 16
	DEFB	 32,  4,  0,  4, 96, 10, 56,214
	DEFB	127,106,127, 86,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_6
_egg_6:
	DEFB	  0,  0,  0,  0,  7,224, 25, 16
	DEFB	 38,196, 13,164,102, 10, 56,214
	DEFB	127,106,127, 86,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_7
_egg_7:
	DEFB	  0,  0,  0,  0,  7,224, 25, 16
	DEFB	 32,  4,  0,  4, 96, 10, 56,214
	DEFB	127,106,127, 86,127,170, 55,212
	DEFB	 46,172, 21, 88, 10,176,  7, 80

PUBLIC _egg_8
_egg_8:
	DEFB	  0,  0,  1,128,  7,192, 15,144
	DEFB	 63, 16, 31,168,124,216, 41,232
	DEFB	  3, 48,  6,104,  0, 80,  0,160
	DEFB	 32,208, 34,160, 21,192, 14,  0

PUBLIC _egg_9
_egg_9:
	DEFB	  1,128,  7,192, 15,144, 63, 16
	DEFB	 31,168,124,216, 41,232,  3, 48
	DEFB	  6,104,  0, 80,  0,160,  6,208
	DEFB	  8,160, 17, 64, 10,128,  7,  0

PUBLIC _egg_10
_egg_10:
	DEFB	  1,128,  7,192, 15,144, 63, 16
	DEFB	 31,168,124,216, 41,232,  3, 48
	DEFB	  6,104,  0, 80,  0,160,  0,208
	DEFB	  6,160, 13,216,  7,  0,  0,  0

PUBLIC _uglyguy_1
_uglyguy_1:
	DEFB	 28,  0, 62,224, 24, 92, 60, 62
	DEFB	 56,142, 26, 60, 10,188,  0,216
	DEFB	  0,  0,  2,192,  2,192,  2,192
	DEFB	  2,192,  2,192,  0,  0,  5,224

PUBLIC _uglyguy_2
_uglyguy_2:
	DEFB	 56,  0,125,192, 48,184,120,124
	DEFB	113, 28, 54, 14, 20, 14,  0,  0
	DEFB	 31,140, 31,140, 24,  0, 24, 32
	DEFB	 68, 16,124, 20,  0,  8,  0, 16

PUBLIC _uglyguy_3
_uglyguy_3:
	DEFB	 56,  0,125,192, 48,176,120,120
	DEFB	112, 24, 54,250, 22,226,  0,  0
	DEFB	  3,  0,123,  0, 99, 64,123, 64
	DEFB	  3, 64,  3,  0,  0,  0, 15,  0

PUBLIC _casco_missile_1
_casco_missile_1:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  3,128,  2,128,  3,128,  3,128
	DEFB	  3,128,  2,128,  1,  0,  3,128
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _casco_missile_2
_casco_missile_2:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  4,  0, 10,  0,  7,  0
	DEFB	  3,128,  1,128,  0, 96,  0, 64
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _casco_missile_3
_casco_missile_3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0, 15,232
	DEFB	 11,216, 15,232,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _enem_sejuan2_1bis
_enem_sejuan2_1bis:
	DEFB	  0,  0,  3,192, 12,  0, 16,117
	DEFB	 32,234, 67,218, 71,202,143,165
	DEFB	207,128,143,165, 71,202, 67,218
	DEFB	 32,234, 16,117, 12,  0,  3,192

PUBLIC _enem_sejuan2_2bis
_enem_sejuan2_2bis:
	DEFB	  0,  0,  0,  0,  0,  0,  3, 20
	DEFB	 60,234, 67,218, 71,202,143,164
	DEFB	207,128,143,164, 71,202, 67,218
	DEFB	 48,234, 12,116,  0,  0,  0,  0

PUBLIC _enem_sejuan2_3bis
_enem_sejuan2_3bis:
	DEFB	  0,  0,  0,  0,  0,  0,  0,117
	DEFB	  0,232,  3,216,  7,200, 79,165
	DEFB	128,  0, 79,165,  7,200,  3,216
	DEFB	  0,232,  0,117,  0,  0,  0,  0

PUBLIC _enem_sejuan2_4bis
_enem_sejuan2_4bis:
	DEFB	  0,  0,  0,  0,  0,  0, 15, 17
	DEFB	 48,234, 67,218, 71,202,143,161
	DEFB	207,128,143,161, 71,202, 67,218
	DEFB	 32,234, 24,113,  7,128,  0,  0

PUBLIC _final5_upleft_f1
_final5_upleft_f1:
	DEFB	  0,  7,  0, 24,  0, 35,  0, 71
	DEFB	  0, 79,  0, 79,  0,159,  0,185
	DEFB	  1, 81,  1,125,  2, 85,  2, 63
	DEFB	  2, 63,  2,127,  4,127,  4,  1

PUBLIC _final5_upright_f1
_final5_upright_f1:
	DEFB	224,  0, 24,  0,196,  0,226,  0
	DEFB	242,  0,242,  0,249,  0,153,  0
	DEFB	172,128,212,128,218, 64,219, 64
	DEFB	139, 64,107, 64,118, 32,142, 32

PUBLIC _final5_downleft_f1
_final5_downleft_f1:
	DEFB	  4,182,  4,182,  2,127,  2, 63
	DEFB	  1,191, 14, 64, 19, 55,  1,  0
	DEFB	  0,111, 48,202, 73,240, 72,255
	DEFB	 40,165, 68,  9,  3,242,  0,  1

PUBLIC _final5_downright_f1
_final5_downright_f1:
	DEFB	254, 32,252, 32,252, 64,248, 78
	DEFB	241,139,  2, 25,236,  1,  1,129
	DEFB	 50, 69,184, 57,124, 67,248,162
	DEFB	 81, 46,  2, 56,218, 16,108,  0

PUBLIC _final5_upleft_f2
_final5_upleft_f2:
	DEFB	  0,  3,  0, 12,  0, 17,  0, 35
	DEFB	  0, 39,  0, 39,  0, 79,  0, 92
	DEFB	  0,168,  0,190,  1, 42,  1, 31
	DEFB	  1, 31,  1, 63,  2, 63,  2, 36

PUBLIC _final5_upright_f2
_final5_upright_f2:
	DEFB	240,  0, 12,  0,226,  0,241,  0
	DEFB	249,  0,249,  0,252,128,204,128
	DEFB	214, 64,234, 64,237, 32,237,160
	DEFB	229,160,213,160,219, 16,219, 16

PUBLIC _final5_downleft_f2
_final5_downleft_f2:
	DEFB	  2,100,  2, 91,  1, 63,  1, 31
	DEFB	  8,223,  7, 32,  1,155,  0,135
	DEFB	  0, 55, 24,101, 36,248, 36,127
	DEFB	  4, 82,  2,  4,  1,249,  0,  0

PUBLIC _final5_downright_f2
_final5_downright_f2:
	DEFB	103, 16,126, 16,254, 32,252, 32
	DEFB	248,198,  1,  1,246,  1, 64,193
	DEFB	153,  2, 92, 97, 62,161,252,150
	DEFB	160,136,145,  0,109,  0,134,  0

PUBLIC _final5_upleft_f3
_final5_upleft_f3:
	DEFB	  0,  1,  0,  6,  0,  8,  0, 17
	DEFB	  0, 19,  0, 19,  0, 39,  0, 46
	DEFB	  0, 84,  0, 95,  0,149,  0,175
	DEFB	  0,175,  0,223,  1, 31,  1, 18

PUBLIC _final5_upright_f3
_final5_upright_f3:
	DEFB	248,  0,  6,  0,241,  0,248,128
	DEFB	252,128,252,128,254, 64,102, 64
	DEFB	107, 32,117, 32,118,144,246,208
	DEFB	251, 80,251, 80,250,136,118,136

PUBLIC _final5_downleft_f3
_final5_downleft_f3:
	DEFB	  1, 50,  1, 32,  0,159,  0,143
	DEFB	  0,111,  7,144,  2,205,  0, 48
	DEFB	  1, 27,  1, 50,  0,252,  0, 63
	DEFB	 30, 41, 49,  2,  0,252,  0,  0

PUBLIC _final5_downright_f3
_final5_downright_f3:
	DEFB	 54,136, 49,  8,255, 16,254, 16
	DEFB	252, 96,  0,128,251,  0,232,  0
	DEFB	204,128,174,120, 31,  3,254, 10
	DEFB	 80,100, 72,180,182,152, 67,  0

PUBLIC _final5_upleft_f4
_final5_upleft_f4:
	DEFB	  0,  3,  0, 12,  0, 17,  0, 35
	DEFB	  0, 39,  0, 39,  0, 79,  0, 92
	DEFB	  0,168,  0,190,  1, 42,  1, 31
	DEFB	  1, 31,  1, 63,  2, 63,  2, 36

PUBLIC _final5_upright_f4
_final5_upright_f4:
	DEFB	240,  0, 12,  0,226,  0,241,  0
	DEFB	249,  0,249,  0,252,128,204,128
	DEFB	214, 64,234, 64,237, 32,237,160
	DEFB	229,160,213,160,187, 16,183, 16

PUBLIC _final5_downleft_f4
_final5_downleft_f4:
	DEFB	  2,100,  2, 91,  1, 63,  1, 31
	DEFB	  0,223,  7, 32,  9,155, 26,135
	DEFB	  1, 27,  1, 50,  1,124, 48,191
	DEFB	 14, 41,  1,  2,  0,252,  0,  0

PUBLIC _final5_downright_f4
_final5_downright_f4:
	DEFB	 79, 16,126, 16,254, 32,252, 32
	DEFB	248,198,  1,  1,246,  1, 64,193
	DEFB	172,130,206,122, 31,  2,254, 10
	DEFB	 80,100, 72,180,182,152, 67,  0

PUBLIC _final6_upleft
_final6_upleft:
	DEFB	  0,254, 15,255, 63,255, 56, 65
	DEFB	 15,190,  4, 66,  2, 66,  1,254
	DEFB	  1,255,  1, 87,  0,252,  0,  0
	DEFB	  0, 69,  0,170,  0,170,  0,170

PUBLIC _final6_upright
_final6_upright:
	DEFB	  0,  0,255,128,255,240,255,248
	DEFB	253,220,245, 92,245, 92,245, 92
	DEFB	255,240,128,  0, 15,192,  0,  0
	DEFB	255,192,255,160,255,208,  0,170

PUBLIC _final6_downleft
_final6_downleft:
	DEFB	  0,170,  0,170,  0, 69,  0,  0
	DEFB	  0,  1,  0,  2,  0,  3,  0,  6
	DEFB	  0,  7,  0,  6,  0,  5,  0,  6
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final6_downright
_final6_downright:
	DEFB	222,208,222,160,255,192,  0,  0
	DEFB	207,128,159,192, 31,192,191,224
	DEFB	 36,160,187, 96, 59, 96,187, 96
	DEFB	 63,224,  0,  0,  0,  0,  0,  0


PUBLIC _final6_upleft_f1
_final6_upleft_f1:
	DEFB	  0,254, 15,255, 63,255, 56, 65
	DEFB	 15,190,  4, 66,  2, 66,  1,254
	DEFB	  1,255,  1, 87,  0,252,  0,  0
	DEFB	  0,  4,  0, 10,  0, 10,  0, 10

PUBLIC _final6_upright_f1
_final6_upright_f1:
	DEFB	  0,  0,255,128,255,240,255,248
	DEFB	253,220,245, 92,245, 92,245, 92
	DEFB	255,240,128,  0, 15,192,  0,  0
	DEFB	 95,252,175,250,175,253,172, 13

PUBLIC _final6_downleft_f1
_final6_downleft_f1:
	DEFB	  0, 10,  0, 10,  0,  4,  0,  0
	DEFB	  0,  1,  0,  2,  0,  3,  0,  6
	DEFB	  0,  7,  0,  6,  0,  5,  0,  6
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final6_downright_f1
_final6_downright_f1:
	DEFB	173,237,173,234, 95,252,  0,  0
	DEFB	207,128,159,192, 31,192,191,224
	DEFB	 36,160,187, 96, 59, 96,187, 96
	DEFB	 63,224,  0,  0,  0,  0,  0,  0

PUBLIC _final6_upleft_f2
_final6_upleft_f2:
	DEFB	  0, 63,  3,255, 15,255, 14, 16
	DEFB	  3,239,  1, 16,  0,144,  0,127
	DEFB	  0,127,  0, 85,  0, 63,  0,  0
	DEFB	  0, 17,  0, 42,  0, 42,  0, 42

PUBLIC _final6_upright_f2
_final6_upright_f2:
	DEFB	128,  0,255,224,255,252,127,254
	DEFB	191,119,189, 87,189, 87,189, 87
	DEFB	255,252,224,  0,  3,240,  0,  0
	DEFB	127,240,191,232,191,244,176, 52

PUBLIC _final6_downleft_f2
_final6_downleft_f2:
	DEFB	  0, 42,  0, 42,  0, 17,  0,  0
	DEFB	  0,  1,  0,  7,  0,  2,  0,  1
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final6_downright_f2
_final6_downright_f2:
	DEFB	183,180,183,168,127,240,  0,  0
	DEFB	240,192, 71,224,159,240, 15,240
	DEFB	119,240,103,240, 27,224, 25,192
	DEFB	  6,128,  3,  0,  0,  0,  0,  0


PUBLIC _final6_upleft_f3
_final6_upleft_f3:
	DEFB	  0,254, 15,255, 63,255, 56, 65
	DEFB	 15,190,  4, 66,  2, 66,  1,254
	DEFB	  1,255,  1, 87,  0,252,  0,  0
	DEFB	  0, 69,  0,170,  0,170,  0,170

PUBLIC _final6_upright_f3
_final6_upright_f3:
	DEFB	  0,  0,255,128,255,240,255,248
	DEFB	253,220,245, 92,245, 92,245, 92
	DEFB	255,240,128,  0, 15,192,  0,  0
	DEFB	255,192,255,160,255,208,192,208

PUBLIC _final6_downleft_f3
_final6_downleft_f3:
	DEFB	  0,170,  0,170,  0, 69,  0,  0
	DEFB	  0,  0,  0,  1,  0,  3,  0,  3
	DEFB	  0,  3,  0,  3,  0,  1,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final6_downright_f3
_final6_downright_f3:
	DEFB	222,208,222,160,255,192,  0,  0
	DEFB	193,128,243,240,167,252, 71,250
	DEFB	167,247,215,243,171,238,209,220
	DEFB	 96,168,  0,120,  0,  0,  0,  0

PUBLIC _final6_missile1
_final6_missile1:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0, 14,  0, 41,122
	DEFB	110,191, 41,122, 14,  0,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _final6_missile2
_final6_missile2:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0,  0,  5, 16,170,173
	DEFB	253,240,138,173,  5, 16,  0,  0
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0


; Genesis, version DaD + sejuan
;#BEGIN_ASM
; Test 01
;genesis01:
;	DEFB	  0,  0,  0,  0,  3,112,  1,184
;	DEFB	  1,188,  0, 13,  1,117,  1,112
;	DEFB	  0,  6,  7,254,  6,172,  3,251
;	DEFB	  0,249,  0,  0,  0,  0,  0,  0
;genesis02:
;	DEFB	  0,  0,  0,  0,  0,  0,124,  0
;	DEFB	192,  0,222,  0,209,  0,110,128
;	DEFB	 17,128,220, 96, 31,224,192,  0
;	DEFB	250,  0,  0,  0,  0,  0,  0,  0
;genesisup01:
;	DEFB	  0,  0,  0,  0,  0,  0,  3, 96
;	DEFB	  1,184,  0,222,  0,  7,  0,187
;	DEFB	  0,184,  0,  3,  3, 87,  1,254
;	DEFB	  0,253,  0,  0,  0,  0,  0,  0
;genesisup02:
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;	DEFB	  0,  0,248,  0,111,  0,104,128
;	DEFB	 55, 64,  8,192,110, 48,  3,240
;	DEFB	253,  0,  0,  0,  0,  0,  0,  0
;genesisdown01:
;	DEFB	  0,  0,  0,  0,  6,224,  3,112
;	DEFB	  3,121,  0, 27,  2,235,  2,224
;	DEFB	  0, 12, 15,253, 13, 88,  7,247
;	DEFB	  1,243,  0,  0,  0,  0,  0,  0
;genesisdown02:
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;	DEFB	252,  0,254,  0,209,  0,238,128
;	DEFB	113,128, 28, 64,199,128,  0,  0
;	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
;genesisleft01:
;	DEFB	  0,  0,  0,  0,  3,112,  1,184
;	DEFB	  1,188,  0, 13,  1,117,  1,112
;	DEFB	  0,  6,  7,254,  6,172,  3,248
;	DEFB	  0,251,  0,  0,  0,  0,  0,  0
;genesisleft02:
;	DEFB	  0,  0,  0,  0,  0,  0,124,  0
;	DEFB	192,  0,222,  0,209,  0,110,128
;	DEFB	 17,128,220, 96, 31,224,  0,  0
;	DEFB	208,  0,  0,  0,  0,  0,  0,  0
;genesisright01:
;	DEFB	  0,  0,  0,  0,  3,112,  1,184
;	DEFB	  1,188,  0, 13,  1,117,  1,112
;	DEFB	  0,  6,  7,254,  6,172,  3,251
;	DEFB	  0,249,  0,  0,  0,  0,  0,  0
;genesisright02:
;	DEFB	  0,  0,  0,  0,  0,  0,124,  0
;	DEFB	192,  0,222,  0,209,  0,110,128
;	DEFB	 17,128,220, 96, 31,224,192,  0
;	DEFB	250,  0,  0,  0,  0,  0,  0,  0
;#END_ASM

PUBLIC _genesis01
_genesis01:
	DEFB	  0,  0,  0,  0,  6,224,  3,112
	DEFB	  1,185,  0, 26,  2, 75,  2,160
	DEFB	  0, 12,  3,253, 13, 88,  7,243
	DEFB	  1,193,  0,  0,  0,  0,  0,  0

PUBLIC _genesis02
_genesis02:
	DEFB	  0,  0,  0,  0,  0,  0,240,  0
	DEFB	192,  0,180,  0,186,  0,221,  0
	DEFB	 39,  0, 88,128, 31,192,129,192
	DEFB	245,128,  0,  0,  0,  0,  0,  0

PUBLIC _genesisup01
_genesisup01:
	DEFB	  0,  0,  0,  0,  3,112,  1,185
	DEFB	  0, 26,  2, 75,  2,163,  0,  0
	DEFB	  0,253, 13, 92,  7,251,  1,241
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0

PUBLIC _genesisup02
_genesisup02:
	DEFB	  0,  0,  0,  0,  0,  0,192,  0
	DEFB	168,  0,180,  0,218,  0, 39,  0
	DEFB	 88,  0, 31,128,129,192,245, 64
	DEFB	  0,128,  0,  0,  0,  0,  0,  0

PUBLIC _genesisdown01
_genesisdown01:
	DEFB	  0,  0,  0,  0,  0,  0,  6,224
	DEFB	  3,113,  1,187,  0, 26,  2, 65
	DEFB	  2,161,  0, 12, 15,253,  5, 88
	DEFB	  3,243,  0,193,  0,  0,  0,  0

PUBLIC _genesisdown02
_genesisdown02:
	DEFB	  0,  0,  0,  0,  0,  0,240,  0
	DEFB	248,  0,196,  0,186,  0,189,  0
	DEFB	223,  0, 38, 64, 88,192,  7,192
	DEFB	129,128,244,  0,  0,  0,  0,  0

PUBLIC _genesisleft01
_genesisleft01:
	DEFB	  0,  0,  0,  0,  1,184,  0,216
	DEFB	  0, 89,  0, 26,  4,139,  5, 64
	DEFB	  0, 14,  0,254,  3,244,  7, 89
	DEFB	  1,243,  0,  0,  0,  0,  0,  0

PUBLIC _genesisleft02
_genesisleft02:
	DEFB	  0,  0,  0,  0,  0,  0,240,  0
	DEFB	192,  0,180,  0,186,  0,221,  0
	DEFB	 39,  0, 88,128, 31,192,  3,192
	DEFB	235,128,  0,  0,  0,  0,  0,  0

PUBLIC _genesisright01
_genesisright01:
	DEFB	  0,  0,  0,  0, 13,192,  6,224
	DEFB	  3,113,  0, 26,  1, 43,  1, 80
	DEFB	  0, 10,  7,249, 26,176, 15,229
	DEFB	  3,128,  0,  0,  0,  0,  0,  0

PUBLIC _genesisright02
_genesisright02:
	DEFB	  0,  0,  0,  0,  0,  0,240,  0
	DEFB	192,  0,180,  0,186,  0,221,  0
	DEFB	 39,  0, 88,128, 31,192,192,192
	DEFB	250,128,  0,  0,  0,  0,  0,  0

PUBLIC _anju_ship1_level7
_anju_ship1_level7:
	DEFB	  0,  0,  0,112,  3,192, 47,214
	DEFB	  1, 86, 15,208, 16, 70, 59, 80
	DEFB	 59, 80, 16, 70, 15,214,  1, 80
	DEFB	 47,214,  3,192,  0,112,  0,  0

PUBLIC _anju_ship2_level7
_anju_ship2_level7:
	DEFB	  0,  0,  0,224,  1,202, 47,218
	DEFB	  1,128,  0,216,  2,  8,106,224
	DEFB	106,224,  2,  8,  0,216,  1,128
	DEFB	 47,218,  1,202,  0,224,  0,  0

PUBLIC _anju_ship3_level7
_anju_ship3_level7:
	DEFB	  0,  0,  0,  0,  0,  0, 93,192
	DEFB	 13,212,  0, 20,  3, 64,  8, 10
	DEFB	  3,106, 11,106,  3, 64,  0, 20
	DEFB	 13,212, 93,192,  0,  0,  0,  0

PUBLIC _anju_ship4_level7
_anju_ship4_level7:
	DEFB	  0,  0, 23,252,  0,176,  3,250
	DEFB	 15,234, 30,122, 29, 48, 58, 16
	DEFB	 56, 16, 28, 48, 30,122, 15,234
	DEFB	  3,250,  0,176, 23,252,  0,  0

PUBLIC _anju_turret_1_level7
_anju_turret_1_level7:
	DEFB	  0,  0, 16,  0, 42,  0, 29, 64
	DEFB	 14,160,  5,144,  3, 96,  6,192
	DEFB	  3,128,  1, 32,  4, 96,  0,  0
	DEFB	  9,232,  0,  0, 39,244, 39,248

PUBLIC _anju_turret_2_level7
_anju_turret_2_level7:
	DEFB	  0,  0,  1,192,  0,  0,  1,192
	DEFB	  1,192,  0,  0,  7,208,  7,208
	DEFB	  7,208,  0,  0,  3,160,  0,  0
	DEFB	  9,232,  0,  0, 39,244, 39,248

PUBLIC _anju_turret_3_level7
_anju_turret_3_level7:
	DEFB	  0,  0,  0,  8,  0, 84,  2,184
	DEFB	  5,112,  9,160,  6,192,  3, 96
	DEFB	  1,192,  4,128,  6, 32,  0,  0
	DEFB	 19,208,  0,  0, 39,244, 39,248

PUBLIC _pacoship_1
_pacoship_1:
	DEFB	  0,  0,  5, 42, 30, 85, 44,128
	DEFB	 29, 52, 56,105,122,208, 48,  0
	DEFB	116,169, 51,252,107,248,177,244
	DEFB	234,168, 85, 84,  2,168,  0,  5

PUBLIC _pacoship_2
_pacoship_2:
	DEFB	  0,  3,160,  1,120, 12,180,230
	DEFB	250,115,117, 41,171, 84,  0,  0
	DEFB	223,124,  9,162,234,186, 10,162
	DEFB	233,174, 10,162,239,190, 85, 84

PUBLIC _final1_upleft_level7
_final1_upleft_level7:
	DEFB	  0,  0,  0,  0,  0, 15,  0, 48
	DEFB	  0, 71,  0,140,  1, 24,  1, 16
	DEFB	  3, 32,  2, 32, 14,  0, 26,  0
	DEFB	 61,192, 94,127,255,128,119,255

PUBLIC _final1_upright_level7
_final1_upright_level7:
	DEFB	  0,  0,  0,  0,224,  0, 24,  0
	DEFB	140,  0,  6,  0,  3,  0,  1,  0
	DEFB	  1,128,  0,128,  0,224,  0,176
	DEFB	  7,120,252,236,  3,254,255,188

PUBLIC _final1_downleft_level7
_final1_downleft_level7:
	DEFB	 62,255, 31,221, 39,255, 64,127
	DEFB	 66,  0, 68,  0, 68,  0,  4,  0
	DEFB	228,  0, 68,  0,  4,  0,  0,  0
	DEFB	 14,  0, 31,  0,  0,  0,  0,  0

PUBLIC _final1_downright_level7
_final1_downright_level7:
	DEFB	255,248,221,240,255,196,252,  4
	DEFB	  0,132,  0, 68,  0, 68,  0, 78
	DEFB	  0, 68,  0, 64,  0, 64,  0,  0
	DEFB	  0,224,  1,240,  0,  0,  0,  0

PUBLIC _final7_upleft_f1
_final7_upleft_f1:
	DEFB	  1, 29,  2,237, 12, 22, 26,255
	DEFB	  3,255,  5, 63,  6,247, 11,232
	DEFB	 15,223, 14,  0, 12,  0,  4,127
	DEFB	  0,199,  0,179,  0,199,  6, 63

PUBLIC _final7_upright_f1
_final7_upright_f1:
	DEFB	224,  0,126,128,189, 18,243,187
	DEFB	239, 76,255,192,255,226,255,181
	DEFB	226,248,  0,120, 28,124,253,124
	DEFB	255,188,254,124,246,252,248,252

PUBLIC _final7_downleft_f1
_final7_downleft_f1:
	DEFB	  7,223, 15,224, 15,255,  3,255
	DEFB	  3,255,  1,122,  0,245,  0, 58
	DEFB	  0, 13, 24, 32, 52,240, 37,195
	DEFB	 48,199, 28, 14,  0, 22,  0, 19

PUBLIC _final7_downright_f1
_final7_downright_f1:
	DEFB	131,216, 63,168,255,208,255,164
	DEFB	253,126,234,154, 86,  7,168,  7
	DEFB	 96, 30,  0, 22,  3,252,134,248
	DEFB	119,240, 31,128, 24,  0,128,  0

PUBLIC _final7_upleft_f2
_final7_upleft_f2:
	DEFB	  0,  0,  0,  0,  0, 45,  0, 22
	DEFB	  2,253,  3,255,  5, 63,  6,255
	DEFB	 11,248, 15,255, 15,255, 15,  0
	DEFB	  6,  0,  2,248,  0,243,  6, 56

PUBLIC _final7_upright_f2
_final7_upright_f2:
	DEFB	  0,  0,  0,  0, 98,  0,188,  0
	DEFB	243,160,239, 72,255,192,255,232
	DEFB	255,180, 47,248,192,248,  0,124
	DEFB	 29, 28,127,156, 62, 60,118,220

PUBLIC _final7_downleft_f2
_final7_downleft_f2:
	DEFB	 15, 31, 15,224,  7,255,  7,255
	DEFB	  3,255,  0,215,  0, 42,  0, 21
	DEFB	 88,  0,198,204, 91,225, 48,195
	DEFB	 32,  2, 32,  1, 16,  0,  0,  0

PUBLIC _final7_downright_f2
_final7_downright_f2:
	DEFB	248,252,  3,216,255,168,255,208
	DEFB	250,140,213,126,168, 26, 66, 31
	DEFB	  0, 15,224, 14,152,102, 71,252
	DEFB	 70,248, 35,240,  0,  0,  0,  0

PUBLIC _final7_upleft_f3
_final7_upleft_f3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  0,  0,  0, 16,  0,  7,  0, 59
	DEFB	  0,125,  0,191,  1,191,  3,255
	DEFB	  3,238,  7, 18,  2,  0,  0,255

PUBLIC _final7_upright_f3
_final7_upright_f3:
	DEFB	  0,  0,  0,  0,  0,  0,  0,  0
	DEFB	  4,  0, 64, 32, 92,  0,253,144
	DEFB	255,194,255,165,239,240,247,240
	DEFB	195,248,  1,120,  3,188,152, 76

PUBLIC _final7_downleft_f3
_final7_downleft_f3:
	DEFB	  0,255,  2, 63,  3,207,  3,224
	DEFB	  1,255,  0,255,  0,191,  0, 90
	DEFB	  0, 13,  0,  0,  0, 28, 24, 56
	DEFB	 52,240, 37,195, 48,199, 28, 14

PUBLIC _final7_downright_f3
_final7_downright_f3:
	DEFB	198,248,248,252,131,208, 63,168
	DEFB	255,208,255,172,253, 94,234,138
	DEFB	 84,  7,  0,  7,  0, 30,  0, 22
	DEFB	  3,252,134,248,119,240, 31,128

PUBLIC _final7_upleft_f4
_final7_upleft_f4:
	DEFB	  0,  8, 25, 29,  6,237,  0, 22
	DEFB	  2,255,  3,255,  5, 63,  6,247
	DEFB	 11,232, 15,223, 14,  0, 12,  0
	DEFB	  4,127,  0,248,  0,243,  2,248

PUBLIC _final7_upright_f4
_final7_upright_f4:
	DEFB	 64,  0,224, 56,126,136,189, 16
	DEFB	243,176,239, 64,255,194,255,226
	DEFB	255,180,226,248,  0,120, 28,124
	DEFB	253,124,127,188, 62,124,118,252

PUBLIC _final7_downleft_f4
_final7_downleft_f4:
	DEFB	  6, 63,  7,223,  7,224,  7,255
	DEFB	  3,255,  1,255,  0,250,  0, 53
	DEFB	 88,  2,198,192, 91,225, 48,195
	DEFB	 32,  2, 32,  1, 16,  0,  0,  0

PUBLIC _final7_downright_f4
_final7_downright_f4:
	DEFB	248,252,131,216, 63,168,255,208
	DEFB	255,164,253,126,234,154, 86, 31
	DEFB	  0, 15,224, 14,152,102, 71,252
	DEFB	 70,248, 35,240,  0,  0,  0,  0
