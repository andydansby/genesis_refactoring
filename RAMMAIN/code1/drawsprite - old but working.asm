;;drawsprite.asm
;;DrawSprite:

;;Warning at file 'drawsprite.asm' line 267: integer '33740' out of range
;;Warning at file 'drawsprite.asm' line 274: integer '33740' out of range
;;Warning at file 'drawsprite.asm' line 298: integer '33740' out of range
;;Warning at file 'drawsprite.asm' line 303: integer '33740' out of range
;;Warning at file 'drawsprite.asm' line 497: integer '33740' out of range
;;Warning at file 'drawsprite.asm' line 510: integer '33740' out of range



;;---------------------------------
SECTION UNCONTENDED

;;G A $02C8 LRU_first (section UNCONTENDED) (file drawsprite.asm:12)
;;G A $02C9 LRU_last (section UNCONTENDED) (file drawsprite.asm:21)


;;	defc LRU_first = 0
PUBLIC LRU_first
;#BEGIN_ASM
LRU_first:
	defb 0		;;0x0
;#END_ASM


;; pointers to the first and last entry in the cache
;;	defc LRU_last = 41
PUBLIC LRU_last
;#BEGIN_ASM
LRU_last:
	defb 41		;;0x29
;#END_ASM

;; LRU_LASTENTRY   EQU 42
;;defc LRU_LASTENTRY = 42
PUBLIC LRU_LASTENTRY
;#BEGIN_ASM
	LRU_LASTENTRY:
	defb 42		;;0x2a
;#END_ASM	


PUBLIC Multiply_by_96
;#BEGIN_ASM
Multiply_by_96:
	defw 0,96,192,288,384,480,576,672,768,864,960,1056,1152,1248,1344,1440,1536,1632,1728,1824,1920,2016,2112,2208,2304,2400,2496,2592,2688,2784,2880,2976,3072,3168,3264,3360,3456,3552,3648,3744,3840,3936
;#END_ASM


PUBLIC SCRADD
;#BEGIN_ASM
SCRADD:
	defw 0
;#END_ASM


PUBLIC LINECOUNT
;#BEGIN_ASM
LINECOUNT:
	defb 0
;#END_ASM

PUBLIC SAVE_RAMBANK
;#BEGIN_ASM
SAVE_RAMBANK:
	defb 0
;#END_ASM





;; Limited to 16x16 sprites, with mask
;; Originally taken from a tutorial by dmsmith, then modified
;; http://chuntey.arjunnair.in/?cat=68
;;---------------------------------

;; Input:
;;	DE: sprite number
;;	B: X position
;;	C: Y position
;; Required sprite alignment:
;;		mask first
;;		full X line first
;;
;; So, in SevenuP terminology, this means: X char, Mask, Char line, Y char, interleave: sprite, mask before sprite
;; now, the sprite drawing routine includes a sprite cache, with all required handling

;;#9463
PUBLIC _DrawSprite
;#BEGIN_ASM
;;must be in UNCONTENDED
	_DrawSprite:
	
	ld a, b
	and 7					
	;; A == rotation required
	ld ixl, a
	push de

	rl e
	rl d
	rl e
	rl d
	rl e 
	rl d					
	;; sprnum << 3 (Carry was 0)
	or e
	ld e, a					
	;; HL = (sprnum << 3) | rotation

	ld hl, SprCacheTable
	add hl, de				
	;; HL = SprCacheTable[(sprnum << 3) | rotation]
	ld a, (hl)
	cp 255
	jr nz, SprInCache			
	;; Sprite found in cache, since the value is not 255

SprNotFound:	
;; Sprite not found in cache, rotate and move to the top of the list
	pop de
	push bc
	call _InsertSpriteInCache
	jp DrawNow                              
	;; we have the cache entry in

SprInCache:	; Sprite found in cache, move to the top of the list and draw
	pop de
	push bc
	call _MoveSpriteToTop
	; we have the cache entry in (LRU_first)

