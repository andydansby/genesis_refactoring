;;	ORG 0 ; org 49152

;; So, in SevenuP terminology, this means: X char, Mask, Char line, Y char, interleave: sprite, mask before sprite
;; now, the sprite drawing routine includes a sprite cache, with all required handling


;shot01
;GRAPHIC DATA:
;Pixel Size:      ( 16,  16)
;Char Size:       (  2,   2)
;Sort Priorities: X char, Mask, Char line, Y char
;Data Outputted:  Gfx
;Interleave:      Sprite
;Mask:            Yes, before graphic

;tiles7
;GRAPHIC DATA:
;Pixel Size:      (240,  24)
;Char Size:       ( 30,   3)
;Sort Priorities: Char line, X char, Y char
;Data Outputted:  Gfx
;Interleave:      Line
;Mask:            No

;GRAPHIC DATA:
;Pixel Size:      (240,  24)
;Char Size:       ( 30,   3)
;Sort Priorities: Char line, X char, Y char
;Data Outputted:  Gfx+Attr
;Interleave:      Sprite
;Mask:            No

;GRAPHIC DATA:
;Pixel Size:      ( 16,  16)
;Char Size:       (  2,   2)
;Sort Priorities: X char, Mask, Char line, Y char
;Data Outputted:  Gfx
;Interleave:      Sprite
;Mask:            Yes, before graphic

;GRAPHIC DATA:
;Pixel Size:      ( 16,  16)
;Char Size:       (  2,   2)
;Sort Priorities: X char, Char line, Y char, Mask
;Attributes:      No attributes
;Mask:            Yes, mask before

; SevenuP export info: X char, Char line, Y char
; So, in SevenuP terminology, this means: X char, Mask, Char line, Y char, interleave: sprite, mask before sprite


SECTION BANK_01

;; ASM source file created by SevenuP v1.20
;; SevenuP (C) Copyright 2002-2006 by Jaime Tejedor Gomez, aka Metalbrain

;;GRAPHIC DATA:
;;Pixel Size:      ( 16,  16)
;;Char Size:       (  2,   2)
;;Sort Priorities: X char, Char line, Y char
;;Data Outputted:  Gfx
;;Interleave:      Sprite
;;Mask:            No
	
PUBLIC _ship00		;;back of ship de=0				H
;#BEGIN_ASM
_ship00:
	;;sprite data
	DEFB	 31,255, 32,  1,  0,  1,224,  1
	DEFB	112,  1,120,  3,252,  7,127,255
	DEFB	127,252,255,243,120,252,112, 63
	DEFB	224, 15,  0,  1,  0,  0,  0,  0
;#END_ASM

PUBLIC _ship01		;;front of ship	de=1			H
;#BEGIN_ASM
_ship01:
	;;sprite data
	DEFB	255,240,128,  8,128,  0,128,  0
	DEFB	152,  0,248,  1,252,249,255,255
	DEFB	  7,255,249,249,  7,225,255,128
	DEFB	254,  0,240,  0,  0,  0,  0,  0
;#END_ASM
;;---------------------------------------------

PUBLIC _ship02		;;back 2 of ship de=2				H
;#BEGIN_ASM
_ship02:
	DEFB	  1,255,  2,  1,  0,  1,224,  1
	DEFB	112,  1,120,  3,252,  7,127,255
	DEFB	127,252,255,243,120,252,112, 63
	DEFB	224, 15,  0,  1,  0,  0,  0,  0
;#END_ASM
	
PUBLIC _ship03		;;front 2 of ship	de=3		H
;#BEGIN_ASM
_ship03:
	DEFB	255,  0,128,128,128,  0,128,  0
	DEFB	152,  0,248,  0,252,249,255,255
	DEFB	  7,255,249,249,  7,224,255,128
	DEFB	254,  0,240,  0,  0,  0,  0,  0
;#END_ASM
;---------------------------------------------

PUBLIC _ship04		;;back 3 of ship de=4				H
_ship04:
;#BEGIN_ASM
	DEFB	  0, 63,  0, 65,  0,  1,224,  1
	DEFB	112,  1,120,  3,252,  7,127,255
	DEFB	127,252,255,243,120,252,112, 63
	DEFB	224, 15,  0,  1,  0,  0,  0,  0
;#END_ASM
	
PUBLIC _ship05		;;front 3 of ship	de=5		H
;#BEGIN_ASM
_ship05:
	DEFB	252,  0,130,  0,128,  0,128,  0
	DEFB	152,  0,248,  1,252,249,255,255
	DEFB	  7,255,249,249,  7,225,255,128
	DEFB	254,  0,240,  0,  0,  0,  0,  0
;#END_ASM
;---------------------------------------------
PUBLIC _ship06		;;back 4 of ship de=6				H
_ship06:
;#BEGIN_ASM
	DEFB	  0, 15,  0, 17,  0,  1,224,  1
	DEFB	112,  1,120,  3,252,  7,127,255
	DEFB	127,252,255,243,120,252,112, 63
	DEFB	224, 15,  0,  1,  0,  0,  0,  0
