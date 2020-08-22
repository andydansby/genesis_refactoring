;;uncontended memory from 32768 to 49151
;;look in mmap.inc in /ramlow


SECTION UNCONTENDED_MAPSTART

;;original found in test.c C_Code_1-4-2020
PUBLIC _MAP_START
_MAP_START:
defs 0x1000
;;0x1000 = 4096
;;reserve 4096 bytes set to 0
;;was originally in $A000
;;which means it should be in main RAM
;;-------------------------------


;; On the Spectrum 128, interrupt vectors may only
;; be placed between $80ff and $beff inclusive.  
;; An interrupt routing itself must exist wholly
;; between 4000 and $BFFF.
;; This is because address $c000 to $ffff are pageabe
;; and should an interrupt occur while the
;; wrong 16k RAM is paged in, you will get a crash.



SECTION UNCONTENDED
;;--------------------------------

;; ATTENTION, for some reason
;;ZCC Does not like having this
;; as rodata_user.  Making it a constant
defc _SPRITES_BANK = 1



SECTION UNCONTENDED
;;--------------------------------
;; PLACE INCLUDEs HERE
INCLUDE "drawmap.asm"
;;INCLUDE "clearMapArea.asm"
;;INCLUDE "rambank.asm"
;;INCLUDE "gameISR.asm"
INCLUDE "create_shifted_tables.asm"
INCLUDE "drawsprite.asm"
INCLUDE "input.asm"


;; PLACE CODE HERE

SECTION CODE_END
;#BEGIN_ASM
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
;#END_ASM


