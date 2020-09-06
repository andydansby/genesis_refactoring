;;bank 1 above 49152
SECTION BANK_01
;;org 0xc000;;believe this is assumed with target ZX

;PUBLIC _background
;_background:
;	BINARY "background.bin"
	








;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located
;PUBLIC _endmarkerRam1
;_endmarkerRam1:
;	nop