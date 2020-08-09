;;bank 4 above 49152
SECTION BANK_04

;#BEGIN_ASM
;#END_ASM

PUBLIC _level0map
;#BEGIN_ASM
_level0map:
	BINARY "level0map.bin"
;#END_ASM

PUBLIC _enemies0
;#BEGIN_ASM
_enemies0:
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format

	;;------------------------------
	defb  14	;;number of enemies
	;; 14 enemies (for example)
	;;------------------------------
	;; enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  6, 6, 80, 2, MOVE_LEFT, 10, 4, 0

;; dummy enemy, to mark the end!
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
;; dummy enemy, to mark the end!
;#END_ASM



PUBLIC _level1map
;#BEGIN_ASM
_level1map:
	BINARY "level1map.bin"
;#END_ASM


PUBLIC _enemies1
;#BEGIN_ASM
_enemies1:
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format

	;;------------------------------
	defb  13	;;number of enemies
	;;------------------------------
	
	;; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0

;; dummy enemy, to mark the end!	
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
;#END_ASM


PUBLIC _level2map
;#BEGIN_ASM
_level2map:
	BINARY "level2map.bin"
;#END_ASM

PUBLIC _enemies2
;#BEGIN_ASM
_enemies2:
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format

	;;------------------------------
	defb  13	;;number of enemies
	;;------------------------------
	
	;; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0

;; dummy enemy, to mark the end!	
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
;#END_ASM

PUBLIC _level3map
;#BEGIN_ASM
_level3map:
	BINARY "level3map.bin"
;#END_ASM

PUBLIC _enemies3
;#BEGIN_ASM
_enemies3:
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format

	;;------------------------------
	defb  13	;;number of enemies
	;;------------------------------
	
	;; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
	defb  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
	defb  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
	defb  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
	defb  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
	defb  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0
;; dummy enemy, to mark the end!
;#END_ASM




;#BEGIN_ASM
;#END_ASM

PUBLIC _level4map
_level4map:
PUBLIC _enemies4
_enemies4:




defc MOVE_NONE	= 0	;MOVE_NONE EQU 0
defc MOVE_LEFT	= 1	;MOVE_LEFT EQU 1
defc MOVE_RIGHT	= 2	;MOVE_RIGHT EQU 2
defc MOVE_PINGPONG	= 3	;MOVE_PINGPONG EQU 3
defc MOVE_EXPLOSION	= 4	;MOVE_EXPLOSION EQU 4









;;this PUBLIC needs to be ABSOLUTELY LAST as it's just a marker
;;used to find where in memory the last byte is located
PUBLIC _endmarkerRam4
_endmarkerRam4:
	nop