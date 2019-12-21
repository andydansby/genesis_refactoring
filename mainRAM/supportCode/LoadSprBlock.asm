;;LoadSprBlock.asm


PUBLIC _LoadSprBlock
_LoadSprBlock:
;#BEGIN_ASM

	;; Load a block of sprites to the current working set
	;; dstspr (0-63): first sprite to load
	;; sourcespr (0-448): source to load from
	;; numspr (1-64): number of sprites to load
	;;__asm

	di
	
	ld a, (23388)
	and $07			;; keep low bits
	push af			;; save current state	
	ld b, 1
	call _setrambank
	;; go to ram bank 1 to manage the sprites

	ld hl, 8
	add hl, sp
	ld e, (hl)
	dec hl
	ld d, (hl)		;; DE gets dstspr
	dec hl
	ld c, (hl)
	dec hl
	ld b, (hl)		;; BC gets sourcespr
	dec hl
	ld a, (hl)		;; A gets numspr
	ld h, b
	ld l, c			;; HL gets sourcespr now

	;; basically, we copy (numspr * 32) bytes, from (49152 + 2048 + (sourcespr*32)) to 49152 + (firstspr*32)
	
	rrca
	rrca
	rrca
	ld c, a
	and $1f
	ld b, a
	ld a, c
	and $e0
	ld c, a			;; BC = numspr *32

	ld a, e
	rrca
	rrca
	rrca
	ld e, a
	and $1f
	ld d, a
	ld a, e
	and $e0
	ld e, a			;; DE = firstspr*32
	push hl
	ld hl, 49152
	add hl, de	
	ex de, hl		;; DE = (firstspr*32) + 49152
	pop hl
	push de			;; we will need DE for some calculations

	ld a, l
	rrca
	rrca
	rrca
	ld e, a
	and $1f
	ld d, a
	ld a, e
	and $e0
	ld e, a			;; DE = (low byte of sourcespr)*32

	ld a, h
	rrca
	rrca
	rrca
	and $e0
	or d
	ld h, a
	ld l, e
	ld de, 49152+2048
	add hl, de		
	;; HL = 49152 + 2048 + (sourcespr*32))
	pop de

	ldir			;; copy all stuff

	pop af			;; recover RAM bank state
	ld b, a
	call _setrambank		;; go back to normal state
	ei
ret
;#END_ASM		
		
;;	__endasm
;;}