;;rambank.asm

; copied + modify original routines of Metalbrain :)

SECTION code_crt_common



PUBLIC _setrambank
;#BEGIN_ASM
_setrambank:
	;; B: new RAM page to put in $C000 - $FFFF
	;; We assume interrupts disabled
	ld a, ($5b5c)		
	;; System variable with the previous value 23388
	and $f8			;; keep high bits and 248
	or b			;; we put page B above
	ld bc, $7ffd	;; Port to write to
	ld	($5b5c),a	;;Update system variable
	out	(c),a		;;Address
ret
;#END_ASM

;-----------------------------------
;;try to convert back to setrambank
;;setrambank
PUBLIC _setrambank0
;#BEGIN_ASM
_setrambank0:
	;; B: new RAM page to put in $C000 - $FFFF
	;; We assume interrupts disabled
	ld a, ($5b5c)		
	;; System variable with the previous value 23388
	and $f8			;; keep high bits and 248
	or b			;; we put page B above
	ld bc, $7ffd	;; Port to write to
	ld	($5b5c),a	;;Update system variable
	out	(c),a		;;Address
ret
;#END_ASM
;-----------------------------------

;;starts at #618E-619B
PUBLIC _switchscreen
;#BEGIN_ASM
_switchscreen:
	; Change the visible screen, without doing anything else
	ld	a,(0x5b5c)	;System variable with the previous value
	xor	8			;Change screen
	ld	bc,0x7ffd	;Port to write to
	;	di			;disable interupts
	ld	(0x5b5c),a	;Update system variable
	out	(c),a		;Address
	;	ei			;Enable interupts
ret
;#END_ASM
;-----------------------------------

PUBLIC _setnormalRAMstate
;#BEGIN_ASM
_setnormalRAMstate:
	; Change the visible screen to the default (in 16384), and RAM 0 in $ C000
	ld a, (23388)		; System variable with the previous value
	and $f0			; keep high bits, page 0, normal screen
	ld bc, $7ffd		; Port to write to
	di
	ld	(23388),a	;Update system variable
	out	(c),a		;Address
	ei
ret
;#END_ASM




;-----------------------------------
;; This takes what is in the main display (16384) and copies it to RAM 7 display (must bank first) at 49152
PUBLIC _copytoAltScreen
_copytoAltScreen:
	ld hl, 16384
	ld de, $c000
	ld bc, 6912
	ldir			; copy the background to the alternate screen
ret



;-----------------------------------

