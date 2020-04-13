;;levelUtils.asm
;; these are short routines that are pulled from levelutils.h

extern _level_pointer
extern _CurLevel_NTiles
extern _depack
extern _CreaTablaTiles

PUBLIC _load_levelpart1
;#BEGIN_ASM
_load_levelpart1:
	di
	push bc
	ld b, 4
	call _BankRam;; Levels in RAM4 levelutils
;; call _borderTest
	pop bc
ret
;#END_ASM

PUBLIC _load_levelpart2
;#BEGIN_ASM
_load_levelpart2:
EXTERN _MAP_START
	;; ld de, $a000
	;; have a feeling the problem is here hard coded addy
	;; MAP_START = A000 	defc MAP_START	= $A000
	;; in engine.asm
	
push de
push hl

	ld de, _MAP_START
	;;_MAP_START is actually a big buffer that map uncompresses to
	
	ld hl, (_level_pointer)	
	call _depack

	;; ld de, $a000;;hard coded addy
	ld de, _MAP_START
	ld a, (_CurLevel_NTiles)
	ld b,a
	
	
pop hl
pop de


	call _CreaTablaTiles;; in RAMMAIN

ret
;#END_ASM

PUBLIC _load_levelpart3
;#BEGIN_ASM
_load_levelpart3:
EXTERN _MAP_START

push de
push hl

	ld de, _MAP_START;// ld de, $a000
	ld hl, (_level_pointer)
	call _depack
	
pop hl
pop de
ret
;#END_ASM

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

	ld de, _enemy_locations	
	ld hl, (_level_pointer)
	ld bc, (_dummy_i)
	ldir
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