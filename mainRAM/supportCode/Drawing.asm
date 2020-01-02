;; lets stuff drawing stuff in here

extern _current_screen
extern _CurLevel_XLength
extern _map_xpos
extern _map_displacement
extern _ship_x
extern _ship_y
extern _ship0spr
extern _power_up
extern _max_shoots
extern _my_active_shoots
extern _frames_fire_pressed

extern _active_enemies

extern _MAX_ENEMIES





;;PUBLIC _someFunction
;;	_someFunction:
;#BEGIN_ASM
;#END_ASM

PUBLIC _DrawGameMap
	_DrawGameMap:
;#BEGIN_ASM
	ld a, (_current_screen)	; cargamos la pantalla
	ld b, a
	call _setrambank		; la ponemos el $c000 - $ffff
	ld a, (_current_screen)
	xor 2			; 5 xor 2 = 7; 7 xor 2 = 5
	ld (_current_screen), a	; intercambiamos la pantalla en la que vamos a escribir

	ld a, (_CurLevel_XLength)
	ld h,0
	ld l,a
	ld d, $a0
	ld a, (_map_xpos)
	ld e, a				; the map will always start at $a000, so the displacement will always be in E
	ld a, (_map_displacement)
	and $03
	ld c, a				; displacement in pixels within tile
	ld a, (_map_displacement)
	and $0C
	rrca
	rrca
	ld b, a				; displacement in chars within tile
	call _DrawMap
;#END_ASM


PUBLIC _DrawShip
	_DrawShip:
;#BEGIN_ASM
	ld a, (_ship_x)
	ld b, a
	ld a, (_ship_y)
	ld c,a
	ld a, (_ship0spr)	
	ld d, 0
	ld e, a		; _ship01
	call _DrawSprite_Ship
	call _CheckShipCollision

	ld a, (_ship_x)
	add a,16
	ld b, a
	ld a, (_ship_y)
	ld c,a
	ld a, (_ship0spr)
	inc a
	ld d, 0
	ld e, a		;_ship02
	call _DrawSprite_Ship
	call _CheckShipCollision

	ld a, (_max_shoots)
	ld b, a
	ld hl, _my_active_shoots

.drawshoots_loop
	push bc
	inc hl
	inc hl
	ld a, (hl)
	and a
	jr z, loop_shoots

	ld d, 0
	ld e, (hl)
	dec hl
	ld c, (hl)
	dec hl
	ld b, (hl); bc = (x << 8) | y

	push hl
	call _DrawSprite	
	pop hl
	inc hl
	inc hl
.loop_shoots
	ld bc, 10		; 12 = sizeof(struct Entity)	
	add hl, bc
	pop bc
	djnz drawshoots_loop	; continue loop


.draw_powerups
	ld hl, _power_up
	inc hl
	inc hl
	ld a, (hl)
	and a
	ret z			; if the power up is not active, just quit

	ld d, 0
	ld e, (hl)
	dec hl
	ld c, (hl)
	dec hl
	ld b, (hl); bc = (x << 8) | y

	call _DrawSprite		; draw the power up, and that is it
;#END_ASM


PUBLIC _ShowBombBar
_ShowBombBar:
;#BEGIN_ASM
	ld hl, 56025		; position in memory for the attributes of the progress bar
	ld a, (_frames_fire_pressed)
	sra a			; and divide by 2

.bar_onloop
	and a
	jr z, bar_off
	ld (hl), 0x03
	inc hl
	dec a
	jr bar_onloop
.bar_off	
	ld a, (_frames_fire_pressed)
	sub 12
	neg
	sra a
.bar_offloop
	and a
	ret z
	ld (hl), 0x01
	inc hl
	dec a
	jr bar_offloop
;#END_ASM


PUBLIC _DrawEnemies
	_DrawEnemies:
;#BEGIN_ASM
	ld b, _MAX_ENEMIES
	ld ix, _active_enemies
	ld iy, _enemy_active_shoots

.drawenemy_loop
	push bc
	ld a, (ix+2)
	and a
	jr z, loop_enemy_shoot

	ld b, (ix+0)
	ld c, (ix+1)	; bc = (x << 8) | y
	ld d, 0
	ld e, (ix+2)
	push ix
	call _DrawSprite	
	pop ix

.loop_enemy_shoot
	ld a, (iy+2)
	and a
	jr z, loop_enemy_continue

	ld b, (iy+0)
	ld c, (iy+1)	; bc = (x << 8) | y
	ld d, 0
	ld e, (iy+2)
	push ix
	call _DrawSprite	
	pop ix

.loop_enemy_continue
	ld bc, 12		; 12 = sizeof(struct Entity)	
	add ix, bc
	add iy, bc		; go to the next entity
	pop bc
	djnz drawenemy_loop	; continue loop
;#END_ASM






