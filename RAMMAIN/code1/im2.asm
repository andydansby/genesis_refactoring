
SECTION ISR_ROUTINE	;;0x9d00

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



;;---------------------------------

;;starts at #615B-6166
PUBLIC _gameISR1
;#BEGIN_ASM
_gameISR1:
;;this gets called in the middle of _IM2ISR by 
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


;;---------------------------------



