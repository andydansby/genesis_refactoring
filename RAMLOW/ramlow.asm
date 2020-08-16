;;contended memory from 24200-32767
;;8167 bytes total

;;The ULA bug which causes snow when I is set to point to contended memory still occurs, and also appears to crash the machine shortly after I is set to point to contended memory.

;;THIS MEANS ISR CANNOT BE IN CONTENDED MEMORY!!!

;;ATTENTION
;;Breakpoint in code is $611B
;;org 0x6018;;24600-32767 program start and below uncontended
;;ATTENTION

;//SECTION CONTENDED
;;SECTION code_user
SECTION code_user

;;org 0x6018
;;24600

;;in RAMMAIN
EXTERN _setrambank1
EXTERN _IM2table
EXTERN _isrdummy
EXTERN _ISR_space

;--------------------------

;--------------------------
;;in RAM 0
EXTERN _INICIO




;;----------------------------------
;; Variables
;; define C variables here to force placement in memory

;;SECTION bss_name

PUBLIC _xyzzy
;#BEGIN_ASM
_xyzzy: defs 1

;;PUBLIC _level_address
;;_level_address: defw 0xC000

;#END_ASM
;;----------------------------------







;----------------------------------
;; This takes what is in the main display (16384) and copies it to RAM 7 display (must bank first) at 49152
PUBLIC _copytoAltScreen
;#BEGIN_ASM
_copytoAltScreen:
	ld hl, 16384
	ld de, $c000
	ld bc, 6912
	ldir			; copy the background to the alternate screen
ret
;#END_ASM

;----------------------------------
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


;----------------------------------
PUBLIC _ScreenSwitchFlipFlagNO
;#BEGIN_ASM
_ScreenSwitchFlipFlagNO:
	;; clear the highest bit of the R register. It will be used to flag for a screen switch
	ld a,r
	and $7f	
	ld r,a
	;; set the highest bit of R to 0, so do not switch screen!!!!
ret
;#END_ASM
;----------------------------------
PUBLIC _ScreenSwitchFlipFlagYES
;#BEGIN_ASM
_ScreenSwitchFlipFlagYES:
	ld a,r
	or $80
	ld r,a
	;; set the highest bit of R to 1, so switch screen!!!!
ret
;#END_ASM
;----------------------------------

;;starts at #6085
PUBLIC _noscreenswitch
;#BEGIN_ASM
_noscreenswitch:
	ld a, (0x5b5c);;23388
	and $07				; keep low bits
	ld (_isrdummy), a	; save current state
	
	ld b, 0;;<<ATTENTION	
	call _BankRam	
;; go to ram bank 0 for the music ISR

	call _INICIO
	
	ld a, (_isrdummy)
	
	ld b, a ;;<<ATTENTION
	call _BankRam	; go back to normal state
ret
;#END_ASM

;----------------------------------

;;starts at #606D
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

;;starts at #60AB
PUBLIC _BankRam
;#BEGIN_ASM
_BankRam:
	;; B: new RAM page to put in $C000 - $FFFF
	;; We assume interrupts disabled
	ld a, ($5b5c)		
	;; System variable with the previous value 23388
	and %11111000‬;;and $f8=248 keep high bits
	or b			;; we put page B above
	ld bc, $7ffd	;; Port to write to
	ld	($5b5c),a	;;Update system variable
	out	(c),a		;;Address
ret
;#END_ASM

;----------------------------------
;;https://spectrumcomputing.co.uk/forums/viewtopic.php?f=6&t=197&start=10&sid=1e6d644dbcd9c3e0af7c253b52c3adbc
;;starts at #60BA
PUBLIC _bank
;#BEGIN_ASM
_bank:
	ld a,(0x5b5c)   
	;//System variable with the previous value
	and 0xf8
	or L
	ld bc,0x7ffd	;//Port to write
;	di
	ld (0x5b5c),a	;//Update system variable
	out (c),a		;//Address
;	ei				;//enable interupts
	
	;ATTENTION
	;;enabling interupts could cause issues down the road, but needed now for testing
ret
;#END_ASM

;----------------------------------
PUBLIC _BankWTF
;#BEGIN_ASM
_BankWTF:
	;; B: new RAM page to put in $C000 - $FFFF
	;; We assume interrupts disabled
	ld a, ($5b5c)		
	;; System variable with the previous value 23388
	and %11110000‬;;and $f8=248 keep high bits
	or 0			;; we put page B above
	ld bc, $7ffd	;; Port to write to
	ld	($5b5c),a	;;Update system variable
	out	(c),a		;;Address
ret
;#END_ASM
;-------------------------------




;;starts at #60C9-60E8
PUBLIC _borderTest
;#BEGIN_ASM
_borderTest:
ld hl, 0
call borderChange
ld hl, 4
call borderChange
jp _borderTest

borderChange:
ld a, l
and 7
ld l, a
ld a, (value)
and 248
or l
ld (value), a
out (254), a
ret

value:
defb 7
;#END_ASM

;----------------------------------

; #60E9
PUBLIC _borderTestEndless
;#BEGIN_ASM
_borderTestEndless:
	call _borderTest
	jp _borderTestEndless
;#END_ASM

;----------------------------------

INCLUDE "levelutils.asm"
INCLUDE "depack.asm"

INCLUDE "graphicutils.asm"

;;60E9 to 7FFF is empty, why
;;should be filled with levelutils.asm and depack.asm


;;SECTION code_crt_common
;;this SECTION is near the start of the binary



;;2305 in zx assembler

;;this PUBLIC needs to be absolutely last as it's just a marker
;;used to find where in memory the last byte is located


;;SECTION code_crt_common
;;this SECTION is near the start of the binary


;SECTION LOW_CODE_END
;;this section places the code at the end of compiled SECTION.


;;just to identify memory area
;;#61ae
PUBLIC _RAM_marker_LOW
_RAM_marker_LOW:
	halt



