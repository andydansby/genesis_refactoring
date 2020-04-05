;;levelUtils.asm
;; these are short routines that are pulled from levelutils.h

extern _level_pointer
extern _CurLevel_NTiles
extern _depack
extern _CreaTablaTiles
extern _MAP_START


;section code_user
;SECTION CONTENDED


PUBLIC _unpackMap
;#BEGIN_ASM
_unpackMap:

		;;	ld de, $a000
		;;have a feeling the problem is here hard coded addy
		;;defc 		MAP_START	= $A000 in engine.asm
		;;85D0=34256 A000=40960
	ld de, _MAP_START;_MAP_START = 40812
	
	ld hl, (_level_pointer)	;_level_pointer = 35338 = 06 c0
	
	
	call _depack  ;;call _depack = call 35007

	;;ld de, $a000;;hard coded addy
	ld de, _MAP_START

	ld a, (_CurLevel_NTiles)
	ld b,a

	call _CreaTablaTiles

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