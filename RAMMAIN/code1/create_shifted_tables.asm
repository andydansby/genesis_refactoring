SECTION UNCONTENDED
;SECTION code_user

;;create_shifted_tables.asm
;;CreaTablaTiles:
;;TablaTiles

;; Exit:
;; - TablaTiles (aligned in 4K): Shifted Tiles,
;; according to the following criteria:
;;defc		TablaTiles	= $B000		;45056
PUBLIC TablaTiles
TablaTiles:
defs 4096;;0x1000

;;stays in main RAM


; Creation of the shifted tiles table,
; from the 32 normal tiles of a level
;
; Entry:
;	- DE: Table pointer
;	-  B: Number of tiles (1-32)
;
; Exit:
;	- TablaTiles (aligned in 4K): Shifted Tiles,
;	according to the following criteria:
;
;	$1011 XXYY YYYZ ZZZZ
;
;	XX: shift (0-3)
;	YYYYY: tile number (0-31)
;	ZZZZZ: shifted tile bytes (32). The first 8 bytes
;	they are the first column, the following the second, etc.
;
;	The tiles of origin are also organized by columns
;
; The algorithm is simple (and not too fast), and is based on making rl (hl) to rough,
; after organizing the table with the initial data
;
;;in zx assembler starts at line 10274 - address 10463
;; in rammain.txt shows as G A $28DF _CreaTablaTiles (section UNCONTENDED) (file create_shifted_tables.asm:35)
;;$28df = address 10463

;;32768+10463 = 43231 = a8df

PUBLIC _CreaTablaTiles
_CreaTablaTiles:
;;starts at 84AA 33962
	push iy
	; First, clean the tile table with zeros
	push de
	push bc
	ld hl, TablaTiles	;8e26
	ld de, TablaTiles + 1
	ld (hl),0
	ld bc, 4095
	ldir
	pop bc
	pop de
	
	ld hl, TablaTiles
	;ld a, b
	ld ixh, b		; ixh == number of tiles
	push bc
	push de
	ld bc, 8
	
copiatiles_outerloop:
	ld ixl, 24
	add hl,bc		; skip the first tile
	
copiatiles_innerloop:
	ld a, (de)
	inc de
	ld (hl), a		; just copy for now
	inc hl
	dec ixl
	jr nz, copiatiles_innerloop
	dec ixh
	jr nz, copiatiles_outerloop ; do it number of tiles times

	pop de
	pop bc
	ld hl, TablaTiles+1024
	;ld a, b
	ld ixh, b		; ixh == number of tiles
	push bc
	push de
	ld bc, 8
	
	
copiatiles_outerloop2:
	ld ixl, 24
	add hl,bc		; skip the first tile
	
copiatiles_innerloop2:
	ld a, (de)
	inc de
	ld (hl), a		; just copy for now
	inc hl
	dec ixl
	jr nz, copiatiles_innerloop2
	dec ixh
	jr nz, copiatiles_outerloop2 ; do it number of tiles times

	pop de
	pop bc
	ld hl, TablaTiles+2048
	;ld a, b
	ld ixh, b		; ixh == number of tiles
	push bc
	push de
	ld bc, 8
	
copiatiles_outerloop3:
	ld ixl, 24
	add hl,bc		; skip the first tile
	
copiatiles_innerloop3:
	ld a, (de)
	inc de
	ld (hl), a		; just copy for now
	inc hl
	dec ixl
	jr nz, copiatiles_innerloop3
	dec ixh
	jr nz, copiatiles_outerloop3 ; do it number of tiles times

	pop de
	pop bc
	ld hl, TablaTiles+3072
	;ld a, b
	ld ixh, b		; ixh == number of tiles
	push bc
;	push de			; not needed anymore
	ld bc, 8
	
copiatiles_outerloop4:
	ld ixl, 24
	add hl,bc		; skip the first tile
	
copiatiles_innerloop4:
	ld a, (de)
	inc de
	ld (hl), a		; just copy for now
	inc hl
	dec ixl
	jr nz, copiatiles_innerloop4
	dec ixh
	jr nz, copiatiles_outerloop4 ; do it number of tiles times

;	pop de
;	jr endCreaTablaTiles
	;Now we have the tiles already copied, with the first blank tile
	; The next step is to go through the tile table, doing rl (hl)


	ld iyl, 0		; a simple counter
	ld hl, TablaTiles
	ld (SaveTablaTiles), hl

newshift:
	ld a, iyl
	add a, 2
	ld iyh, a		; iyh keep the current counter
	ld iyl, a		; iyl keep the counter for the next time
	ld hl, (SaveTablaTiles)
	ld de, 1024
	add hl, de
	ld (SaveTablaTiles), hl ; adding 1024 we go to the next set of tiles shifted
	
shiftloop:
	ld hl, (SaveTablaTiles)
	pop bc			; cleanup
	;ld a, b
	ld ixh, b		; ixh== nummber of tiles
	push bc
	ld bc, 8		; we use it later

rotateouter:
	ld a, 8			; 8 pixels high
	ld de, 24

looprotate:
	and a			; clean carry flag
	add hl, de		; we go to the last
	rl (hl)
	rla			; save the carry flag in the least significant bit of A
	sbc hl, bc		; we go to the previous one
	rra			; we retrieve the carry flag
	rl (hl)
	rla
	sbc hl, bc
	rra
	rl (hl)
	rla
	sbc hl, bc
	rra
	rl (hl)			;we rotate the 4 bytes

	inc hl			; next line
	dec a
	jr nz, looprotate
	
	add hl, de		; we go to the next megatile

	dec ixh
	jp nz, rotateouter	; we continue
	dec iyh
	jp nz, shiftloop	; we do iyh times
	ld a, iyl
	cp 6
	jr nz, newshift		; calculate new shift and go

endCreaTablaTiles:
	pop bc 		; cleanup
	pop iy
ret



;----------------------------------------
;  VARIABLE AREA
;----------------------------------------				
SaveTablaTiles:
	defw 0

