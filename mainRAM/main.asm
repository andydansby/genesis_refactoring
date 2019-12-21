;;main below 49152
SECTION code_user


;;ATTENTION these are direct memory reads and have to be fixed
;#BEGIN_ASM	;; global variables
;; global variables
defc SPRITE_START = $9000
;; we have 4k for sprites, $9000 - $9FFF

defc MAP_START = $A000
;; 4k for the game map, $a000 - $afff

defc TablaTiles = $B000
;;TablaTiles   EQU $B000
;#END_ASM

include "engine.asm"

include "loadBackground.asm"
include "LoadSprBlock.asm"
include "LoadLevel.asm"


;;PUBLIC _blackout
;;	_blackout:
;;#BEGIN_ASM
;;#END_ASM

PUBLIC _PrintLargeNumber
_PrintLargeNumber:
;#BEGIN_ASM
;; Print large char on screen (2x1), from a base number 0..9
;; INPUT:
;;		B: position in X (pixels)
;;		C: position in Y (pixels)
;;		A: number to print
.PrintLargeNumber
	push af
	call _CalcScreenPos_Char	; Screen position in HL ;;ATTENTION
	ex de, hl
	;ld hl, _number_font;;ATTENTION
	pop af
	rlca
	rlca
	rlca
	and $f8			; multiply by 8
	ld c, a
	ld b, 0
	add hl, bc		
	ex de, hl		; HL points to the screen position, DE to the first row of the number
	push hl
	ld b, 4
.printlarge_loop1
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	djnz printlarge_loop1
	pop hl
	ld bc, 32
	add hl, bc
	ld b, 4 
.printlarge_loop2
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	djnz printlarge_loop2
ret
;#END_ASM



PUBLIC _divide_large
_divide_large:
;#BEGIN_ASM
	;; Divide HL by BC
	;;
	;; HL: number
	;; BC: divider
	;; DE: result (HL / BC)
	;; HL: remainder

	;;.divide_large
    xor a
    ld de, 0
.divide_loop
    sbc hl, bc
    jp c, divide_completed
    inc de
    jp divide_loop    
.divide_completed
    add hl, bc
    ret
;#END_ASM

PUBLIC _decompose_5digit
_decompose_5digit:
;#BEGIN_ASM
	ld bc, 10000		; get the fifth digit
	call _divide_large	; E has the result, HL the remainder
	ld (ix+0), e
	ld bc, 1000
	call _divide_large
	ld (ix+1), e
	ld bc, 100
	call _divide_large
	ld (ix+2), e
	ld bc, 10
	call _divide_large
	ld (ix+3), e
	ld (ix+4), l		; L has the last remainder
	ret
;#END_ASM


PUBLIC _PrintLarge_2
_PrintLarge_2:
;#BEGIN_ASM
	;; Print 2-digit number, large
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		A: number to print
	push bc
	ld e, a
	ld d, 10
	;call Div8		; A = number /10 (first digit), D = remainder (second digit);;ATTENTION
	;ld hl, _numbers;;ATTENTION
	ld (hl), a
	inc hl
	ld (hl), d	
	pop bc
	push bc
	push hl
	call PrintLargeNumber	; Print first number
	pop hl
	pop bc
	ld a, 8
	add a, b
	ld b, a			; move 8 pixels right
	ld a, (hl)		; get second digit
	call PrintLargeNumber	; Print second number
ret	
;#END_ASM


PUBLIC _PrintLargeNumber_4000
_PrintLargeNumber_4000:
;#BEGIN_ASM
	;; Print large char on screen (2x1), from a base number
	;;0..9, on a screen based at $4000
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		A: number to print
	push af
	call _CalcScreenPos_Char	; Screen position in HL
	ld a, h
	sub $80
	ld h, a
	ex de, hl
	;ld hl, _number_font;;ATTENTION
	pop af
	rlca
	rlca
	rlca
	and $f8			; multiply by 8
	ld c, a
	ld b, 0
	add hl, bc		
	ex de, hl		; HL points to the screen position, DE to the first row of the number
	push hl
	ld b, 4
.printlarge4000_loop1
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	djnz printlarge4000_loop1
	pop hl
	ld bc, 32
	add hl, bc
	ld b, 4 
.printlarge4000_loop2
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	djnz printlarge4000_loop2
ret
;#END_ASM

PUBLIC _PrintLarge_2_4000
_PrintLarge_2_4000:
;#BEGIN_ASM
	;; Print 2-digit number, large, on a screen based at $4000
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		A: number to print
	push bc
	ld e, a
	ld d, 10
	;call Div8		; A = number /10 (first digit), D = remainder (second digit);;ATTENTION
	;ld hl, _numbers;;ATTENTION
	ld (hl), a
	inc hl
	ld (hl), d	
	pop bc
	push bc
	push hl
	call _PrintLargeNumber_4000	; Print first number
	pop hl
	pop bc
	ld a, 8
	add a, b
	ld b, a			; move 8 pixels right
	ld a, (hl)		; get second digit
	call _PrintLargeNumber_4000	; Print second number
