;;LoadLevel.asm

;;allows us to import variables from C
EXTERN _level_pointer
EXTERN _CurLevel_NTiles


PUBLIC _loadLevelRamBank
	_loadLevelRamBank:
;#BEGIN_ASM
	di
	push bc
	ld b, 4
	call _setrambank		; Levels in RAM4
	pop bc
ret
;#END_ASM

PUBLIC _loadPrepTiles
	_loadPrepTiles:
;#BEGIN_ASM
	;; Prepare tiles, preshift them, store them in their final location
	;; We will use the map area as decompression buffer
	ld de, $a000
	ld hl, (_level_pointer)
	call _depack
	ld de, $a000
	ld a, (_CurLevel_NTiles)
	ld b,a
	call _CreaTablaTiles
ret
;#END_ASM




