;;ClearMapArea.asm

SECTION UNCONTENDED

	
PUBLIC _ClearMapArea
;#BEGIN_ASM
_ClearMapArea:

;; This little function will clear the map area on screen, via a series of PUSH
;; We will assume ints are disabled!!!!!
;; Save DE before calling!!!!!

	ld (cma_restoresp+1),sp
	ld sp, $c000+4096	
	;; at the end of the screen area (second third)
	
	ld de, 0		; we clean with whites	ld de, 0
	ld a, b	
	ld b, 64		; we will make series of 32 push (16 pixels per push), 64x2 lines
	
cma_loop:
	push de	
	push de	
	push de
	push de	
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	
	push de	
	push de	
	push de
	push de	
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de

	djnz cma_loop
	
	
	cma_restoresp:
	ld sp,0	;;ld sp,0
	ld b, a
ret


;#END_ASM




