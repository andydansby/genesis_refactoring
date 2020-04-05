;;bank 3 above 49152
SECTION BANK_00
;;org 0xc000;;believe this is assumed with target ZX

;;INCLUDE	"ProPlay37a.asm"
INCLUDE "wyzplayer.asm"
INCLUDE "genesis_sfx.asm"
INCLUDE "apack.asm"











;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located
PUBLIC _endmarkerRam0
_endmarkerRam0:
	nop