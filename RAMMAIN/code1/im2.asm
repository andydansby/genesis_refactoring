;;im2.asm
;;SECTION UNCONTENDED
EXTERN _borderTest




;---------------------------------

;;to replace current ISR
PUBLIC _game_interupt
_game_interupt:
	push hl
	push af
	push bc
	push de
	push ix
	push iy
	ex af, af'
	push af
	ex af, af'
		call _gameISR1
	ex af, af'
	pop af
	ex af, af'
	pop iy
	pop ix
	pop de
	pop bc
	pop af
	pop hl
	ei
ret	;
;---------------------------------
;;starts at #615B-6166
PUBLIC _gameISR1
;#BEGIN_ASM
_gameISR1:
	ld a,r
	
	EXTERN _noscreenswitch
	EXTERN _switchscreen
	
	jp p, _noscreenswitch	; the highest bit of R is 0, no screen switch yet


	call _switchscreen	; switch screen
	
	ld a, r
	and $7f
	ld r,a	
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
ret
;#END_ASM
