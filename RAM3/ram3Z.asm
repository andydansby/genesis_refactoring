;;bank 3 above 49152
SECTION BANK_03
;;org 0xc000;;believe this is assumed with target ZX

PUBLIC _junkmarker
_junkmarker:
nop
nop
ret


PUBLIC _background
_background:

	BINARY "background.bin"


PUBLIC _junkmarker2
_junkmarker2:
nop
nop
nop
ret









;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located


	
	