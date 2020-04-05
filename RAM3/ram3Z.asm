;;bank 3 above 49152
SECTION BANK_03
;;org 0xc000;;believe this is assumed with target ZX

PUBLIC _junkmarker
_junkmarker:
halt
halt
ret

PUBLIC _background
_background:
halt
	BINARY "background.bin"


PUBLIC _junkmarker2
_junkmarker2:
halt
halt
ret









;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located


	
	