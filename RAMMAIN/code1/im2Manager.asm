;;---------------------------------
;;NEEDS to be in a seperate file, what a PAIN!!!
SECTION IM2_ISR_address	;;9d9d	40349
PUBLIC _IM2ISR
_IM2ISR:
;#BEGIN_ASM
EXTERN _gameISR1

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
ret	; total: 27 bytes!
;#END_ASM


