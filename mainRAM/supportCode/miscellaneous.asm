
extern _frameskip_counter
extern _update_life
extern _update_score
extern _update_superb

extern _wyz_play
;;notice that this is in bank 0 above 49152


;;PUBLIC _someFunction
;;	_someFunction:
;#BEGIN_ASM
;#END_ASM

;;PUBLIC _someFunction
;;	_someFunction:
;#BEGIN_ASM
;#END_ASM

;;PUBLIC _someFunction
;;	_someFunction:
;#BEGIN_ASM
;#END_ASM

;;PUBLIC _someFunction
;;	_someFunction:
;#BEGIN_ASM
;#END_ASM

PUBLIC _waitvblank
	_waitvblank:
;#BEGIN_ASM
	;waitvblank:
	ld a,r
	jp m, _waitvblank	; while the screen has not been switched, we cannot continue
waitframeskip:
	ld a, (_frameskip_counter)
	cp 2
	jp c, waitframeskip	; we must wait until enough frames has passed
	xor a
	ld (_frameskip_counter), a

	;halt
	di

	call _DrawGameMap	; draw map, interrupts must be disabled

	ld a, (_current_level)
	cp 2
	jr z, noduplicatewyzplay

	ld b, 0
	call _setrambank		; we have missed one interrupt for sure, so call player
	
	;ATTENTION, cannot find _wyz_play or WYZ_PLAY
	call _wyz_play	;call WYZ_PLAY

	
	.noduplicatewyzplay
	ld a, (_current_screen)
	xor 2			; 5 xor 2 = 7; 7 xor 2 = 5
	ld b, a
	call _setrambank		; restore the previous paging state
	ei

	call _DrawEnemies	; draw enemies and enemy shoots (also valid for final enemies and their shoots)
	
	
	call _DrawShip		; draw ship, my shoots and power ups: at the same time, check ship collision
;        call _CheckShipCollision ; check HERE if the ship hits the background or an enemy
        call _CheckShootCollision
	call _MoveStarfield	; update starfield
	call _Display_starfield	; now display it

	call _ShowBombBar	; display progress bar for superbomb

	; Do we need to update the score?
	ld a, (_update_score)
	and a
	jr z, noupdatescore
	dec a
	ld (_update_score), a
	ld b, 120
	ld c, 144
	ld hl, (_score)
	call _PrintLarge_5
.noupdatescore
	; Do we need to update the number of superbombs?
	ld a, (_update_superb)
	and a
	jr z, noupdatesuperb
	dec a
	ld (_update_superb), a
	ld b, 72
	ld c, 152
	ld a, (_available_superbombs)
	call _PrintLarge_2
.noupdatesuperb
	; Do we need to update the number of lifes?
	ld a, (_update_life)
	and a
	jr z, noupdatelife
	dec a
	ld (_update_life), a
	ld b, 72
	ld c, 136
	ld a, (_life_counter)
	call _PrintLarge_2
.noupdatelife
	ld a,r
	or $80
	ld r,a			; set the highest bit of R to 1, so switch screen!!!!

	di
	ld b, 0
	call _setrambank		; leave the RAM bank 0 in place before continuing
	ei
	
	
	
;#END_ASM





