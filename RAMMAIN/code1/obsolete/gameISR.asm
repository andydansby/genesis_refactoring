;;gameISR.asm

;5 errors occurred during assembly
;Errors in source file uncontended.asm:
;Error at file 'gameISR.asm' line 11: symbol 'switchscreen' not defined
;^ ----       call switchscreen       ; switch screen
;Error at file 'gameISR.asm' line 18: symbol '_isrdummy' not defined
;^ ----       ld (_isrdummy), a       ; save current state
;Error at file 'gameISR.asm' line 20: symbol 'setrambank' not defined
;^ ----       call setrambank         ; go to rambank 0 for the music ISR
;Error at file 'gameISR.asm' line 22: symbol '_isrdummy' not defined
;^ ----       ld a, (_isrdummy)
;Error at file 'gameISR.asm' line 24: symbol 'setrambank' not defined
;^ ----       call setrambank         ; go back to normal state
 
 
SECTION code_crt_common

extern WYZ_PLAY

;;extern _isrdummy;; isrdummy is a C variable, does it have to be?
;;extern _setrambank

PUBLIC _gameISR
_gameISR:
	ld a,r
	jp p, _noscreenswitch	; the highest bit of R is 0, no screen switch yet
	call _switchscreen	; switch screen
	ld a, r
	and $7f
	ld r,a	; clear the highest bit of the R register. It will be used to flag for a screen switch
	
PUBLIC _noscreenswitch
_noscreenswitch:
	ld a, (23388)
	and $07			; keep low bits
	ld (_isrdummy), a	; save current state
	ld b, 0
	call _setrambank		; go to ram bank 0 for the music ISR
	call WYZ_PLAY
	ld a, (_isrdummy)
	ld b, a
	call _setrambank		; go back to normal state
ret