ret
;#END_ASM

PUBLIC _PrintLarge_5
_PrintLarge_5:
;#BEGIN_ASM
	;; Print 5-digit number, large
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		HL: number to print
	;ld ix, _numbers;;ATTENTION
	push bc
	call _decompose_5digit
	pop bc

	ld a, (ix+0)
	push bc
	call PrintLargeNumber
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+1)
	push bc
	call PrintLargeNumber
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+2)
	push bc
	call PrintLargeNumber
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+3)
	push bc
	call PrintLargeNumber
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+4)
	call PrintLargeNumber
	ret
;#END_ASM

PUBLIC _PrintSmall_5
_PrintSmall_5:
;#BEGIN_ASM
	;; Print 5-digit number, small
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		HL: number to print
	;ld ix, _numbers ;;ATTENTION
	push bc
	call _decompose_5digit
	pop bc
	ld a, (ix+0)
	push bc
	call _PrintNumber;1
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+1)
	push bc
	call _PrintNumber;2
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+2)
	push bc
	call _PrintNumber;3
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+3)
	push bc
	call _PrintNumber;4
	pop bc
	ld a, 8
	add a, b
	ld b, a

	ld a, (ix+4)
	call _PrintNumber;5
ret
;#END_ASM

PUBLIC _PrintNumber
_PrintNumber:
;#BEGIN_ASM
	;; Print normal char on screen (1x1), from a base number 0..9
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		A: number to print
	push af
	call _CalcScreenPos_Char	; Screen position in HL
	ex de, hl
	;ld hl, _number_font;;ATTENTION
	pop af
	rlca
	rlca
	rlca
	and $f8			; multiply by 8
	ld c, a
	ld b, 0
	add hl, bc		
	ex de, hl		; HL points to the screen position, DE to the first row of the number
	ld b, 8
.printnum_loop
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	djnz printnum_loop
ret
;#END_ASM

PUBLIC _PrintNumber_4000
_PrintNumber_4000:
;#BEGIN_ASM
	;; Print normal char on screen (1x1), from a base number 0..9
	;; Use $4000 as the base screen address
	;; INPUT:
	;;		B: position in X (pixels)
	;;		C: position in Y (pixels)
	;;		A: number to print
	push af
	call _CalcScreenPos_Char	; Screen position in HL
	ld a, h
	sub $80
	ld h, a
	ex de, hl
	;ld hl, _number_font;;ATTENTION
	pop af
	rlca
	rlca
	rlca
	and $f8			; multiply by 8
	ld c, a
	ld b, 0
	add hl, bc		
	ex de, hl		; HL points to the screen position, DE to the first row of the number
	ld b, 8
.printnum_4000_loop
	ld a, (de)
	inc de
	ld (hl), a
	inc h
	djnz printnum_4000_loop
ret
;#END_ASM

PUBLIC _CleanSCRC000
_CleanSCRC000:
;#BEGIN_ASM
	ld hl, $C000
	ld de, $C001
	ld (hl),0
	ld bc, 4095
	ldir
	ld hl, $d800
	ld de, $d801
	;ld a, (_level_color);;ATTENTION
	ld (hl), a
	ld bc, 511
	ldir
ret
;#END_ASM

PUBLIC _CalcScreenPos
_CalcScreenPos:
;#BEGIN_ASM
	;; Input:
	;;	B: X position
	;;	C: Y position
	;; Output:
	;;        HL: screen address
	;;        B:  bit position
	ld a, c
	and $07			
	;; 7  <-the 3 lowest bits are the line within a char
	ld h,a			; 4
	ld a,c			
	;; 4  <- the top 2 bits are the screen third
	rra			; 4
	rra			; 4
	rra			; 4
	and $18			; 7
	or h			; 4
	or $C0
	;; 4	<- If the start address is 16384, this should be $40
	ld h,a
	;; 4 (total 50 t-states) H has the high byte of the address

	ld a, b			;4
	rra			;4
	rra			;4
	rra			;4
	and $1f
	;;7  <- the top 5 bits are the char pos. 
	;; The low 3 bits are the pixel pos
	ld l,a			;4
	ld a,c      		;4
	rla			;4
	rla			;4
	and $e0			;7
	or l			;4
	ld l,a
	;;4 (total 54 t-states) L has the low byte of the address
	;; HL has the address in RAM of the char

     ld a, b
     and $07
	 ;; the lowest three bits are the bit position
     inc a

     ld b,a
	 ;; b has the number of bits to shift 1
     ld a,$80
     dec b
     jr z, postloop
	 
shiftloop:
     rrca
     dec b
     jr nz, shiftloop
	 
postloop:
     ld b, a
ret
;#END_ASM

