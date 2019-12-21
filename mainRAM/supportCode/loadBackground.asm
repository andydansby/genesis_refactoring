
;;loadBackround.asm

;;allows us to import variables from C
EXTERN _current_level
EXTERN _hiscore
EXTERN _life_counter
EXTERN _available_superbombs
EXTERN _score

PUBLIC _load_background
_load_background:
;#BEGIN_ASM

	di

		
	ld b, 3		; Static images in RAM3
	call _setrambank	; we put it in $c000 - $ffff	
	ld hl, $c000
	ld de, 16384
	call _depack

	ld b, 7
	call _setrambank	; we put it in $c000 - $ffff
	ld hl, 16384
	ld de, $c000
	ld bc, 6912
	ldir				
	;; copy the background to the alternate screen

	;; Print number of remaining lives, current score, high score and current level
		
	ld b, 72
	ld c, 136
	ld a, (_life_counter)
	call _PrintLarge_2

	ld b, 72
	ld c, 152
	ld a, (_available_superbombs)
	call _PrintLarge_2

		
	ld b, 120
	ld c, 144
	ld hl, (_score)
	call _PrintLarge_5
		
	ld b, 184
	ld c, 152
	ld hl, (_hiscore)
	call _PrintSmall_5

	ld b, 80
	ld c, 176
	ld a, (_current_level)
	inc a
	call _PrintNumber

	; Same on the other screen!

	ld b, 5
	call _setrambank		; la ponemos en $c000 - $ffff
	ld b, 72
	ld c, 136
	ld a, (_life_counter)
	call _PrintLarge_2

	ld b, 72
	ld c, 152
	ld a, (_available_superbombs)
	call _PrintLarge_2

	ld b, 120
	ld c, 144
	ld hl, (_score)
	call _PrintSmall_5

	ld b, 184
	ld c, 152
	ld hl, (_hiscore)
	call _PrintSmall_5

	ld b, 80
	ld c, 176
	ld a, (_current_level);;working on
	inc a
	call _PrintNumber;main.h

	ld b, 0
	call _setrambank		; back to reality
	ei
	
ret
;#END_ASM

