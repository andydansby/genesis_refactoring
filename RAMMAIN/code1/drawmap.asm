;;attention - need to translate



;;section code_user

SECTION UNCONTENDED

PUBLIC _DrawMap
;#BEGIN_ASM
;;must be in UNCONTENDED
_DrawMap:

EXTERN _ClearMapArea

;; Routine to paint the map ... may God catch me confessed

;; Entry:
;; 	DE: Map + scrolling through the map in tiles
;; 	BC: map scrolling; B: chars (0-2), C: pixels (0,1,2,3)
;; 	HL: map width in characters
;;	TablaTiles: table with tiles already preshifted (ver create_shifted_tiles.asm), in $B000


;; Use of registers:
;;	IYh: height counter (16)
;;	IYl: tile width counter (10)
;;	IX: Tiles table pointer. Follow the following logic:  1111 XXYY YYYZ ZZZZ, where
;;		X: pixel offset
;;		Y: tile number (0-31)
;;		Z: bytes inside of the tile (32)
;;	HL', DE': they will move across the screen
;;	BC': it is used as a temporary variable

;; IMPORTANT: ENTER WITH DISABLED INTERRUPTIONS!!!!!!!


	push de
	call _ClearMapArea
;; clean the screen

	ld de, -11
	add hl, de			
	pop de				
	;; we calculate the width of the map - 11, to add it later

	ld a, b
	and a				
;; if b == 0, we will take 3 tiles already, so one less is done



	jp z, chars_not_zero

	ld a, 10			
;;if it isn't, you have to do one more tile (10)
	jr dm_save_sp


chars_not_zero:
	ld a,9
	
dm_save_sp:


	ld (centertiles),a
	


	ld (dm_restoresp+1), SP		
;; we play with SP, so there can be no active interruptions



	ld iyh, 16			; 16 characters high 
	ld a, c
	rlca
	rlca				
;; we move the displacement in pixels to 0000xx00



	or $b0

	ld ixh, a

	exx				; alternate regset
	;ld hl, 16384
	;ld de, 16384
	ld hl, $C000
	ld de, $C000
	ld d,h
	ld e,l
	ld ixl,e
	exx				; we load the screen address in HL and DE

draw_loopy:				
;; Tile more to the left
	ld a, (de)			
;; we take the first tile
	inc de
	
	and a
;; for empty tiles, we follow a different path
	jp nz, draw_loopy_notzero


	ld a, 3
	sub b				
	exx				; alternate regset


	
draw_loopy_zero:	
	inc de
	inc hl
	dec a
	jp nz, draw_loopy_zero		; we do this whole loop to leave increased
	
	jp go_to_center



draw_loopy_notzero:
	exx				; alternate regset
	rrca
	rrca
	rrca				; we pass the tile number to yyy000yy	
	ld b,a
	and 3				; we are left with the upper two bits 000000yy
	ld c, a				; and copy them to C
	ld a,b

	and $e0				 
	ld ixl, a			
;; ixl has yyy00000, then IX has a pointer to the first byte of the tile
	ld a, ixh			
	and $FC
;; we are left with only the 6 most significant bits
	or c				
	ld ixh, a			
;; ixh has now 1111xxyy


;   	and $e0            
;  	ld b, a            ; in B we keep the bottom three bits yyy00000
;   	ld a, ixh         
;   	and $FC            ; we remain with the 6 most significant bits
;   	or c            
;   	ld ixh, a         ; ixh has now 1111xxyy
;   	ld a,b
;	ld ixl, a         ; ixl has yyy00000, then IX has a pointer to the first byte of the tile
	exx				; normal regset
			
	ld a, b
	inc a				
	rlca
	rlca
	rlca				
;; in A we have the displacement in chars * 8, to go to the first column
;; del tile
	or ixl
	ld ixl, a
;; and in IXL we are exactly in the first of the bytes
	ld SP, IX
;; and there we have the pointer of the stack

	ld a, 3
	sub b
;; in A we have the number of columns to paint
;; Now we start painting the tile on the screen!
	exx				; alternate regset
	

	
leftmost_loop:
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
;; the 8 bytes of the tile

	inc de
;; we go to the next pixel
	ld h,d
	ld l,e			
	dec a
	jp nz, leftmost_loop
;; we draw as many columns as necessary
	
	

go_to_center:
	dec de
;; the last tile will have to do OR with the first of the next
	dec hl
	exx				; normal regset

;; Now it's time to treat the central area. Each tile is 3 characters wide, 32/3 = 10 plus the peaks
	
	ld a, (centertiles)
	ld iyl, a
	
	

draw_center_tiles:	
	ld a, (de)			; we take the tile
	inc de
;; the map points to the next
	
	and a
;; for empty tiles, we follow a different path
	jp nz, draw_center_notzero
	exx
	inc de
	inc de
	inc de
	ld h,d
	ld l,e
	jp continue_center_loop
;; that is all we do!
	
	

