;;twas in ramlow

;;----------------------------------

;;starts at $603A
;;probally because it fills a direct address space rather than the _IM2table table

PUBLIC _SetIM2
;#BEGIN_ASM
;; Set IM2 mode, prepare IM2 table (257 bytes with the same value)
;;
;; INPUT: 
;;	A: byte to set for the table -> interrupt will go to AA
;;	HL: IM2 table (257 bytes, L must be 0)
;;	DE: address with the ISR handler
	
_SetIM2:
	di	
	;;ATTENTION gets funny here
	;;some self modifying code
	ld (_israddr), de
	;; set address in handler
	;;ld (_israddr + 1), de

	;;THIS IS CERTAINLY SELF MODIFYING CODE
	;; in _israddr there is a CALL 0000
	;;the 0000 gets replaced
	
	

	push af
	ld a, h
	ld i, a
	pop af						; set the I register

	ld (hl), a
	
	;;;;;
	ld d,h
	ld e,l
	inc de
	;;could perhaps make a 27 or 28 byte table that would be empty and fill in that table with ISR
	
	
	ld bc, 256
	ldir
	; fill the 257 byte table
	;;Source address in HL, a target address in DE, and a 16-bit count in BC
	

	;;ld de, _ISR_space
	ld d, a
	ld e, a;; DE=AA	
	;;ld de, _ISR_space

	
	ld hl, _BASICISR
	ld bc, 27
	ldir				
	;; copy BASIC ISR, which will call to the cool one
	;; Source address in HL, a target address in DE, and a 16-bit count in BC

	im 2

	ei
ret
;#END_ASM

;----------------------------------
;;starts at $602E

;; runs once during game setup
PUBLIC _interuptSetup
;#BEGIN_ASM
_interuptSetup:

	nop	;;used to make sure that the next line is compiled
	ld a, r
	and $7f
	ld r,a
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
	
	ld a, 0x8a
	
	ld hl, _IM2table
	;;	ld hl, 0x6018
	;; 0x8000 was a 257 byte table for the interupt manager
	;;now 257 byte from 6018 - 6119


	ld de, _gameISR1	
	;;	ld de, $614f
	;;load de with actual _gameISR
	
	;;ATTENTION $6088 calls _read_joystick first and then calls asm routine found in utils.h
	
	call _SetIM2
;;seems to only run once
;;seems to crash program
;; perhaps because of fastcall
ret
;#END_ASM

;----------------------------------

;;starts #605B
PUBLIC _BASICISR
;#BEGIN_ASM
_BASICISR:
	push hl
	push af
	push bc
	push de
	push ix
	push iy
	ex af, af'
	push af
	ex af, af'
;#END_ASM

;----------------------------------

;;starts $6066
PUBLIC _israddr
_israddr:
;#BEGIN_ASM
	;;	ATTENTION
	;;	call 0 	; to be substituted with the actual ISR handler address
	
	call _gameISR1
	;; to be substituted with the actual ISR handler address
	
	

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

;----------------------------------

;;starts at #6076
PUBLIC _gameISR1
;#BEGIN_ASM
_gameISR1:
	ld a,r
	jp p, _noscreenswitch	; the highest bit of R is 0, no screen switch yet
	
	call _switchscreen	; switch screen
	
	ld a, r
	and $7f
	ld r,a	
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
ret
;#END_ASM

;----------------------------------


;----------------------------------