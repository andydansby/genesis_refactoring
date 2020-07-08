;;levelUtils.asm
;; these are short routines that are pulled from levelutils.h

extern _level_pointer
extern _CurLevel_NTiles
extern _depack
extern _CreaTablaTiles
extern _MAP_START;;in uncontended RAM where map unpack to


;;just switches to bank 4	$65F5
PUBLIC _load_levelpart1
;#BEGIN_ASM
_load_levelpart1:
	di
	push bc
	ld b, 4
	call _BankRam;; Levels in RAM4 levelutils
;; call _borderTest
	pop bc
	
;;ATTENTION you should be able to look at bank 4 were maps are stored at $C000
ret
;#END_ASM




;;$65F1
PUBLIC _load_levelpart2
;#BEGIN_ASM
_load_levelpart2:

;;ATTENTION $8000 - $9000 
;should be blank on entry

	ld de, _MAP_START
	;;_MAP_START is actually a big buffer that map uncompresses to
	
	ld hl, (_level_pointer)
	;;look into this
	;;HL = C005
	
	

;; aPPack decompressor
;;de = dest
;;hl = source
	call _depack
	
	ld de, _MAP_START
	ld a, (_CurLevel_NTiles)
	ld b,a

	call _CreaTablaTiles;; in RAMMAIN

;;MAP should now be decompressed at $8000

ret
;#END_ASM


;;;;something here is fucking up my world
;;$6621
;;believe either 
;;level_pointer is WRONG OR
;; _enemy_locations is CRAP
;;FUCKING IRRITATING
PUBLIC _load_levelpart3
;#BEGIN_ASM
_load_levelpart3:
push de
push hl
;; aPPack decompressor
;;de = dest
;;hl = source
	ld de, _MAP_START ;; ld de, $a000	
	ld hl, (_level_pointer)	
	call _depack	
pop hl
pop de


ret
;#END_ASM

;;;;something here is fucking up my world
;;$6624
;;believe either 
;;level_pointer is WRONG OR
;; _enemy_locations is CRAP
;;FUCKING IRRITATING
PUBLIC _load_levelpart4
;#BEGIN_ASM
_load_levelpart4:
EXTERN _enemy_locations
EXTERN _dummy_i
EXTERN _BankRam

;;ATTENTION
;; not entirely sure if needed but here anyway
push de
push hl
push bc

;;believe either 
;;level_pointer is wrong OR
;; _enemy_locations is wrong OR
;; _dummy_i is wrong  OR
;;I am a complete MORON  THIS is actually what the problem may be
;;perhaps not the fault of _dummy_i directly, _level_pointer and struct Enemy assign values to _dummy_i

;;in GOLD STANDARD
;;C:\z88dk199c\GAME\1GOLD_STANDARD\rambanks\ram4
;; look at ram4.asm
;; we include BINARY level1.map
;;but we also include level1_enemies.asm
;; NEED to include this
;;format found in
;; C:\z88dk199c\GAME\1GOLD_STANDARD\rambanks\ram4\gamelevels

;;FUCKING IRRITATING
	ld hl, (_level_pointer)
	ld de, _enemy_locations	
	ld bc, (_dummy_i)
	
	;;for level 0
	;;_level_pointer = 5f
	;;_enemy_locations = 68c6
	;;_dummy_i = 80
	

	ldir;;6624
	;;ldir
	;;HL = source address
	;;DE = target address
	;;BC = countdown number
	;;increments HL and DE
	;;and
	;;deincrements BC until BC = 0
	

;;#673F
	ld b, 0
	call _BankRam
	ei

;;ATTENTION
;; not entirely sure if needed but here anyway
pop bc
pop hl
pop de	
	
ret
;#END_ASM



PUBLIC _unpackMap
;#BEGIN_ASM
_unpackMap:

;;ATTENTION
;; not entirely sure if needed but here anyway
push de
push hl
push bc

	;;	ld de, $a000
	;;have a feeling the problem is here hard coded addy
	;;defc 		MAP_START	= $A000 in engine.asm
	;;85D0=34256 A000=40960
	ld de, _MAP_START
	;;_MAP_START = 40812
	
	ld hl, (_level_pointer)	;_level_pointer = 35338 = 06 c0
	
	
	call _depack  ;;call _depack = call 35007

	;;ld de, $a000;;hard coded addy
	ld de, _MAP_START

	ld a, (_CurLevel_NTiles)
	ld b,a

	call _CreaTablaTiles
	
	;;ATTENTION
	;; not entirely sure if needed but here anyway
	pop bc
	pop hl
	pop de
ret
;#END_ASM



PUBLIC _unpackLevelPointer
;#BEGIN_ASM
;;must be in UNCONTENDED
_unpackLevelPointer:
;;	ld de, $a000
;;	ld hl, (_level_pointer)
;;	call depack
ret
;#END_ASM


PUBLIC _setAddress
_setAddress:
;#BEGIN_ASM
;;must be in UNCONTENDED
_unpackPointer:
;;	ld de, _enemy_locations
;;	ld hl, (_level_pointer)
;;	ld bc, (_dummy_i)
;;	ldir
ret
;#END_ASM