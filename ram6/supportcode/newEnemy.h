#ifndef NEWENEMY_H
#define NEWENEMY_H

struct Entity * NewEnemy(struct Enemy *e, unsigned char first)
{
__asm

	ld hl, 2
	add hl, sp
	ld b, (hl)		; B = first
	inc hl
	inc hl
	ld e, (hl)
	inc hl
	ld d, (hl)
	ld ixh, d
	ld ixl, e		; IX = e
	ld hl, _active_enemies-12
	ld de, 12
	ld a, b			; Save first in A
	inc b
	
gotofirst:
	add hl, de
	djnz, gotofirst

	ld b, a
	inc hl
	inc hl
	
findemptyenemy:
	ld a, (hl)
	and a
	jp nz, enemynotempty
; Empty slot found, populate it!
	dec hl
	dec hl			; point to e->X

	push hl			; Save HL
	ld a, (_map_xpos)
	neg
	add a, (ix+0)		; A = e->x - map_xpos
	ld l, a
	ld h, 0
	xor a
	rl l
	rl h
	rl l
	rl h
	rl l
	rl h			; HL = HL*8
	ld d, h
	ld e, l
	add hl, de
	add hl, de		; HL = HL*24, (e->x - map_xpos) * 24)
	ld e, (ix+1)
	ld d, 0			; DE=e->e_xdesp
	add hl, de		; HL = (e->x - map_xpos) * 24) + e->x_desp
	ld a, (_map_displacement)
	rlca			; the highest bit of map_displacement is always 0, so in effect it is << 1
	ld e, a
	sbc hl, de		; HL = ((e->x - map_xpos) * 24) + e->x_desp - (map_displacement<<1), it should be less than 256
	ex de, hl
	pop hl
	ld (hl), e		;  active_enemies[i].x=((e->x - map_xpos) * 24) + e->x_desp - (map_displacement<<1);
	inc hl
	ld a, (ix+2)
	ld (hl), a		;  active_enemies[i].y=e->y;
	inc hl
	push hl
	ld hl, _enemy_sprites
	ld a, (ix+3)		; e->enemy_type
	ld e, a
	ld d, 0
	add hl, de
	ld a, (hl)		; A = enemy_sprites[e->enemy_type]
	pop hl
	ld (hl), a		; active_enemies[i].sprnum=enemy_sprites[e->enemy_type];
	inc hl
	ld a, (ix+3)		; e->enemy_type
	ld (hl), a		; active_enemies[i].type= e->enemy_type;
	inc hl
	ld a, (ix+4)		; e->movement
	ld (hl), a		; active_enemies[i].movement=e->movement;
	inc hl
	ld a, (ix+5)	
	ld (hl), a		; active_enemies[i].energy = e->energy;
	inc hl
	ld a, (ix+6)
	ld (hl), a		; active_enemies[i].param1=e->param1;
	inc hl
	ld a, (ix+7)
	ld (hl), a		; active_enemies[i].param1=e->param2;
	xor a
	inc hl
	ld (hl), a		; active_enemies[i].param3=0;
	inc hl
	ld (hl), a		; active_enemies[i].param4=0;
	inc hl
	ld a, (ix+3)		; e->enemy_type
	push hl
	ld hl, _behavior_types
	ld e, a
	add hl, de
	ld a, (hl)		; A = behavior_types[e->enemy_type];
	pop hl
	ld (hl), a		; active_enemies[i].behavior = behavior_types[e->enemy_type];
	inc hl
	xor a
	ld (hl), a		; active_enemies[i].behav_param=0;
	ld de, -11
	add hl, de
	ret			; return &(active_enemies[i])

enemynotempty:
	ld de, 12
	add hl, de
	inc b
	ld a, MAX_ENEMIES-1
	cp b
	jp nc, findemptyenemy

	ld hl, 0		; return 0 if no empty enemy was found
__endasm
}



/*
	for(i=first;i<MAX_ENEMIES;i++)
	{
		if(active_enemies[i].sprnum == 0)
		{
			active_enemies[i].sprnum=enemy_sprites[e->enemy_type];
			active_enemies[i].type= e->enemy_type;
			active_enemies[i].behavior = behavior_types[e->enemy_type];
			active_enemies[i].x=((e->x - map_xpos) * 24) + e->x_desp - (map_displacement<<1);
			active_enemies[i].y=e->y;
			active_enemies[i].energy = e->energy;
			active_enemies[i].movement=e->movement;
			active_enemies[i].param1=e->param1;
			active_enemies[i].param2=e->param2;
			active_enemies[i].param3=0;
			active_enemies[i].param4=0;
			active_enemies[i].behav_param=0;
			return &(active_enemies[i]);
		}
	}
	return (struct Entity *)0;*/
  
  
  
#endif

