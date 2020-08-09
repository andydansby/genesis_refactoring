;;graphicutils.asm
;; these are short routines that are pulled from graphicutils.h

extern _map_displacement
extern _map_xpos
extern _CurLevel_XLength
extern _DrawMap

;;Fastcall linkage allows one parameter to be passed by register in a subset of DEHL.  So if the parameter is 8-bit, the value will be in L.  If the parameter is 16-bit, the value is in HL and if it is 32-bit the value is in DEHL.

;;	1st 3rd		#5800-#58FF		22528-22783
;;	2nd 3rd		#5900-#59FF		22784-23039	
;;	3rd 3rd		#5A00-#5Aff		23040-23295

;7   6   5   4   3   2   1  0
;F   B   p2  p1  p0  i2  i1 i0
 
PUBLIC _colorPlayScreen
_colorPlayScreen:

;//need to color bank 5 and 7 attributes area
;#BEGIN_ASM
;	push bc
;	push hl
;	push de
	
	ld b, l; input send via fastcall is in L, send to b
	;;ld b, 0b00000100
	ld hl, 0x5800	;;ld hl, 22528
	ld de, 0x5801	;ld de, 22529
	ld (hl), b		;ld (hl), 0
	ld bc, 0x1FF	;ld bc, 767  attribute blocks to color ;511
	ldir			;ldir
	
;	pop de
;	pop hl
;	pop bc
	
ret
;	FF	BB	P2	P1	P0	I2	I1	I0
;BLACK		000		= 0
;;BLUE		001		= 1
;;RED		010		= 2
;;MAGENTA	011		= 3
;;GREEN		100		= 4
;;CYAN		101		= 5
;;YELLOW	110		= 6
;;WHITE		111		= 7
;; 5 = black paper cyan ink
;;colorPlayScreen(5);// colors the attribues in the top 2/3's of the attributes to a color
;#END_ASM








PUBLIC _clean_screen
;#BEGIN_ASM
_clean_screen:
	di
	ld b, 5
	call _BankRam

	ld hl, $C000	;;
	ld de, $C001	;;
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





PUBLIC _border_Switch
;#BEGIN_ASM
_border_Switch:

;;	and 7
	out (254), a
	
;;	ld a, _current_screen
;;	and 7
;;	out (254), a
ret
;#END_ASM

;;this is used to bank switch between bank 5 and 7 to flip-flop between screens
PUBLIC _current_screen
_current_screen: defb 7
;;_MAP_START = $8000
;;troubleshooting this 

PUBLIC _DrawGameMap
;#BEGIN_ASM
;;in CONTENDED $6785, called by $67BB
_DrawGameMap:

;;here $7ffd = 0001-0000
;;troubleshoot _DrawMap to see if it's erased. $9001

;;#c046 is where wyz player resides

	ld a, (_current_screen);;$6768
	;; we load the screen
;;#676e $7ffd = 0001-0000
	
	ld b, a
;;#676b $7ffd = 0001-0000
	
	;;b and a are FB = 248 = 1111 1000	
	;; so we are in Bank 0, shadow screen is on

;;#c046 = wyz
;;here $7ffd = 0001-0000
	
	call _BankRam;; we put it on $c000 - $ffff
;;#676C $7ffd = 1111-1011


	;;I believe we are in the shadow screen
	
	ld a, (_current_screen);;$676F

	xor 2;;$6772
	;; 5 xor 2 = 7; 7 xor 2 = 5
	;;flip-flop between bank 5 and 7 to achieve animation
	
	ld (_current_screen), a
	;;#6774
	;; we exchange the screen on which we are going to write
	
;;ATTENTION, this is used to test flip-flop
;;call _border_Switch;;$6777


	ld a, (_CurLevel_XLength);;$677A
	ld h,0
	ld l,a
	
	
	;;ATTENTION
	
	;;problem
	;;_MAP_START = $8000 = 32768
	
	;;de needs to be _MAP_START
	
	;;in GS $A000 = 40960
	;;ld d, $80;;ld d, $a0
	ld de, _MAP_START
	
	ld a, (_map_xpos)
	ld e, a
	;; the map will always start at $a000, so the displacement will always be in E
	;;problem
	
	
	
	
	ld a, (_map_displacement);;$6786
	and $03;;$6789
	ld c, a;;$678B			
	;; displacement in pixels within tile
	ld a, (_map_displacement);;$678C
	and $0C;;$678F
	rrca;;$6791
	rrca;;$6792
	
	
	ld b, a;;$6793
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


	call _DrawMap;; in UNCONTENDED #9001
	
;;extern _borderTestEndless
;;call _borderTestEndless
	

ret
;#END_ASM



;;$67C6
PUBLIC _screenLoop
;#BEGIN_ASM
_screenLoop:

EXTERN _WYZ_PLAY

;;uses _current_screen to work with waitvblank

;;#67b2 in GS
	waitvblank:
		ld a,r
		jp m, waitvblank
		;; while the screen has not been switched, we cannot continue
		;;keeps in this loop until the accumlator sign is turned off
		
	di;;#67b7 in GS
	
	call _DrawGameMap ;;see above
	
	
	;;troubleshoot to see if it's erased. $9001
	;; _DrawMap, interrupts must be disabled
	;;will call _DrawMap in drawmap.asm
	;; _DrawMap will then call _ClearMapArea
	;;located in RAMMAIN

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
	

;;buggy need to fix
;;ATTENTION PROBLEM, crash!
;;	call _DrawSpriteList1	

	;;#67d0 in GS
	ld a,r
	or $80
	ld r,a
	;; set the highest bit of R to 1, so switch screen!!!!
	;;#67c8
	
	
	di
	ld b, 0
	call _BankRam
	ei
	
ret
;;ret
;#END_ASM
