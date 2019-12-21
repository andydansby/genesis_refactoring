;;org 49152





;; The final enemy structure is almost the same as the enemy one... The initial byte marks the number of sprites in the enemy
;; The movement parameters for the first sprite specify the movement of the whole enemy
finalenemy1:
	defb 4
	defb 120, 0, 48,  FINAL1_UL,    MOVE_WAVE,     26, 0, 16
	; Energy = 20, move ping-pong 2 pixels at a time
	defb 136, 0, 48,  FINAL1_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 120, 0, 64,  FINAL1_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 136, 0, 64,  FINAL1_DR,    MOVE_NONE,     0, 0, 2 	; 
finalenemy2:
	defb 7
	defb 128, 0, 48,  FINAL2_UL,    MOVE_WAVE_NOGONELEFT,     35, 2, 16
	; Energy = 20, move ping-pong 2 pixels at a time
	defb 144, 0, 48,  FINAL2_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 128, 0, 64,  FINAL2_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 144, 0, 64,  FINAL2_DR,    MOVE_NONE,     0, 0, 2 	; 
	defb 118, 0, 42,	FINAL2_SHIELD1, MOVE_NONE,   0, 0, 2
	defb 118, 0, 58,	FINAL2_SHIELD2, MOVE_NONE,   0, 0, 2
	defb 118, 0, 74,	FINAL2_SHIELD3, MOVE_NONE,   0, 0, 2
finalenemy3:
	defb 4
	defb 170, 0, 48,  FINAL3_UL,    MOVE_KAMIKAZE_NOANIM,   25, 0, 0
	; Energy = 20, move ping-pong 2 pixels at a time
	defb 186, 0, 48,  FINAL3_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 170, 0, 64,  FINAL3_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 186, 0, 64,  FINAL3_DR,    MOVE_NONE,     0, 0, 2 	; 
finalenemy4:
	defb 6
	defb 132, 0, 48,  FINAL4_UP,    MOVE_PINGPONG_FINAL4,     24, 0, 4
	; Energy = 20, move ping-pong 2 pixels at a time
	defb 164, 0, 48,  FINAL4_UP,    MOVE_NONE,     24, 0, 2  	; 
	defb 132, 0, 64,  FINAL4_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 148, 0, 64,  FINAL4_DM,    MOVE_NONE,     0, 0, 2 	; 
	defb 164, 0, 64,  FINAL4_DM,    MOVE_NONE,     0, 0, 2  	; 
	defb 180, 0, 64,  FINAL4_DR,    MOVE_NONE,     0, 0, 2 	; 
finalenemy5:
	defb 4
	defb 165, 0, 28,  FINAL5_UL,    MOVE_NONE,   35, 0, 0
	defb 181, 0, 28,  FINAL5_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 165, 0, 44,  FINAL5_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 181, 0, 44,  FINAL5_DR,    MOVE_NONE,     0, 0, 2 	; 
finalenemy6:
	defb 4
	defb 165-32, 0, 28,  FINAL6_UL,    MOVE_NONE,   50, 0, 0
	defb 181-32, 0, 28,  FINAL6_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 165-32, 0, 44,  FINAL6_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 181-32, 0, 44,  FINAL6_DR,    MOVE_NONE,     0, 0, 2 	; 
finalenemy7:
	defb 4
	defb 180, 0, 54,  FINAL7_UL,    MOVE_NONE,    50, 0, 0
	defb 196, 0, 54,  FINAL7_UR,    MOVE_NONE,     0, 0, 2  	; 
	defb 180, 0, 70,  FINAL7_DL,    MOVE_NONE,     0, 0, 2  	; 
	defb 196, 0, 70,  FINAL7_DR,    MOVE_NONE,     0, 0, 2 	; 
; Movement definitions (copy from movement.h)