PUBLIC _CalcScreenPos_Char
_CalcScreenPos_Char:
;#BEGIN_ASM
	;; Input:
	;;	B: X position
	;;	C: Y position
	;; Output:
	;;        HL: screen address
	ld a,c
	;; 4  <- the top 2 bits are the screen third
	rra			; 4
	rra			; 4
	rra			; 4
	and $18			; 7
	or $C0
	;; 4	<- If the start address is 16384, this should be $40
	ld h,a
	;; 4 (total 31 t-states) H has the high byte of the address

	ld a, b			;4
	rra			;4
	rra			;4
	rra			;4
	and $1f			;7  <- the top 5 bits are the char pos. The low 3 bits are the pixel pos
	ld l,a			;4
	ld a,c      		;4
	rla			;4
	rla			;4
	and $e0			;7
	or l			;4
	ld l,a
	;;4 (total 54 t-states) L has the low byte of the address
	;; HL has the address in RAM of the char
ret
;#END_ASM

PUBLIC _clean_screen_asm
_clean_screen_asm:
;#BEGIN_ASM
	di

	ld b, 5
	call _setrambank		; la ponemos en $c000 - $ffff	
	call _CleanSCRC000


	ld b, 7
	call _setrambank		; la ponemos en $c000 - $ffff	
	call _CleanSCRC000	

	ld b, 0
	call _setrambank		; vuelta a la normalidad
	ei
ret
;#END_ASM



;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM


SECTION code_crt_common   ; keep it early in the binary


PUBLIC _setrambank
_setrambank:
;#BEGIN_ASM
;; I am very lazy, and I copy + modify original Metalbrain routines :)

;; B: new RAM page to put in $ C000 - $ FFFF
;; We assume interrupts disabled

	ld a, (23388)		;; System variable with the previous value
		and $f8
		;; keep high bits
		or b
		;; we put page B above
		ld bc, $7ffd
		;; Port to write to
		ld	(23388),a
		;;Update system variable
     		out	(c),a
		;;Direccionar
		ret		
;#END_ASM


PUBLIC _switchscreen
_switchscreen:
;#BEGIN_ASM	

	;; Change the visible screen, without doing anything else
	ld	a,(23388)
	;;System variable with the previous value

	xor	8
	;;Change screen
	ld	bc,32765
	;;Port to write to
	;;	di			
	;;No Interruptions
	ld	(23388),a
	;;Update system variable
	out	(c),a
	;;Address
	;;	ei
	;;Enable interrupts
	ret
;#END_ASM

PUBLIC _depack
_depack:
;#BEGIN_ASM
	ld ixl,128
apbranch1:
	ldi
aploop0:
	ld ixh,1		;LWM = 0
aploop:
	call ap_getbit
	jr nc,apbranch1
	call ap_getbit
	jr nc,apbranch2
	ld b,0
	call ap_getbit
	jr nc,apbranch3
	ld c,16		;get an offset
apget4bits:
	call ap_getbit
	rl c
	jr nc,apget4bits
	jr nz,apbranch4
	ld a,b
apwritebyte:
	ld (de),a		;write a 0
	inc de
	jr aploop0
apbranch4:
	and a
	ex de,hl 		;write a previous byte (1-15 away from dest)
	sbc hl,bc
	ld a,(hl)
	add hl,bc
	ex de,hl
	jr apwritebyte
apbranch3:
	ld c,(hl)		
	;;use 7 bit offset, length = 2 or 3
	inc hl
	rr c
	ret z		
	;;if a zero is encountered here, it is EOF
	ld a,2
	adc a,b
	push hl
	ld iyh,b
	ld iyl,c
	ld h,d
	ld l,e
	sbc hl,bc
	ld c,a
	jr ap_finishup2
apbranch2:
	call ap_getgamma	
	;;use a gamma code * 256 for offset, another gamma code for length
	dec c
	ld a,c
	sub ixh
	jr z,ap_r0_gamma		
	;;if gamma code is 2, use old r0 offset,
	dec a
	;;do I even need this code?  ;;bc=bc*256+(hl), lazy 16bit way
	
	ld b,a
	ld c,(hl)
	inc hl
	ld iyh,b
	ld iyl,c

	push bc
		
	call ap_getgamma

	ex (sp),hl		;bc = len, hl=offs
	push de
	ex de,hl

	ld a,4
	cp d
	jr nc,apskip2
	inc bc
	or a
apskip2:
	ld hl,127
	sbc hl,de
	jr c,apskip3
	inc bc
	inc bc
apskip3:
	pop hl		;;bc = len, de = offs, hl=junk
	push hl
	or a
ap_finishup:
	sbc hl,de
	pop de		;;hl=dest-offs, bc=len, de = dest
ap_finishup2:
	ldir
	pop hl
	ld ixh,b
	jr aploop

ap_r0_gamma:
	call ap_getgamma		
	;;and a new gamma code for length
	push hl
	push de
	ex de,hl

	ld d,iyh
	ld e,iyl
	jr ap_finishup


ap_getbit:
	ld a,ixl
	add a,a
	ld ixl,a
	ret nz
	ld a,(hl)
	inc hl
	rla
	ld ixl,a
ret

ap_getgamma:
	ld bc,1
ap_getgammaloop:
	call ap_getbit
	rl c
	rl b
	call ap_getbit
	jr c,ap_getgammaloop
ret
;#END_ASM



;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM

;#BEGIN_ASM
;#END_ASM










