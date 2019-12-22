; These definitions are from main.c
; It is a bit of a pain, but we have to link
; by hand

;;ATTENTION
;;THESE are hard coded addresses
;; need to fix
_active_enemies 	EQU	$7D9B
_enemy_sprites 		EQU	$60D1
_fenemy_defeat 		EQU	$7D9A
_NewEnemy		EQU	$68E1
_NewEnemyShoot		EQU	$689E
_NewEnemyShoot_FX 	EQU	$6896
_ship_x			EQU	$7F02
_ship_y			EQU	$7F03
_power_up		EQU	$7F05
_wyz_effect     	EQU     $622E



MOVE_NONE 	EQU	0
MOVE_LEFT 	EQU	1
MOVE_RIGHT 	EQU	2
MOVE_PINGPONG 	EQU	3
MOVE_EXPLOSION 	EQU	4
MOVE_FURBY  	EQU	5		
MOVE_KAMIKAZE 	EQU	6
MOVE_WAVE 	EQU	7
MOVE_LEFTANIM 	EQU	8
MOVE_UPLEFT 	EQU	9
MOVE_UPRIGHT 	EQU	10
MOVE_DOWNLEFT 	EQU	11
MOVE_LEFT_EXPIRE EQU	12
MOVE_PINGPONG_FINAL4 EQU	13
MOVE_HOMING 	EQU	14
MOVE_DOWNRIGHT 	EQU	15
MOVE_UP 	EQU	16
MOVE_TARGET 	EQU	17
MOVE_KAMIKAZE_NOANIM EQU	18
MOVE_WAVE_NOGONELEFT  EQU 19
MOVE_MISSILE	EQU	20
MOVE_KAMIKAZE_2 EQU	21
MOVE_FOLLOW_RIGHT EQU 22
MOVE_FOLLOW_DOWN EQU 23
MOVE_FOLLOW_DOWNRIGHT EQU 24
MOVE_LEFT_ACCEL	EQU 25
MOVE_RIGHT_ACCEL	EQU 26

; Some sprite definitions

; Shoot types

SHOT_CANNON_LEFT EQU	47
SHOT_CANNON_RIGHT EQU	48
SHOT_EYE_DOWN	EQU	49
SHOT_BASIC	EQU	50
SHOT_ENEMY	EQU	51
SHOT_LASER	EQU	52
SHOT_HOMING	EQU	53
SHOT_BOMB	EQU	54
SHOT_MEGA	EQU	55
SHOT_CASCO_MISSILE	EQU 43
SHOT_CASCO_MISSILE_BIS	EQU	45
EXPLOSION_SPR   EQU	18
MAINSHIP_EXPLOSION EQU	10
ASTEROID_EXPL	EQU	31
SHOT_MEGAMISSILE_1	EQU	38
SHOT_MEGAMISSILE_2	EQU	39



; Enemies

ENEMY_EYE		EQU	22
ENEMY_CANNON_DOWN_LEFT	EQU	23
ENEMY_CANNON_DOWN_RIGHT EQU	24
ENEMY_CANNON_UP		EQU	25
ENEMY_1			EQU	29
ENEMY_KAMIKAZE		EQU	33
ENEMY_FURBY		EQU	37
ENEMY_FINAL4_EYE        EQU	26
ENEMY_POWERUP		EQU	56
ENEMY_SHIP1		EQU	22
ENEMY_SHIP2		EQU	23
ENEMY_SHIP3		EQU	24
ENEMY_SHIP4		EQU	25
ENEMY_TURRET		EQU	26
ENEMY_FINAL1_SHOOT	EQU	38
ENEMY_ASTEROID		EQU	22
ENEMY_TRASH1		EQU	26
ENEMY_TRASH2		EQU	27
ENEMY_TRASH3		EQU	28
ENEMY_TRASH4		EQU	29
ENEMY_TRASH5		EQU	30
ENEMY_SALTARIN		EQU	22
ENEMY_CASCO		EQU	26
ENEMY_EGG		EQU	30
ENEMY_UGLYGUY		EQU	40
ENEMY_1_BIS		EQU	46
ENEMY_SHIP2_BIS		EQU	22
ENEMY_SHIP3_BIS		EQU	23
ENEMY_SALTARIN_BIS	EQU	24
ENEMY_CASCO_BIS		EQU	28
ENEMY_EGG_BIS		EQU	32
ENEMY_UGLYGUY_BIS	EQU	42

ENEMY_SHIP1_LEVEL7	EQU	22
ENEMY_SHIP2_LEVEL7	EQU	23
ENEMY_SHIP3_LEVEL7	EQU	24
ENEMY_SHIP4_LEVEL7	EQU	25
ENEMY_TURRET_LEVEL7	EQU	26
ENEMY_PACOSHIP_1	EQU	29
ENEMY_PACOSHIP_2	EQU	30
ENEMY_FINAL1_LEVEL7_UL	EQU	31
ENEMY_FINAL1_LEVEL7_UR	EQU	32
ENEMY_FINAL1_LEVEL7_DL	EQU	33
ENEMY_FINAL1_LEVEL7_DR	EQU	34


; Final enemies	(FIXME!!!!!)
FINAL4_UP		EQU	22
FINAL4_DL		EQU	23
FINAL4_DM		EQU	24
FINAL4_DR		EQU	25

; Sound effects
FX_EXPLOSION    EQU 0
FX_BLAST        EQU 1
FX_HIT_CAPSULE  EQU 2
FX_DAMAGE       EQU 3
FX_DOUBLE_SHOOT EQU 4
FX_MENU_INERTIA EQU 5
FX_POWERUP      EQU 6
FX_SINGLE_SHOOT EQU 7
FX_TRIPLE_SHOOT EQU 8
FX_START_GAME   EQU 9
FX_ORGANIC_EXPL EQU 10
FX_LASER	EQU 11		
FX_SCORE	EQU 12		
FX_DISPARO_MULTI	EQU 13	
FX_DISPARO_HOMMING	EQU 14	
