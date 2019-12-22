; These definitions are from main.c
; It is a bit of a pain, but we have to link
; by hand

;;ATTENTION
;;THESE are hard coded addresses
;; need to fix
;; I believe these can be handled using the PUBIC
;;KEYWORD.  as I think that these reference non 
;;banked memory
defc _active_enemies 	=	$7D9B
defc _enemy_sprites 		=	$60D1
defc _fenemy_defeat 		=	$7D9A
defc _NewEnemy		=	$68E1
defc _NewEnemyShoot		=	$689E
defc _NewEnemyShoot_FX 	=	$6896
defc _ship_x			=	$7F02
defc _ship_y			=	$7F03
defc _power_up		=	$7F05
defc _wyz_effect     	=     $622E
;;ATTENTION
;;THESE are hard coded addresses
;; need to fix




defc MOVE_NONE				= 0
defc MOVE_LEFT				= 1
defc MOVE_RIGHT				= 2
defc MOVE_PINGPONG			= 3
defc MOVE_EXPLOSION			= 4
defc MOVE_FURBY				= 5
defc MOVE_KAMIKAZE			= 6
defc MOVE_WAVE				= 7
defc MOVE_LEFTANIM			= 8
defc MOVE_UPLEFT			= 9
defc MOVE_UPRIGHT			= 10
defc MOVE_DOWNLEFT			= 11
defc MOVE_LEFT_EXPIRE		= 12
defc MOVE_PINGPONG_FINAL4	= 13
defc MOVE_HOMING			= 14
defc MOVE_DOWNRIGHT			= 15
defc MOVE_UP				= 16
defc MOVE_TARGET			= 17
defc MOVE_KAMIKAZE_NOANIM 	= 18
defc MOVE_WAVE_NOGONELEFT  	= 19
defc MOVE_MISSILE			= 20
defc MOVE_KAMIKAZE_2		= 21
defc MOVE_FOLLOW_RIGHT		= 22
defc MOVE_FOLLOW_DOWN		= 23
defc MOVE_FOLLOW_DOWNRIGHT	= 24
defc MOVE_LEFT_ACCEL		= 25
defc MOVE_RIGHT_ACCEL		= 26

; Some sprite definitions

; Shoot types

defc SHOT_CANNON_LEFT		= 47
defc SHOT_CANNON_RIGHT		= 48
defc SHOT_EYE_DOWN			= 49
defc SHOT_BASIC				= 50
defc SHOT_ENEMY				= 51
defc SHOT_LASER				= 52
defc SHOT_HOMING			= 53
defc SHOT_BOMB				= 54
defc SHOT_MEGA				= 55
defc SHOT_CASCO_MISSILE		= 43
defc SHOT_CASCO_MISSILE_BIS	= 45
defc EXPLOSION_SPR			= 18
defc MAINSHIP_EXPLOSION		= 10
defc ASTEROID_EXPL			= 31
defc SHOT_MEGAMISSILE_1		= 38
defc SHOT_MEGAMISSILE_2		= 39



; Enemies

defc ENEMY_EYE		=	22
defc ENEMY_CANNON_DOWN_LEFT	=	23
defc ENEMY_CANNON_DOWN_RIGHT =	24
defc ENEMY_CANNON_UP		=	25
defc ENEMY_1			=	29
defc ENEMY_KAMIKAZE		=	33
defc ENEMY_FURBY		=	37
defc ENEMY_FINAL4_EYE        =	26
defc ENEMY_POWERUP		=	56
defc ENEMY_SHIP1		=	22
defc ENEMY_SHIP2		=	23
defc ENEMY_SHIP3		=	24
defc ENEMY_SHIP4		=	25
defc ENEMY_TURRET		=	26
defc ENEMY_FINAL1_SHOOT	=	38
defc ENEMY_ASTEROID		=	22
defc ENEMY_TRASH1		=	26
defc ENEMY_TRASH2		=	27
defc ENEMY_TRASH3		=	28
defc ENEMY_TRASH4		=	29
defc ENEMY_TRASH5		=	30
defc ENEMY_SALTARIN		=	22
defc ENEMY_CASCO		=	26
defc ENEMY_EGG		=	30
defc ENEMY_UGLYGUY		=	40
defc ENEMY_1_BIS		=	46
defc ENEMY_SHIP2_BIS		=	22
defc ENEMY_SHIP3_BIS		=	23
defc ENEMY_SALTARIN_BIS	=	24
defc ENEMY_CASCO_BIS		=	28
defc ENEMY_EGG_BIS		=	32
defc ENEMY_UGLYGUY_BIS	=	42

defc ENEMY_SHIP1_LEVEL7	=	22
defc ENEMY_SHIP2_LEVEL7	=	23
defc ENEMY_SHIP3_LEVEL7	=	24
defc ENEMY_SHIP4_LEVEL7	=	25
defc ENEMY_TURRET_LEVEL7	=	26
defc ENEMY_PACOSHIP_1	=	29
defc ENEMY_PACOSHIP_2	=	30
defc ENEMY_FINAL1_LEVEL7_UL	=	31
defc ENEMY_FINAL1_LEVEL7_UR	=	32
defc ENEMY_FINAL1_LEVEL7_DL	=	33
defc ENEMY_FINAL1_LEVEL7_DR	=	34


; Final enemies	(FIXME!!!!!)
defc FINAL4_UP		=	22
defc FINAL4_DL		=	23
defc FINAL4_DM		=	24
defc FINAL4_DR		=	25

; Sound effects
defc FX_EXPLOSION    = 0
defc FX_BLAST        = 1
defc FX_HIT_CAPSULE  = 2
defc FX_DAMAGE       = 3
defc FX_DOUBLE_SHOOT = 4
defc FX_MENU_INERTIA = 5
defc FX_POWERUP      = 6
defc FX_SINGLE_SHOOT = 7
defc FX_TRIPLE_SHOOT = 8
defc FX_START_GAME   = 9
defc FX_ORGANIC_EXPL = 10
defc FX_LASER	= 11		
defc FX_SCORE	= 12		
defc FX_DISPARO_MULTI	= 13	
defc FX_DISPARO_HOMMING	= 14	