DrawNow:
	; Now draw the sprite
	; First, calculate the target position: 0x9000+96*LRU_first

	ld a, (LRU_first)
	ld hl, Multiply_by_96
	ld c,a
	ld b,0
	sla c
	add hl, bc		; HL points to the value in the array
	ld c, (hl)
	inc hl
	ld b, (hl)		; BC = 96 * LRU_last
	ld hl, $9000
	add hl, bc		; hl = $9000 + 96 * LRU_last  <- the place in the sprite cache to get the rotated sprite from. 

	pop bc                  ; get X and Y back!
	; now calculate screen addresses and stuff, then paint
	ld (lineloop+1), HL		; save pointer
     
	ld a, 16		; 16-line sprite
	ld (LINECOUNT), a


	ld a, c			; 4
	and $07			; 7  <-the 3 lowest bits are the line within a char
	ld h,a			; 4
	ld a,c			; 4  <- the top 2 bits are the screen third
	rra			; 4
	rra			; 4
	rra			; 4
	and $18			; 7
	or h			; 4
	or $C0			; 4	<- If the start address is 16384, this should be $40
	ld h,a			; 4 (total 50 t-states) H has the high byte of the address 
		
	ld a,b			;4
	rra			;4
	rra			;4
	rra			;4
	and $1f			;7  <- the top 5 bits are the char pos. The low 3 bits are the pixel pos
	ld l,a			;4
	ld a,c			;4
	rla			;4
	rla			;4
	and $e0			;7
	or l			;4
	ld l,a			;4 (total 54 t-states) L has the low byte of the address
	ld (SCRADD),HL		; save the screen address in SCRADD
		

		
lineloop:
	ld hl, 0		; this will be modified with the right value to load
	ld e, (hl)
	inc hl
	ld d, (hl)
	inc hl			; first the mask
	ld c, (hl)
	inc hl
	ld b, (hl)
	inc hl			; then the sprite
	ld a, (hl)
	ld (data+1),a		; third sprite byte				
	inc hl
	ld a, (hl)
	ld (mask+1),a 		; third mask byte
	inc hl
	ld (lineloop+1), hl	; save HL

	ld hl, (SCRADD)		; get screen address in BC
	ld a, (hl)		; get what is there
	and e			; AND with mask
	or c			; OR with sprite data
	ld (hl), a		; store
	inc l			; next char

	ld a, (hl)		; repeat for the next line
	and d
	or b
	ld (hl), a
	inc l

	ld a, (hl)
	
mask:

	and 255			; 255 will be replaced by what was loaded before
	
data:
	or 0			; 0 will be replaced by what was loaded before
	ld (hl), a

	dec l
	dec l
	inc h			; next line

	ld a,h
	and 7
	jr nz, draw_a1		; if the low 3 bits of B are zero
	ld a, l
	add a, 32
	ld l,a
	jr c, draw_a1		; and C + 32 overflows
	ld a,h
	sub 8			; then we go to the next third of the screen
	ld h,a
	
draw_a1:
	ld (SCRADD),hl		; store the screen address again
	ld hl, LINECOUNT
	dec (hl)
	jp nz, lineloop		; go to next line

ret
;#END_ASM

;;---------------------------------

;; Insert sprite in cache. This means
;;  1. Allocate cache entry for the combination
;;  2. Rotate sprite and move to the appropriate place in memory
;;
;;  Input: DE: sprnum 
;;	  IXl: rotation
;;
;;  Output: IX: pointer to the sprite, already rotated




