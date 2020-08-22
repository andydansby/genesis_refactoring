

SECTION IM2_TABLE;0x9e00	try to move to $8000

PUBLIC _IM2_Vector
;#BEGIN_ASM
_IM2_Vector:
	defs $0101, $8a

;#END_ASM


;; On the Spectrum 128, interrupt vectors may only be placed between $80ff and $beff inclusive.  An interrupt routing itself must exist wholly between 4000 and $BFFF.  This is because address $c000 to $ffff are pageabe and should an interrupt occur while the wrong 16k RAM is paged in, you will invatiably get a crash.  The ROM area is also constantly paging between the two ROMs so you can't use this as a vector either.  The (new) ROM constantly uses RAM page 7 - the normal page selected by BASIC is RAM page 0.  If an interrupt vector or routine is paged in, the results will be catastrophc.  Be warned.

;;257 bytes filled with 00
