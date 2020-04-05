;;graphicutils.asm
;; these are short routines that are pulled from graphicutils.h

PUBLIC _clean_screen1
;#BEGIN_ASM
;;must be in UNCONTENDED
_clean_screen1:

	ld hl, $C000
	ld de, $C001
	ld (hl),0
	ld bc, 4095
	ldir
	ld hl, $d800
	ld de, $d801
	ld (hl), $05
	ld bc, 511
	ldir
ret
;#END_ASM

PUBLIC _load_background1
;#BEGIN_ASM
;;must be in UNCONTENDED
_load_background1:

	ld hl, $c000
	ld de, 16384
	call _depack
ret
;#END_ASM

PUBLIC _load_background2
;#BEGIN_ASM
;;must be in UNCONTENDED
_load_background2:

	ld hl, 16384
	ld de, $c000
	ld bc, 6912
	ldir			; copy the background to the alternate screen
ret
;#END_ASM



;;troubleshooting this #676e
PUBLIC _DrawGameMap
;#BEGIN_ASM
;;in CONTENDED
_DrawGameMap:
	EXTERN _current_screen
	EXTERN _map_displacement
	EXTERN _map_xpos
	EXTERN _CurLevel_XLength
	EXTERN _DrawMap
;;	EXTERN _BankRam

;;here $7ffd = 0001-0000


;;#c046 is where wyz player resides

	ld a, (_current_screen)
;;#676e $7ffd = 0001-0000
	;; we load the screen

	ld b, a
;;#6771 $7ffd = 0001-0000
	
;;b and a are FB = 248 = 1111 1000
;; so we are in Bank 0, shadow screen is on

;;#c046 = wyz
;;here $7ffd = 0001-0000
	
	call _BankRam
;;#6772 $7ffd = 1111-1011
	;; we put it on $c000 - $ffff
	
	;;I believe we are in the shadow screen
	
;;halt ;;here $7ffd = 0001-1011
;;#c046 = wyz

	ld a, (_current_screen)
	;;#6738
	
;;halt = wyz = c046
	

	xor 2
	;;#673b
	;; 5 xor 2 = 7; 7 xor 2 = 5
	
	
	ld (_current_screen), a
	;;673d
	;; we exchange the screen on which we are going to write



	ld a, (_CurLevel_XLength)
	ld h,0
	ld l,a
	ld d, $a0
	ld a, (_map_xpos)
	ld e, a				
	;; the map will always start at $a000, so the displacement will always be in E
	ld a, (_map_displacement)
	and $03
	ld c, a				
	;; displacement in pixels within tile
	ld a, (_map_displacement)
	and $0C
	rrca
	rrca
	
	
	ld b, a				
	;; displacement in chars within tile
	

;; Use of registers:
;;	IYh: height counter (16)
;;	IYl: tile width counter (10)
;;	IX: Tiles table pointer. Follow the following logic:  1111 XXYY YYYZ ZZZZ, where
;;		X: pixel offset
;;		Y: tile number (0-31)
;;		Z: bytes inside of the tile (32)
;;	HL', DE': they will move across the screen
;;	BC': it is used as a temporary variable	


;;halt
;;here $7ffd = 1111 1011

	call _DrawMap;; in UNCONTENDED
	
	

ret
;#END_ASM


PUBLIC _DrawSpriteList1
;#BEGIN_ASM
;;in CONTENDED
_DrawSpriteList1:
EXTERN _DrawSprite
EXTERN _ship_x
EXTERN _ship_y

	ld a, (_ship_x)
	ld b, a
	ld a, (_ship_y)
	ld c,a
	ld de, 0		; _ship01
	call _DrawSprite	;drawsprite

	ld a, (_ship_x)
	add a,16
	ld b, a
	ld a, (_ship_y)
	ld c,a	
	ld de, 1		;_ship02
	call _DrawSprite	;drawsprite

ret
;#END_ASM
