
;in main.c

;extern _flushStack;;attention should this stay
call _flushStack;;attention should this stay





;transfers a byte of data from HL to DE until bc = 0
stack_item1:
defw 0
stack_item2:
defw 0
;; clear out the stack pointer
PUBLIC _flushStack
;#BEGIN_ASM
_flushStack:
	
	pop de
	ld (stack_item1), de
	
	pop de
	ld (stack_item2), de

	ld hl, 0
	ld ($5CCB), hl

;;	stack = $5CCB - $5DCB
	ld hl, $5CCB
	ld de, $5CCB + 1
	ld bc, $101
	ldir			;transfers a byte of data from HL to DE until bc = 0
	
;;	ld de, 
	
;	ld de, (initilize_Stack)
;	push de

	ld sp, $5DCB
	
	ld de, (stack_item2)
	push de
	ld de, (stack_item1)
	push de
ret
;#END_ASM




;;;;;;;;;;;;;;;;;;;

SECTION UNCONTENDED


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

;;---------------------------------
PUBLIC _ISRsetup
;#BEGIN_ASM
_ISRsetup:
	
	
	
	;; A: byte to set for the table -> interrupt will go to AA
	;;ld a, 0x8a		;#6c74	ATTENTION needed for IM2 table
	ld a, 0x9f	;;IM_data
	
	;; HL: IM2 table (257 bytes, L must be 0)
	ld hl, 0x101	;IM2table		

;;	ATTENTION This is where IM2 is placed;	_IM2table	0x9f00
	
	;; DE: address with the ISR handler
	ld de, _gameISR1;; _SetIM2 needs to have DE set first

ret
;#END_ASM

;;---------------------------------

PUBLIC _SetIM2
;#BEGIN_ASM
_SetIM2:
	;; Set IM2 mode, prepare IM2 table 
	;;(257 bytes with the same value)
	;; INPUT: 
	;;	A: byte to set for the table -> interrupt will go to AA
	;;	HL: IM2 table (257 bytes, L must be 0)
	;;	DE: address with the ISR handler

	di
	ld (israddr + 1), de
	;; set address in handler
	;;DE: address with the ISR handler	
	;;ATTENTION is DE set with correct address on entry?
	
	
	
	push af
	ld a, h
	ld i, a			; set the I register modifys IR register
	pop af				

	ld (hl), a
	ld d,h
	ld e,l
	inc de
	ld bc, 256
	ldir
	;; fill the 257 byte table for IM2
	;; copy data 
	;; from address HL 
	;; to address DE 
	;; with BC used as a counter
	
	;; interupt manager 2

	ld d, a
	ld e, a				; DE=AA		
	ld hl, BASICISR
	ld bc, 27
	ldir;; copy BASIC ISR, which will call to the cool one
	
	;; copy data from address HL to address DE 
	;;with BC used as a counter

	im 2
	ei
	;;	!!ATTENTION		
	;;halt;;used for tracing program

ret 
;#END_ASM

;;---------------------------------


