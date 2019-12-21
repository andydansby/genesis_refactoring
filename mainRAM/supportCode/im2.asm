
;;ATTENTION, believe this is going to be a hard coded routine that needs to be fixed
;;and can cause alot of issues


PUBLIC _SetIM2
	_SetIM2:
;#BEGIN_ASM
; Set IM2 mode, prepare IM2 table (257 bytes with the same value)
;
; INPUT: 
;	A: byte to set for the table -> interrupt will go to AA
;	HL: IM2 table (257 bytes, L must be 0)
;	DE: address with the ISR handler

		;;	SetIM2:
	di
	ld (israddr + 1), de
	; set address in handler
	push af
	ld a, h
	ld i, a
	pop af				; set the I register

	ld (hl), a
	ld d,h
	ld e,l
	inc de			
	ld bc, 256
	ldir				; fill the 257 byte table

	ld d, a
	ld e, a				; DE=AA		
	ld hl, BASICISR
	ld bc, 27
	ldir				; copy BASIC ISR, which will call to the cool one

	im 2
	ei
ret
;#END_ASM

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

	;;ATTENTION WTF is this - call 0
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
