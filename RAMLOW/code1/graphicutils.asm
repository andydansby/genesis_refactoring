;;graphicutils.asm
;; these are short routines that are pulled from graphicutils.h

PUBLIC _clean_screen
;#BEGIN_ASM
_clean_screen:
	di
	ld b, 5
	call _BankRam

	ld hl, $C000
	ld de, $C001
	ld bc, 4095		;;top 2 3rds of screen
	ld (hl),0		;;set pixel to 0
	ldir
	
	;;ldir=
	;;HL = source address
	;;DE = target address
	;;BC = countdown number
	;;increments HL and DE
	;;and
	;;deincrements BC until BC = 0
	
	ld hl, $d800
	ld de, $d801
	ld bc, 511
	ld (hl), $05
	ldir
	
;;ok to here
	
;;now repeat the same for shadow screen
	ld b, 7
	call _BankRam
	
	ld hl, $C000
	ld de, $C001
	ld bc, 4095
	ld (hl),0	
	ldir
	
	
	ld hl, $d800
	ld de, $d801
	ld bc, 511
	ld (hl), $05	
	ldir

;;#682a

	;;back to bank 0
	ld b, 0
	call _BankRam		; back to normal
	ei
	
ret
;#END_ASM


PUBLIC _load_backgroundASM
_load_backgroundASM:
;#BEGIN_ASM
extern _background

push bc
push hl
push de

	di

	ld b, 3				;; Static images in RAM3
	call _BankRam		;; we put it in $c000 - $ffff	
	ld hl, _background
	ld de, 0x4000
	call _depack
	;;hl = source	de = dest
	


	ld b, 7
	call _BankRam		;; we put it in $c000 - $ffff	
	ld hl, 0x4000
	ld de, 0xC000
	ld bc, 0x1B00
	ldir			
		;; copy the background to the alternate screen
	
;;	ld b, 5
;;	call _BankRam
;;	ld hl, 0x4000
;;	ld de, 0xC000
;;	ld bc, 0x1B00
;;	ldir
	
	;;ldir=
	;;HL = source address
	;;DE = target address
	;;BC = countdown number
	;;increments HL and DE
	;;and
	;;deincrements BC until BC = 0



	ld b, 0
	call _BankRam		; back to reality
	ei


pop de
pop hl
pop bc	
	
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
	

;;#c046 = wyz

	ld a, (_current_screen)
	;;#6738
	

	

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


PUBLIC _screenLoop
;#BEGIN_ASM
_screenLoop:

EXTERN _WYZ_PLAY
EXTERN _DrawGameMap
EXTERN _current_screen

;;halt;;score screen shifted

	waitvblank:
		ld a,r
		jp m, waitvblank
;; while the screen has not been switched, we cannot continue
;;-----------------------



	di;;here $7ffd = 0001-0000
	call _DrawGameMap;;graphicutils.asm
;; in contended RAM #62ac
;; draw map, interrupts must be disabled
;;will call _DrawMap in drawmap.asm
;;located in RAMMAIN

;; _DrawMap will then call _ClearMapArea
;; located in clearMapArea.asm
;;located in RAMMAIN

;;score screen shifted

;;temp
;;call _switchscreen

	ld b, 0
	call _BankRam

	call _INICIO
	;; we have missed one interrupt for sure, so call player
	;; WYZ_PLAY _INICIO _WYZ_PLAY
	;; call c03f	

	ld a, (_current_screen)
	xor 2
	ld b, a
	call _BankRam
	;; restore the previous paging state
	ei
	


	call _DrawSpriteList1	
	;; draw player sprite
	;;seems to work OK


	
	
	
	
	ld a,r
	or $80
	ld r,a
	;; set the highest bit of R to 1, so switch screen!!!!
	

	
	di
	ld b, 0
	call _BankRam
	
;;temp
;;call _switchscreen
;;call _borderTest
;;call _screenLoop


	ei
	
	
ret
;#END_ASM