;#END_ASM
	
PUBLIC _ship07		;;front 4 of ship	de=7		H
_ship07:
;#BEGIN_ASM
	DEFB	224,  0,144,  0,128,  0,128,  0
	DEFB	152,  0,248,  0,252,249,255,255
	DEFB	  7,255,249,249,  7,224,255,128
	DEFB	254,  0,240,  0,  0,  0,  0,  0
;#END_ASM
;---------------------------------------------	
	
PUBLIC _ship08		;;back 5 of ship de=8				H
;#BEGIN_ASM
_ship08:
	DEFB	  0,  1,  0,  3,  0,  1,224,  1
	DEFB	112,  1,120,  3,252,  7,127,255
	DEFB	127,252,255,243,120,252,112, 63
	DEFB	224, 15,  0,  1,  0,  0,  0,  0
;#END_ASM
	
PUBLIC _ship09		;;front 5 of ship	de=9	H
;#BEGIN_ASM
_ship09:
	DEFB	128,  0,192,  0,128,  0,128,  0
	DEFB	152,  0,248,  1,252,249,255,255
	DEFB	  7,255,249,249,  7,225,255,128
	DEFB	254,  0,240,  0,  0,  0,  0,  0
;#END_ASM
;---------------------------------------------	
	


PUBLIC _enemy01
_enemy01:
	DEFB	255,  7,  0,  0,240,  7,  0,112
	DEFB	128,  0,  3,192,128,  0, 47,214
	DEFB	128,  0,  1, 86,192,  0, 15,208
	DEFB	128,  0, 16, 70,128,  0, 59, 80
	DEFB	128,  0, 59, 80,128,  0, 16, 70
	DEFB	192,  0, 15,214,128,  0,  1, 80
	DEFB	128,  0, 47,214,128,  0,  3,192
	DEFB	240,  7,  0,112,255,  7,  0,  0
	
PUBLIC _shoot01
_shoot01:
	DEFB	255,255,  0,  0,255,255,  0,  0
	DEFB	  1,  1,  0,  0,  1,  1, 92, 92
	DEFB	  1,  1, 92, 92,  1,  1,  0,  0
	DEFB	255,255,  0,  0,255,255,  0,  0
	DEFB	255,255,  0,  0,255,255,  0,  0
	DEFB	  1,  1,  0,  0,  1,  1, 92, 92
	DEFB	  1,  1, 92, 92,  1,  1,  0,  0
	DEFB	255,255,  0,  0,255,255,  0,  0

PUBLIC _expl01
_expl01:
	DEFB	240, 15,  0,  0,192,  3,  7,224
	DEFB	128,  1, 31,248,128,  1, 63,252
	DEFB	  0,  0, 63,252,  0,  0,127,254
	DEFB	  0,  0,127,254,  0,  0,127,254
	DEFB	  0,  0,127,254,  0,  0,127,254
	DEFB	  0,  0,127,254,  0,  0, 63,252
	DEFB	  0,  1, 63,252,128,  1, 31,248
	DEFB	192,  3,  7,224,224,  7,  0,  0

PUBLIC _expl02
_expl02:
	DEFB	240, 15,  0,  0,192,  3,  7,224
	DEFB	128,  1, 31,248,128,  1, 63,252
	DEFB	  0,  0, 63,252,  0,  0,127,254
	DEFB	  0,  0,127,142,  0, 32,127,  6
	DEFB	  0,112,126,  2,  0,248,126,  2
	DEFB	  0,112,126,  2,  0, 32, 63,  4
	DEFB	128,  1, 63,140,128,  1, 31,248
	DEFB	192,  3,  7,224,240, 15,  0,  0

PUBLIC _expl03
_expl03:
	DEFB	240, 15,  0,  0,192,  3,  7,224
	DEFB	128,  1, 31,248,128,  1, 63,252
	DEFB	  0,  0, 63,  4,  0,112,126,  2
	DEFB	  0,248,124,  0,  1,255,124,  0
	DEFB	  1,255,124,  0,  1,255,124,  0
	DEFB	  0,255,124,  0,  0,113, 62,  0
	DEFB	128,  1, 63,  4,128,  1, 31,248
	DEFB	192,  3,  7,224,240, 15,  0,  0

PUBLIC _expl04
_expl04:
	DEFB	240, 15,  0,  0,192,  3,  7,224
	DEFB	128,  3, 28,  8,129,227, 48,  0
	DEFB	  7,255, 48,  0,  7,255, 96,  0
	DEFB	 15,255, 96,  0, 15,255, 96,  0
	DEFB	 15,255, 96,  0, 15,255, 96,  0
	DEFB	  7,255, 96,  0,  7,255, 48,  0
	DEFB	129,227, 48,  0,128,  3, 28,  8
	DEFB	192,  3,  7,224,240, 15,  0,  0
