SECTION LRU_next_Section	;;0x8b00

;; cache list next pointers
;;used in drawsprite.asm
;; 43 bytes used 
;; (some bytes wasted!)

PUBLIC LRU_next
;#BEGIN_ASM
LRU_next:
	;defs 43	;;0x2b	from C version
	defs 86		;;from release version
;#END_ASM

PUBLIC MappingTable
;#BEGIN_ASM
MappingTable:
	defs 170		;;from release version
;#END_ASM

;SECTION UNCONTENDED
;; cache list next pointers
;;used in drawsprite.asm
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_next	EQU $8B00
;PUBLIC LRU_next
;#BEGIN_ASM
;LRU_next:
;	defb 43	;;0x2b
;#END_ASM