PUBLIC _InsertSpriteInCache
;#BEGIN_ASM
;;must be in UNCONTENDED
_InsertSpriteInCache:
	ld h, $8A			;; pointer to the LRU_prev list
	ld a, (LRU_last)
	ld l, a
	ld a, (hl)				;; A == LRU_newlast,  LRU_newlast = LRU_prev[LRU_last];
	
	
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 281: integer '33740' out of range
	;;	ld (hl), 42
	ld (hl), LRU_LASTENTRY  
	;;  LRU_prev[LRU_last] = LRU_LASTENTRY;


	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 288: integer '33740' out of range
	ld l, LRU_LASTENTRY
	
	
	ld (hl), a
	;;  LRU_prev[LRU_LASTENTRY] = LRU_newlast;

	ex af, af'			
	ld a, (LRU_first)
	ld l, a
	ld a, (LRU_last)			
	ld c, a
	ld (hl), c		; LRU_prev[LRU_first] = LRU_last;
	ld h, $8b		; pointer to the LRU_next list
	ld l, c			; c == LRU_last
	ld a, (LRU_first)
	ld b, a
	ex af, af'

	ld (hl), b		
	;; LRU_next[LRU_last] = LRU_first;
	ld l, a
	
	
	
	
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 316: integer '33740' out of range
	ld (hl), LRU_LASTENTRY  
	;; LRU_next[LRU_newlast] = LRU_LASTENTRY;
	
	
	
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 324: integer '33740' out of range
	ld l, LRU_LASTENTRY
	
	
	ld (hl), c		
	;; LRU_next[LRU_LASTENTRY] = LRU_last;

	ld hl, SprCacheTable
	ld ixh,c			; ixh == LRU_last
			
	ld c, e
	ld b, d			; BC= sprnum
	ex af, af'		; use alternate A
	ld a, ixl		; A' = rotation
	and a			; clear carry flag
		
	rl c
	rl b
	rl c
	rl b
	rl c 
	rl b					
	;; sprnum << 3 (Carry was 0)
	or c
	ld c, a					
	;; HL = (sprnum << 3) | rotation

	add hl, bc				
	;; hl = SprCacheTable[value]

	ex af, af'				
	;; normal A again

	ld c, ixh
	ld (hl), c				
	;; SprCacheTable[value]=LRU_last

	ld b, a					
	;; save LRU_newlast			

	ld a, (LRU_last)
	ld (LRU_first), a			
	;; LRU_first = LRU_last;
	
	ld a,b		
	ld (LRU_last),a				
	;;  LRU_last = LRU_newlast, A is still LRU_newlast


	;; Now we should rotate the sprite and really write it there
	;; First, calculate the target position: 0x9000+96*SprCacheTable[value]
	;; C is LRU_last == SprCacheTable[value]
			
	ld hl, Multiply_by_96
	ld b,0 
	sla c			; to index, we need LRU_LAST * 2
	add hl, bc		; HL points to the value in the array
	ld c, (hl)
	inc hl
	ld b, (hl)		; BC = 96 * LRU_last
	ld hl, $9000
	add hl, bc		; HL = $9000 + 96 * LRU_last  <- the place in the sprite cache to store the rotated sprite

	; The target position is HL, now rotate!
	ld (SCRADD),HL		; save the target address in SCRADD		


	; Here you have to select the RAM bank with the sprites !!!
	di
	ld 	a, (23388)		; System variable with the previous value
	ld 	(SAVE_RAMBANK), a					
	and 	$f8			; keep high bits
	
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 281: integer '154618862332' out of range
	or _SPRITES_BANK			;; ponemos la página 1 arriba
	
	
	
	ld 	bc, $7ffd	; Port to write to
	ld	(23388),a	;Update system variable
	out	(c),a		;Address
	ei


	ld hl, $C000
	and a			; clear carry flag
	rl e
	rl d
	rl e
	rl d
	rl e
	rl d
	rl e
	rl d
	rl e
	rl d
	rl e
	rl d			; DE = sprnum *64
	add hl, de		; HL = first position for the sprite
	ld (insert_lineloop+1),hl


	ld a, 16		; 16-line sprite
	ld (LINECOUNT), a


insert_lineloop:
	ld hl, 0		; this address will be modified
	ld e, (hl)
	inc hl
	ld d, (hl)
	inc hl
	ld c, (hl)
	inc hl
	ld b, (hl)
	inc hl
	ld (insert_lineloop+1),hl			

	ld a, $ff		; a will be shifted to the mask. 1 means transparent
	scf			; transparent
		
	ex af, af'		; a' will be used for the bit rotating loop
	ld a, ixl
	or a
	jr z, insert_skiprotate	; if no rotation is needed, skip this
		
	ld l,a			; l= loop counter
	xor a			; clear carry flag, clear a',since if will be shifted to the image
		