defc MOVE_NONE 			= 0
defc MOVE_LEFT 			= 1
defc MOVE_RIGHT 		= 2
defc MOVE_PINGPONG 		= 3
defc MOVE_EXPLOSION 	= 4
defc MOVE_FURBY  		= 5		
defc MOVE_KAMIKAZE 		= 6
defc MOVE_WAVE 			= 7
defc MOVE_LEFTANIM 		= 8
defc MOVE_UPLEFT 		= 9
defc MOVE_UPRIGHT 		= 10
defc MOVE_DOWNLEFT 		= 11
defc MOVE_LEFT_EXPIRE 	= 12
defc MOVE_PINGPONG_FINAL4	= 13
defc MOVE_HOMING 		= 14
defc MOVE_DOWNRIGHT 	= 15
defc MOVE_UP 			= 16
defc MOVE_TARGET 		= 17
defc MOVE_KAMIKAZE_NOANIM	= 18
defc MOVE_WAVE_NOGONELEFT	= 19
defc MOVE_MISSILE		= 20
defc MOVE_KAMIKAZE_2 	= 21
defc MOVE_FOLLOW_RIGHT 	= 22
defc MOVE_FOLLOW_DOWN 	= 23
defc MOVE_FOLLOW_DOWNRIGHT	= 24
defc MOVE_LEFT_ACCEL	= 25
defc MOVE_RIGHT_ACCEL	= 26

; Enemy definitions. Each label is the sprite number where they will be loaded

defc ENEMY_EYE					= 0
defc ENEMY_CANNON_DOWN_LEFT		= 1
defc ENEMY_CANNON_DOWN_RIGHT	= 2
defc ENEMY_CANNON_UP			= 3
defc ENEMY_1					= 4
defc ENEMY_KAMIKAZE				= 5
defc ENEMY_FURBY				= 6
defc ENEMY_FINAL4_EYE			= 7
defc ENEMY_POWERUP				= 8

defc ENEMY_SHIP1				= 9
defc ENEMY_SHIP2				= 10
defc ENEMY_SHIP3				= 11
defc ENEMY_SHIP4				= 12
defc ENEMY_TURRET				= 13

defc ENEMY_FINAL1_SHOOT			= 14

defc ENEMY_ASTEROID				= 15
defc ENEMY_TRASH1				= 16
defc ENEMY_TRASH2				= 17
defc ENEMY_TRASH3				= 18
defc ENEMY_TRASH4				= 19
defc ENEMY_TRASH5				= 20

defc ENEMY_SALTARIN				= 21
defc ENEMY_CASCO				= 22
defc ENEMY_EGG					= 23
defc ENEMY_UGLYGUY				= 24
defc ENEMY_1_BIS				= 25

defc ENEMY_SHIP2_BIS			= 26
defc ENEMY_SHIP3_BIS			= 27
defc ENEMY_SALTARIN_BIS			= 28
defc ENEMY_CASCO_BIS			= 29
defc ENEMY_EGG_BIS				= 30
defc ENEMY_UGLYGUY_BIS			= 31

defc ENEMY_SHIP1_LEVEL7			= 32
defc ENEMY_SHIP2_LEVEL7			= 33
defc ENEMY_SHIP3_LEVEL7			= 34
defc ENEMY_SHIP4_LEVEL7			= 35
defc ENEMY_TURRET_LEVEL7		= 36
defc ENEMY_PACOSHIP_1			= 37
defc ENEMY_PACOSHIP_2			= 38
defc ENEMY_FINAL1_LEVEL7_UL		= 39
defc ENEMY_FINAL1_LEVEL7_UR		= 40
defc ENEMY_FINAL1_LEVEL7_DL		= 41
defc ENEMY_FINAL1_LEVEL7_DR		= 42

; Final enemy definitions
defc FINAL1_UL					= 0
defc FINAL1_UR					= 1
defc FINAL1_DL					= 2
defc FINAL1_DR					= 3

defc FINAL2_UL					= 0
defc FINAL2_UR					= 1
defc FINAL2_DL					= 2
defc FINAL2_DR					= 3
defc FINAL2_SHIELD1				= 4
defc FINAL2_SHIELD2				= 5
defc FINAL2_SHIELD3				= 6

defc FINAL3_UL					= 0
defc FINAL3_UR					= 1
defc FINAL3_DL					= 2
defc FINAL3_DR					= 3

defc FINAL4_UP					= 0
defc FINAL4_DL					= 1
defc FINAL4_DM					= 2
defc FINAL4_DR					= 3

defc FINAL5_UL					= 0
defc FINAL5_UR					= 1
defc FINAL5_DL					= 2
defc FINAL5_DR					= 3

defc FINAL6_UL					= 0
defc FINAL6_UR					= 1
defc FINAL6_DL					= 2
defc FINAL6_DR					= 3

defc FINAL7_UL					= 0
defc FINAL7_UR					= 1
defc FINAL7_DL					= 2
defc FINAL7_DR					= 3
