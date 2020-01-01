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


