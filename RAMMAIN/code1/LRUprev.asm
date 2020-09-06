SECTION LRU_prev_Section	;;0x8a00

;; cache list prev pointers, 
;; 43 bytes used 
;; (some bytes wasted!)

PUBLIC LRU_prev
;#BEGIN_ASM
LRU_prev:
	;defs 43	;;0x2b	from C version
	defs 86		;;from release version
;#END_ASM





;SECTION UNCONTENDED
;; cache list prev pointers, 
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_prev	EQU $8A00
;PUBLIC LRU_prev
;#BEGIN_ASM
;LRU_prev:
;	defb 43 ;;0x2b
;#END_ASM