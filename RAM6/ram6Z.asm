;org 49152
;;bank 3 above 49152
SECTION BANK_06
;;org 0xc000;;believe this is assumed with target ZX

PUBLIC _genesis_title
_genesis_title:
	BINARY "genesis_title.bin"

PUBLIC _title_hiscores
_title_hiscores:
	BINARY "title_hiscores.bin"

PUBLIC _credits_bkg
_credits_bkg:
	BINARY "credits_bkg.bin"

include "menu.asm"
include "move.asm"	;;think this meant for another bank??
include "behav.asm" ;;think this meant for another bank??










;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located
PUBLIC _endmarkerRam6
_endmarkerRam6:
	nop