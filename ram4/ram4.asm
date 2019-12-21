;;bank 4 above 49152
SECTION BANK_04
org 0xc000;;believe this is assumed with target ZX

INCLUDE "levels.asm"

;PUBLIC _background
;_background:
;   BINARY "background.bin"

PUBLIC _level1
_level1:
	BINARY "level1.map"
	
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies1
_enemies1:
	INCLUDE "level1_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
PUBLIC _level2
_level2:
	BINARY "level2.map"
	
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies2
_enemies2:
	INCLUDE "level2_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
PUBLIC _level3
_level3:
	BINARY "level3.map"

;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies3
_enemies3:
	INCLUDE "level3_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
PUBLIC _level4
_level4:
	BINARY "level4.map"
	
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies4
_enemies4:
	INCLUDE "level4_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PUBLIC _level5
_level5:
	BINARY "level5.map"

;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies5
_enemies5:
	INCLUDE "level5_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PUBLIC _level6
_level6:
	BINARY "level6.map"

;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies6
_enemies6:
	INCLUDE "level6_enemies.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
PUBLIC _level7
_level7:
	BINARY "level7.map"
;; the enemy structure has just one byte detailing the number of enemies
;; and the locations in struct Enemy format
PUBLIC _enemies7
_enemies7:
	INCLUDE "level7_enemies.asm"
	
	
	
	