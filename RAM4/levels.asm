;goes in RAM 4

org 49152

level1:
INCBIN	"level1.map"
enemies1:               ; the enemy structure has just one byte detailing the number of enemies
                        ; and the locations in struct Enemy format

         db  13          ; 13 enemies (for example)
         db  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4      ; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
         db  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
         db  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
         db  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0      ; dummy enemy, to mark the end!

level2:
INCBIN "level2.map"
enemies2:               ; the enemy structure has just one byte detailing the number of enemies
                        ; and the locations in struct Enemy format

         db  13          ; 13 enemies (for example)
         db  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4      ; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
         db  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
         db  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
         db  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0      ; dummy enemy, to mark the end!

level3:
INCBIN "level3.map"
enemies3:               ; the enemy structure has just one byte detailing the number of enemies
                        ; and the locations in struct Enemy format

         db  13          ; 13 enemies (for example)
         db  5,  0, 20, 2, MOVE_PINGPONG, 10, 0, 4      ; First enemy, tile X 5, Y 4, sprite 2, move ping-pong, energy=10, param1=0, param2 (speed) 4
         db  5,  0, 50, 2, MOVE_PINGPONG, 10, 0, 4
         db  5,  0, 80, 2, MOVE_PINGPONG, 10, 0, 4
         db  19, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 20, 2, MOVE_LEFT, 10, 4, 0
         db  19, 8, 80, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  25, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  30, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  32, 0, 20, 2, MOVE_LEFT, 10, 4, 0
         db  38, 0, 50, 2, MOVE_LEFT, 10, 4, 0
         db  40, 0, 80, 2, MOVE_LEFT, 10, 4, 0
         db  255, 23, 80, 2, MOVE_LEFT, 10, 4, 0      ; dummy enemy, to mark the end!

level4:
level5:
level6:
level7:




MOVE_NONE EQU 0
MOVE_LEFT EQU 1
MOVE_RIGHT EQU 2
MOVE_PINGPONG EQU 3
MOVE_EXPLOSION EQU 4
