;;im2.asm
;;SECTION UNCONTENDED
EXTERN _borderTest




;---------------------------------
;;starts at #615B-6166
PUBLIC _gameISR1
;#BEGIN_ASM
_gameISR1:
	EXTERN _noscreenswitch;;RAMLOW
	EXTERN _switchscreen;;RAMLOW

	ld a,r
	
	jp p, _noscreenswitch	; the highest bit of R is 0, no screen switch yet
	
	call _switchscreen	; switch screen
	
	ld a, r
	and $7f
	ld r,a	
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
ret
;#END_ASM











PUBLIC _SetIM2
;#BEGIN_ASM
;; Set IM2 mode, prepare IM2 table 
;;(257 bytes with the same value)
;; INPUT: 
;;	A: byte to set for the table -> interrupt will go to AA
;;	HL: IM2 table (257 bytes, L must be 0)
;;	DE: address with the ISR handler
_SetIM2:
	di
	ld (israddr + 1), de
	;; set address in handler
	;;DE: address with the ISR handler	
	;;ATTENTION is DEset with correct address on entry?
	
	
	
	push af
	ld a, h
	ld i, a
	pop af				; set the I register

	ld (hl), a
	ld d,h
	ld e,l
	inc de			
	ld bc, 256
	ldir
	; fill the 257 byte table
	;; copy data from address HL to address DE with BC used as a counter

	ld d, a
	ld e, a				; DE=AA		
	ld hl, BASICISR
	ld bc, 27
	ldir; copy BASIC ISR, which will call to the cool one
;; copy data from address HL to address DE 
;;with BC used as a counter

	im 2
	ei
;;	!!ATTENTION		
;;halt;;used for tracing program

ret 
;#END_ASM

PUBLIC BASICISR
;#BEGIN_ASM
BASICISR:
	push hl
	push af
	push bc
	push de
	push ix
	push iy
	ex af, af'
	push af
	ex af, af'

israddr:
	call 0 	; to be substituted with the actual ISR handler address

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
ret	; total: 27 bytes!
;#END_ASM

;---------------------------------

;;to replace current ISR
PUBLIC _game_interupt
;#BEGIN_ASM
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
;#END_ASM

