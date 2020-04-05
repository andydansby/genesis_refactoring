;;ClearMapArea.asm
;;section code_user
SECTION UNCONTENDED

PUBLIC _ClearMapArea
;#BEGIN_ASM
;;probally could be in CONTENDED
_ClearMapArea:
	
;; This little function will clear the map area on screen, via a series of PUSH
;; We will assume ints are disabled!!!!!
;; Save DE before calling!!!!!




	ld (cma_restoresp+1),sp
	ld sp, $c000+4096	; at the end of the screen area (second third)
	ld de, 0		; we clean with whites
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
	ld sp,0
	ld b, a
ret
;#END_ASM



PUBLIC _ClearMapArea2
_ClearMapArea2:
;#BEGIN_ASM
	ld (cma2_restoresp+1),sp
	ld sp, $c000+4096	; at the end of the screen area (second third)
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop1:
	ld de, 0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop1	
	ld a, 8		;we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop2:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop2
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop3:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop3	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop4:
	ld de, $AAAA		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop4
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop5:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop5
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop6:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop6	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop7:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop7
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop8:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop8
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop11:
	ld de, 0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop11	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop12:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop12
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop13:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop13	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop14:
	ld de, $AAAA		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop14	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop15:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop15
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
cma2_loop16:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop16
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop17:
	ld de, $0		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop17	
	ld a, 8		; we will make series of 32 push (16 pixels per push), 16 * 8 lines
	
cma2_loop18:
	ld de, $0808		; we clean with a predefined pattern
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
	dec a
	jp nz, cma2_loop18

cma2_restoresp:
	ld sp,0
	ret	
;#END_ASM