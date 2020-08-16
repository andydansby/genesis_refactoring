
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

PUBLIC _Interrupt_setup
_Interrupt_setup:
;#BEGIN_ASM
;;	extern _Interrupt_setup
;;	extern _SetIM2
;;	extern _ISRsetup

	di;; disable interrupts before starting 

	call _SET_IM2
	call _IM2_Vector_set;;fill up the vector table
	
ret
;#END_ASM

;;---------------------------------

PUBLIC _SET_IM2
_SET_IM2:
;#BEGIN_ASM
	;;_IM2_Vector is found at 9e00 as defined by SECTION IM_MATRIX

	di			; disable interrupts
	ld A, $9e	; set high bit
	;;Set the interrupt vector register to the high byte of the vector table at $9e00   example i = #FE and set Mode 2 interrupts
		
	ld I, A; push to I, now set
	im 2
ret
;#END_ASM

;;---------------------------------
PUBLIC _IM2_Vector_set
;#BEGIN_ASM
_IM2_Vector_set:

extern _IM2_Vector
extern _IM2ISR

;; On the Spectrum 128, interrupt vectors may only be placed between $80ff and $beff inclusive.  An interrupt routing itself must exist wholly between 4000 and $BFFF.  This is because address $c000 to $ffff are pageabe and should an interrupt occur while the wrong 16k RAM is paged in, you will invatiably get a crash.  The ROM area is also constantly paging between the two ROMs so you can't use this as a vector either.  The (new) ROM constantly uses RAM page 7 - the normal page selected by BASIC is RAM page 0.  If an interrupt vector or routine is paged in, the results will be catastrophc.  Be warned.
;;0x9e00
	;;_IM2ISR
	
	;;need to create a 16 bit address 9d9d
	push de
	push hl
	
	ld de, _IM2ISR
	
	ld hl, _IM2_Vector	;;ld (hl), 0x9f
	ld (hl), d
	
	;; fill the 257 byte table for IM2
	;; copy data 
	;; from address HL 
	;; to address DE 
	;; with BC used as a counter
	ld hl, _IM2_Vector
	ld de, _IM2_Vector+1
	ld bc, 0x101
	ldir
	
	pop hl
	pop de
ret
;#END_ASM



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



