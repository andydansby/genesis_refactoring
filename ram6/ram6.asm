;;bank 6 above 49152
SECTION BANK_06
org 0xc000;;believe this is assumed with target ZX

INCLUDE "maindefs.asm"
INCLUDE "menu.asm"
INCLUDE "move.asm"
INCLUDE "behav.asm"

PUBLIC _genesis_title
_genesis_title:
	BINARY "genesis_title.bin"

PUBLIC _title_hiscores
_title_hiscores:
	BINARY "title_hiscores.bin"

PUBLIC _credits_bkg
_credits_bkg:
	BINARY "credits_bkg.bin"


;;below are examples on how to include
;; we have 4k for sprites, $9000 - $9FFF
;;SPRITE_START EQU $9000
;;defc SPRITE_START = $9000

;;INCLUDE "drawsprite.asm";;rambanks.asm

;PUBLIC _blackout2
;/BEGIN_ASM
;_blackout2:
;   ld hl, 22528
;   ld (hl), 0
;   push hl
;   pop de
;   inc de
;   ld bc, 767
;   ldir
;   ret
;/END_ASM