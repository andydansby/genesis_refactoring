;;bank 3 above 49152
SECTION BANK_03
org 0xc000;;believe this is assumed with target ZX

PUBLIC _background
_background:
	BINARY "background.bin"
	
PUBLIC _gameover
_gameover:
	BINARY "gameover.bin"

PUBLIC _ship_pieces
_ship_pieces:
	BINARY "ship_pieces.bin"
	
PUBLIC _gameend
_gameend:
	BINARY "gameend.bin"

PUBLIC _game_end_attr
_game_end_attr:
	BINARY "endattr.bin"

PUBLIC _alien
_alien:
	BINARY "alien.bin"

PUBLIC _alien_end_attr
_alien_end_attr:
	BINARY "alienattr.bin"


