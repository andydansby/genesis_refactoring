;;uncontended memory from 32768 to 49151
;;look in mmap.inc in /ramlow

SECTION UNCONTENDED


;SECTION data_user
;;INCLUDEs are at the bottom

;SECTION code_user
; code_user is for read-only code

;SECTION bss_user
; bss_user is for zeroed ram variables

;SECTION data_user
; data_user is for initially non-zero ram variables

;SECTION smc_user
; smc_user is for self-modifying code

;SECTION rodata_user
; rodata_user is for constant data

;;place our tables and variables at the top

;;--------------------------------

;; PLACE VARIABLES HERE
;SECTION bss_user
; bss_user is for zeroed ram variables

;;PUBLIC _IM2table
;;_IM2table:
;;	defs 257	;;0x101
	;; 257 byte table for the Interupt Manager


;;original found in test.c C_Code_1-4-2020
PUBLIC _MAP_START
_MAP_START:
defs 0x1000
;;0x1000 = 4096
;;reserve 4096 bytes set to 0
;;was originally in $A000
;;which means it should be in main RAM
;;-------------------------------









;PUBLIC _isrdummy
;_isrdummy:
;	defb 1

;;-------------------------------



;;-------------------------------


	


	













;SECTION rodata_user
;; SPRITES_BANK	EQU 1
;PUBLIC _SPRITES_BANK
;_SPRITES_BANK:
;	defb 1

;; ATTENTION, for some reason
;;ZCC Does not like having this
;; as rodata_user.  Making it a constant
defc _SPRITES_BANK = 1




SECTION UNCONTENDED
;;--------------------------------
;; PLACE INCLUDEs HERE
INCLUDE "drawmap.asm"
INCLUDE "clearMapArea.asm"
;;INCLUDE "rambank.asm"
;;INCLUDE "gameISR.asm"
INCLUDE "create_shifted_tables.asm"
INCLUDE "drawsprite.asm"
INCLUDE "input.asm"
INCLUDE "im2.asm"




;; PLACE CODE HERE

SECTION CODE_END
;;this section places the code close to the end, but not the very end.
;;47 bytes from the end in this iteration
PUBLIC _RAM_marker_MAIN
_RAM_marker_MAIN:
	halt
	halt
	halt
	halt
	nop
	halt
ret
