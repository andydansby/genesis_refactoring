;;bank 4 above 49152
SECTION BANK_04


PUBLIC _level1map
_level1map:
	BINARY "level1map.bin"

PUBLIC _enemies1
_enemies1:
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format

; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  13          ; 13 enemies (for example)
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
; dummy enemy, to mark the end!



PUBLIC _level2map
_level2map:
	BINARY "level2map.bin"

PUBLIC _enemies2
_enemies2:	
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format
; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  13          ; 13 enemies (for example)
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
; dummy enemy, to mark the end!



PUBLIC _level3map
_level3map:
	BINARY "level3map.bin"

PUBLIC _enemies3
_enemies3:
; the enemy structure has just one byte detailing the number of enemies
; and the locations in struct Enemy format
; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
	defb  13          ; 13 enemies (for example)
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
; dummy enemy, to mark the end!

PUBLIC _level4map
_level4map:
PUBLIC _enemies4
_enemies4:

PUBLIC _level5map
_level5map:
PUBLIC _enemies5
_enemies5:

PUBLIC _level6map
_level6map:
PUBLIC _enemies6
_enemies6:

PUBLIC _level7map
_level7map:
PUBLIC _enemies7
_enemies7:




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