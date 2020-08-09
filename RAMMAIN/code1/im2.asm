SECTION ISR_ROUTINE

PUBLIC _IM2ISR
_IM2ISR:
	push hl
	push af
	push bc
	push de
	push ix
	push iy
	ex af, af'
	push af
	ex af, af'

;//_israddr:
;//	call 0000 	; to be substituted with the actual ISR handler address

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


;;---------------------------------
PUBLIC _Set_screen_flip_flag
;#BEGIN_ASM
_Set_screen_flip_flag:
;; clear the highest bit of the R register. It will be used to flag for a screen switch
	ld a,r
	and $7f	
	ld r,a
;; set the highest bit of R to 0, so do not switch screen!!!!
ret
;#END_ASM

;;---------------------------------

;;SECTION UNCONTENDED


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



;;im2.asm
;;goes in UNCONTENDED memory
;;EXTERN _borderTest

;; On the Spectrum 128, interrupt vectors may only be placed between $80ff and $beff inclusive.  An interrupt routing itself must exist wholly between 4000 and $BFFF.  This is because address $c000 to $ffff are pageabe and should an interrupt occur while the wrong 16k RAM is paged in, you will invatiably get a crash.  The ROM area is also constantly paging between the two ROMs so you can't use this as a vector either.  The (new) ROM constantly uses RAM page 7 - the normal page selected by BASIC is RAM page 0.  If an interrupt vector or routine is paged in, the results will be catastrophc.  Be warned.



