;;uncontended memory from 32768 to 49151
SECTION UNCONTENDED
;org 0x8000;;32768 to 49151 below BANK switch and above contended

;;INCLUDEs are at the bottom

;SECTION code_user
; code_user is for read-only code

;SECTION bss_user
; bss_user is for zeroed ram variables

;SECTION data_user
; data_user is for initially non-zero ram variables

;SECTION smc_user
; smc_user is for self-modifying code

;SECTION rodata_user
; rodata_user is for constant data

;;place our tables and variables at the top

;;-------------------------------

;; PLACE VARIABLES HERE
;SECTION bss_user
; bss_user is for zeroed ram variables

PUBLIC _IM2table
_IM2table:
	defs 257	;;0x101
	; 257 byte table for the Interupt Manager

;; Definitions for sprite cache addresses
;;used in drawsprite.asm
;; sprite cache table, 1K	
;;SprCacheTable 	EQU $8C00
PUBLIC SprCacheTable
SprCacheTable:
	defs 1024 ;;0x400

;; cache list next pointers
;;used in drawsprite.asm
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_next	EQU $8B00
PUBLIC LRU_next
LRU_next:
	defs 43	;;0x2b
	
;; cache list prev pointers, 
;; 43 bytes used 
;; (some bytes wasted!)
;;LRU_prev	EQU $8A00
PUBLIC LRU_prev
LRU_prev:
	defs 43 ;;0x2b

;; Exit:
;; - TablaTiles (aligned in 4K): Shifted Tiles,
;; according to the following criteria:
;;defc		TablaTiles	= $B000		;45056
PUBLIC TablaTiles
TablaTiles:
defs 4096;;0x1000
;;-------------------------------

SECTION data_user

PUBLIC _isrdummy
_isrdummy:
	defb 1

PUBLIC LRU_first
LRU_first:
	defb 0

;; pointers to the first and last entry in the cache
PUBLIC LRU_last
LRU_last:
	defb 41	;;0x29


;; LRU_LASTENTRY   EQU 42
PUBLIC LRU_LASTENTRY
	defc LRU_LASTENTRY = 42	;;0x2a

PUBLIC SCRADD
SCRADD:
	defw 0
	

PUBLIC LINECOUNT
LINECOUNT:
	defb 0
	
PUBLIC SAVE_RAMBANK
SAVE_RAMBANK:
	defb 0

;; SPRITES_BANK	EQU 1
PUBLIC SPRITES_BANK
SPRITES_BANK:
	defb 1


PUBLIC Multiply_by_96
Multiply_by_96:
	defw 0,96,192,288,384,480,576,672,768,864,960,1056,1152,1248,1344,1440,1536,1632,1728,1824,1920,2016,2112,2208,2304,2400,2496,2592,2688,2784,2880,2976,3072,3168,3264,3360,3456,3552,3648,3744,3840,3936








;;;------------------------------
INCLUDE "drawmap.asm"
INCLUDE "drawsprite.asm"
INCLUDE "input.asm"
INCLUDE "engine.asm"
INCLUDE "rambanks.asm"
INCLUDE "displayloop.asm"
INCLUDE "clearMapArea.asm"
INCLUDE "drawGameMap.asm"
INCLUDE "levelutils.asm"
INCLUDE "create_shifted_tables.asm"


;; PLACE CODE HERE

SECTION CODE_END
;;this section places the code close to the end, but not the very end.
;;47 bytes from the end in this iteration
PUBLIC _RAM_marker_MAIN
_RAM_marker_MAIN:
	halt
	halt
	halt
	halt
	nop
	halt
ret