insert_rotateloop:
	ex af, af'		; a ==mask
	rr e
	rr d
	rra
	ex af, af'		; a== sprite data
	rr c
	rr b
	rra	
	dec l
	jp nz, 	insert_rotateloop		; at the end, we have DEa with the rotated mask, BCa' with the rotated sprite

insert_skiprotate:
	ld hl, (SCRADD)		; get screen address in BC
	ld (hl), e
	inc hl
	ld (hl), d		; write DE (mask) in cache
	inc hl
	ld (hl), c
	inc hl
	ld (hl), b		; write BC (sprite) in cache
	inc hl
	ld (hl), a		; write A (last byte of sprite) in cache
	inc hl
	ex af, af'
	ld (hl), a		; write A' (last byte of mask) in cache
	inc hl
	ex af, af'

	ld (SCRADD),hl		; store the write address again
	ld hl, LINECOUNT	
	dec (hl)
	jp nz, insert_lineloop		; go to next line
			
	; Here you have to select the RAM bank with the sprites !!!		
	di
	ld 	a,(SAVE_RAMBANK)
	ld 	bc, $7ffd		; Port to write to
	ld	(23388),a	; Update system variable
	out	(c),a		;Address
	ei
ret
;#END_ASM

;;---------------------------------

;; Move sprite to top of the cache. 
;;  Input: A: entry to move to the top of the cache
;;
;;	C: prev
;;	B: next
;;	E: entry
;;  Output: IX: pointer to the sprite, already rotated ???????
PUBLIC _MoveSpriteToTop
;#BEGIN_ASM
_MoveSpriteToTop:

	ld e, a			; E = entry
	ld h, $8a		; pointer to the LRU_prev list
	ld l, a			; A ==entry
	ld c, (hl)		; C == prev = LRU_prev[entry];
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 518: integer '33740' out of range
	ld (hl), LRU_LASTENTRY  ;; LRU_prev[entry] = LRU_LASTENTRY;

	
	ld a, (LRU_first)
	ld l, a
	ld (hl), e		;   LRU_prev[LRU_first] = entry;  50
	
	ld h, $8b		; pointer to the LRU_next list
	ld l, e			
	ld b, (hl)		; B== next = LRU_next[entry];
	ld l, e
	ld (hl),a		;; LRU_next[entry] = LRU_first;
	
	
	
	;;ATTENTION
	;;Warning at file 'drawsprite.asm' line 535: integer '33740' out of range
	ld l, LRU_LASTENTRY
	
	
	
	ld (hl), e		; LRU_next[LRU_LASTENTRY] = entry;
	ld l, c
	ld (hl), b		; LRU_next[prev] = next; 54

	ld h, $8a
	ld l,b
	ld (hl),c		;   LRU_prev[next] = prev; 
	
	ld a, e
	ld (LRU_first),a	;    LRU_first = entry;
   
ret			; Total: 143 T-states for a cache hit	 
;#END_ASM

;;---------------------------------


;;$A4D7
;; Initialize sprite cache list
;; No entry, no output
;; Modifies: BC, DE, HL, A

PUBLIC _InitSprCacheList
;#BEGIN_ASM
_InitSprCacheList:

extern SprCacheTable
extern LRU_prev
extern LRU_next

	;; First, initialize the Sprite Cache Table with 255

	ld hl, SprCacheTable
	ld de, SprCacheTable+1
	ld (hl),255
	ld bc, 1023
	ldir
	
	;;ldir=
	;;HL = source address
	;;DE = target address
	;;BC = countdown number
	;;increments HL and DE
	;;and
	;;deincrements BC until BC = 0
	
	;; Second, pre-populate the LRU_next and LRU_prev arrays
	;;unsigned char LRU_next[43]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,0};
	;;unsigned char LRU_prev[43]={42,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41};
	
	ld hl, LRU_prev+1
	ld de, LRU_next
	ld b, 42
	ld a, 1
	ld c, 0

loop_InitSprCache:
	ld (hl), c
	ld (de), a
	inc hl
	inc de
	inc a
	inc c
	djnz loop_InitSprCache
	; The final touches
	dec a                 ; A is already 43, so decrement to make it 42
	ld (LRU_prev), a
	xor a
	ld (de), a


ret
;#END_ASM

