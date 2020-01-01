; This is the main file for the scrolling engine
; It will just set the assembler origin, and include the files

;;remove this org as we are dynamically assigning everything
;org 33025

extern _mayday
extern _enemy_active_shoots
extern _MAX_ENEMIES

defc _MAX_ENEMIES = 8
;;Attention
;;need to be able to take this from the C code

Ship_Collision:		defb 0

include "drawmap.asm";;DONE
;include "rambanks.asm" ALREADY IN MAIN.ASM
include "drawsprite.asm";;DONE
include "input.asm";;DONE
include "create_shifted_tables.asm";;DONE
include "im2.asm"
include "starfield.asm"


;;These 3 variables are already assigned in create_shifted_tables.asm
;;moved to main.asm
;SPRITE_START EQU $9000
; we have 4k for sprites, $9000 - $9FFF
;MAP_START    EQU $A000
; 4k for the game map, $a000 - $afff
;defc TablaTiles = $B000
;TablaTiles   EQU $B000


;Divide 8-bit values
;In: Divide E by divider D
;Out: A = result, D = rest
;
PUBLIC _Div8
_Div8:
;#BEGIN_ASM
    xor a
    ld b,8
Div8_Loop:
    rl e
    rla
    sub d
    jr nc,Div8_NoAdd
    add a,d
Div8_NoAdd:
    djnz Div8_Loop
    ld d,a
    ld a,e
    rla
    cpl
ret
;#END_ASM

PUBLIC _CheckShipCollision
	_CheckShipCollision:
;#BEGIN_ASM
	ld a, (Ship_Collision)
	and a
	ret z
.collision
	ld a, (_mayday)
	and a
	ret nz			; if mayday is already non zero, do not duplicate
.cheathere
	inc a			; NORMAL BEHAVIOR
;	nop				; CHEAT!!!!!
	ld (_mayday),a		; mayday, we have been hit!
;#END_ASM


PUBLIC _CheckShootCollision
	_CheckShootCollision:
;#BEGIN_ASM
    ld ix, _my_active_shoots    ; pointer to the structure
    ld a, (_max_shoots)
    ld iyh, a                     ; IYh will be the counter
    call _checkshootloop

    ld ix, _enemy_active_shoots
    ld a, _MAX_ENEMIES
    ld iyh, a
    call _checkshootloop		; check the same, for the enemy shoots
;#END_ASM



PUBLIC _checkshootloop
	_checkshootloop:
;#BEGIN_ASM
    ld a, (ix+2)		; get sprnum
    and a
    jp z, continue_collisionloop 	; ignore non-existing shoots

    ld a, (ix+0)                 
    add a, 12
    ld e, a			; E == shoot_x
    ld d, 24
    call _Div8			; A holds x /24, D holds x % 24
    ld e, a
    ld a, (_map_xpos)
    add a, e			
    ld c, a			; C = x_tile = map_xpos + x/24 
    ld a, (_map_displacement)
    add a, a			; a * 2
    add a, d			; a = map_disp + x %24
    cp 24
    jp c, no_overflow		; a < 24
    inc c			; if a >= 24, increment x_tile
.no_overflow
    ld a, (ix+1)                ; a = shoot_y, c = shoot_x (in tile terms)
    add a, 4			; middle of the shoot
    sra a
    sra a
    sra a			; a = shoot_y (in tile terms), c = shoot_x (in tile terms)

    ld h, $a0
    ld l, c			; hl holds the position of shoot_x (in tile terms) in the map
    ex af, af
    ld a, (_CurLevel_XLength)
    ld e,a
    xor a
    ld d, a
    ex af, af			; we need to add DE shoot_y times
    and a
    jp z, endloop_addde		; if a is zero, no need to add

.loop_addde
    add hl, de
    dec a
    jr nz, loop_addde		; at the end, HL has the tile address
.endloop_addde
    ld a, (hl)
    and a
    jr z, noshootcollision1
    xor a
    ld (ix+2), a                ; my_active_shoots[i].sprnum=0
    jp continue_collisionloop

.noshootcollision1		; now check again, for the lower side of the shoot
    ld a, (ix+1)                ; a = shoot_y, c = shoot_x (in tile terms)
    add a, 12			; middle of the shoot
    sra a
    sra a
    sra a			; a = shoot_y (in tile terms), c = shoot_x (in tile terms)
    ld h, $a0
    ld l, c			; hl holds the position of shoot_x (in tile terms) in the map
    ex af, af
    ld a, (_CurLevel_XLength)
    ld e,a
    xor a
    ld d, a
    ex af, af			; we need to add DE shoot_y times
    and a
    jp z, endloop_addde2		; if a is zero, no need to add

.loop_addde2
    add hl, de
    dec a
    jr nz, loop_addde2		; at the end, HL has the tile address
.endloop_addde2
    ld a, (hl)
    and a
    jr z, continue_collisionloop
    xor a
    ld (ix+2), a                ; my_active_shoots[i].sprnum=0
.continue_collisionloop
    ld bc, 12			; 12 == sizeof (struct Entity)
    add ix, bc
    dec iyh
    jp nz, _checkshootloop
ret
;#END_ASM