draw_center_notzero:
	exx				; alternate regset
	rrca
	rrca
	rrca				; we pass the tile number to yyy000yy	
	ld b,a
	and 3				; we are left with the upper two bits 000000yy
	ld c, a				; and copy them to C
	ld a,b

	and $e0				 
	ld ixl, a			; ixl has yyy00000, then IX has a pointer to the first byte of the tile
	ld a, ixh			
	and $FC				; we are left with only the 6 most significant bits
	or c				
	ld ixh, a			; ixh has now 1111xxyy
;   and $e0            
;   ld b, a            ; in B we keep the bottom three bits yyy00000
;   ld a, ixh         
;   and $FC            ; we remain with the 6 most significant bits
;   or c            
;   ld ixh, a         ; ixh has now 1111xxyy
;   ld a,b
;   ld ixl, a         ; ixl has yyy00000, then IX has a pointer to the first byte of the tile



	ld SP, IX			; and there we have the pointer of the stack

;; the tile on the left of the whole does OR with whatever is on the screen
draw_or_left:
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a

	inc de
	ld h,d
	ld l,e		; next character
	
	
	
draw_direct_rest:
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h	
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b	; 8 bytes == 1 character high

	inc de
	ld h,d
	ld l,e		; next character

	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h	
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b	; 8 bytes == 1 character high

	inc de
	ld h,d
	ld l,e		; next character

	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h	
	pop bc
	ld (hl),c
	inc h
	ld (hl),b
	inc h
	pop bc
	ld (hl),c
	inc h
	ld (hl),b	; 8 bytes == 1 character high

	ld h,d
	ld l,e
;; after the last one we don't go to the next character, because the new one does OR
	
	

continue_center_loop:	
	exx		; normal regset
	dec iyl				; we continue with the loop
	jp nz, draw_center_tiles
	


;; Here you would have to go to the right tile at all. For not rolling it anymore, we leave it for now

draw_loopy_right:
;; Turn right

	ld a, (de)
;; we take the tile
	inc de
;; the map points to the next
	and a
;; for empty tiles, we follow a different path
	jp nz, draw_right_notzero

	ld a, 4
;; if b = 0 we paint 2 columns, if b = 1 0, if b = 2 1
	sub b
;; the formula is a bit weird but it works
	and 4
	or b				; carry flag=0
	rra
;; in A we have the number of columns to paint				
	exx				; alternate regset
	inc de
	inc hl
	and a
	jp z, draw_next_line
draw_right_zero:	
	inc de
	inc hl
	dec a
	jp nz, draw_right_zero
;; we do all this loop to leave DE increased
	jp draw_next_line

draw_right_notzero:
	exx				; alternate regset
	rrca
	rrca
	rrca
;; we pass the tile number to yyy000yy	
	ld b,a
	and 3
;; we are left with the upper two bits 000000yy
	ld c, a
;; and copy them to C
	ld a,b

	and $e0				 
	ld ixl, a
;; ixl has yyy00000, then IX has a pointer to the first byte of the tile
	ld a, ixh			
	and $FC
;; we are left with only the 6 most significant bits
	or c				
	ld ixh, a
;; ixh has now 1111xxyy
 
;  and $e0            
;   ld b, a            ; in B we keep the bottom three bits yyy00000
;   ld a, ixh         
;   and $FC            ; we remain with the 6 most significant bits
;   or c            
;   ld ixh, a         ; ixh has now 1111xxyy
;   ld a,b
;   ld ixl, a         ; ixl has yyy00000, then IX has a pointer to the first byte of the tile

	ld SP, IX			; and there we have the pointer of the stack

	
;; Now we start painting the tile on the screen!
;; the tile on the left of the whole does OR with whatever is on the screen
draw_or_rightmost_left:
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a
	inc h
	pop bc
	ld a, (hl)
	or c
	ld (hl),a
	inc h
	ld a, (hl)
	or b
	ld (hl),a

	inc de
	ld h,d
	ld l,e		; next character

	exx			; normal regset
	ld a, 4
;; if b = 0 we paint 2 columns, if b = 1 0, if b = 2 1
	sub b
;; the formula is a bit weird but it works
	and 4
	or b				; carry flag=0
	rra
;; in A we have the number of columns to paint	
	exx		;alternate regset
	and a
	jp z, draw_next_line

rightmost_loop:
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
	inc h
	pop bc
	ld (hl), c
	inc h
	ld (hl), b
;; the 8 bytes of the tile

	inc de
;; we pass the next pixel
	ld h,d
	ld l,e			
	dec a
	jp nz, rightmost_loop
;; we draw as many columns as necessary

draw_next_line:	
	ld a, d
	cp $C1
;; if DE is $ C100 we go to the next third of the screen
	jr nz, not_second_third
	ld d, $C8
not_second_third:	
	ld h,d
	ld l,e
;; we go to the next line
	exx		; normal regset
	ld a, b
	and a
;; if b! = 0, we made a tile of more
	jp z, b_not_zero
	dec de
b_not_zero:	
	ex de, hl
;; hl now has the point on the map, and the width-11
	add hl, de
	ex de, hl
;; We have already jumped to the next line

	dec iyh
	jp nz, draw_loopy


dm_restoresp: 
	ld sp, 0	
	;; This value is modified at the beginning!
	
	
ret

centertiles:
	defb 0
;#END_ASM


