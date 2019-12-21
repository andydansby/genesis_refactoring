; This is the main file for the scrolling engine
; It will just set the assembler origin, and include the files

;;remove this org as we are dynamically assigning everything
;org 33025

include "drawmap.asm";;DONE
;include "rambanks.asm" ALREADY IN MAIN.ASM
include "drawsprite.asm";;DONE
include "input.asm";;DONE
include "create_shifted_tables.asm";;DONE
include "im2.asm"
include "starfield.asm"


;;These 3 variables are already assigned in create_shifted_tables.asm
;;moved to main.asm
;SPRITE_START EQU $9000
; we have 4k for sprites, $9000 - $9FFF
;MAP_START    EQU $A000
; 4k for the game map, $a000 - $afff
;defc TablaTiles = $B000
;TablaTiles   EQU $B000


