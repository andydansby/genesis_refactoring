;SECTION code_user
SECTION UNCONTENDED

; Scan the keyboard to find a single keypress
; Input: n/a
; Output: key scan code, in A

KeyCodes:
	defb 255,'z','x','c','v'      ; CAPS SHIFT, Z, X, C, V
	defb 'a','s','d','f','g'      ; A, S, D, F, G
	defb 'q','w','e','r','t'      ; Q, W, E, R, T
	defb '1','2','3','4','5'      ; 1, 2, 3, 4, 5
	defb '0','9','8','7','6'      ; 0, 9, 8, 7, 6
	defb 'p','o','i','u','y'      ; P, O, I, U, Y
	defb 13,'l','k','j','h'       ; ENTER, L, K, J, H
	defb ' ',254,'m','n','b'      ; SPACE, SYM SHIFT, M, N, B

PUBLIC _SCAN_KEYBOARD
_SCAN_KEYBOARD:
	ld bc, $FEFE	; This is the first row, we will later scan all of them
	ld hl,KeyCodes  ; go to the KeyCode table
	ld a,8		; loop counter
	
scan_loop:
	IN E, (C)	; Read the row status
	LD D, 5		; We just need to do it 5 times per scan line
	
find_keypress:
	RR E
	JR NC, keyfound	; we found a pressed key!	
	INC HL		; if not, go to the next scan code
	DEC D
	JR NZ, find_keypress ; try next key
	RLC B
	DEC A
	JR NZ, scan_loop	; back to the scan loop. This will repeat forever until a key press is found					
	JR _SCAN_KEYBOARD	; if not, restart again	
	
keyfound:
	LD A,(HL)	; This is the scan code. We are not going back to the main loop, so we can reuse A
	push AF
	
waitforrelease:
	xor A
	in A, (C)  
	cpl 
	and $1F
	jr NZ, waitforrelease ; some key in this row is still pressed                   
	pop AF
ret       
	
	
; Get the status of a key
; Input: 
;	- BC: Key to get; B will hold the row number, C the bit to check
; Output:
;	- A: 0 if key is not pressed, 1 if pressed
PUBLIC _GET_KEY_STATE
_GET_KEY_STATE:
	ld a, c		; save the bit to check in A
	ld c, $fe	; ready to read!
	in e,(c)	; get the row in e
	
loop_get_key:
	rr e
	dec a
	jr nz, loop_get_key ; we rotate C times
	jr nc, key_pressed
	xor a		; if the bit is 1, the key was not pressed
ret

key_pressed:	
	ld a,1	
ret		; the key is pressed

; Here are all the key definitions
;ATTENTION
defc	KEY_CAPS 	= $fe01
defc	KEY_Z 		= $fe02 	
defc	KEY_X 		= $fe03
defc	KEY_C 		= $fe04
defc	KEY_V 		= $fe05

defc	KEY_A 		= $fd01
defc	KEY_S 		= $fd02
defc	KEY_D 		= $fd03
defc	KEY_F 		= $fd04
defc	KEY_G 		= $fd05

defc	KEY_Q 		= $fb01
defc	KEY_W 		= $fb02
defc	KEY_E 		= $fb03
defc	KEY_R 		= $fb04
defc	KEY_T 		= $fb05

defc	KEY_1 		= $f701
defc	KEY_2 		= $f702
defc	KEY_3 		= $f703
defc	KEY_4 		= $f704
defc	KEY_5 		= $f705

defc	KEY_0 		= $ef01
defc	KEY_9 		= $ef02
defc	KEY_8 		= $ef03
defc	KEY_7 		= $ef04
defc	KEY_6 		= $ef05

defc	KEY_P 		= $df01
defc	KEY_O 		= $df02
defc	KEY_I 		= $df03
defc	KEY_U 		= $df04
defc	KEY_Y 		= $df05

defc	KEY_ENTER 	= $bf01
defc	KEY_L 		= $bf02
defc	KEY_K 		= $bf03
defc	KEY_J 		= $bf04
defc	KEY_H 		= $bf05

defc	KEY_SPACE 	= $7f01
defc	KEY_SS 		= $7f02
defc	KEY_M 		= $7f03
defc	KEY_N 		= $7f04
defc	KEY_B 		= $7f05


; Get joystick state
; joynum: 0 (Kempston), 1 (Sinclair 1), 2 (Sinclair 2), 3 (Keys)
; If joynum == 3, IX holds a pointer a 5 int array with the Key definitions (UP,DOWN, LEFT, RIGHT, FIRE)
; Input:	
;		A: joynum
; Returns:  
;		A: joystick state
; Bit #:  765    4   3210
;         |||    |   ||||
;         XXX   BUT1 RLDU
;
; 1 means pressed, 0 means not pressed
PUBLIC _get_joystick

_get_joystick:
	push bc		; save all the registers that may be modified
	push de
	and a
	jr nz, check_sinclair1	; A==0, so Kempston
	call read_kempston_joystick
	jr get_joy_end
	
check_sinclair1:
	cp 1
	jr nz, check_sinclair2
	call read_sinclair1_joystick
	jr get_joy_end
	
check_sinclair2:
	cp 2
	jr nz, get_joy_redef
	call read_sinclair2_joystick
	jr get_joy_end
	
get_joy_redef:
	call read_redefined
	
get_joy_end:
	pop de
	pop bc
ret

;------------------------------------
; Read routine for kempston joysticks
;------------------------------------

read_kempston_joystick:
	ld c, 31
	in c, (c)		
	xor a		; clear carry and A
	
kempston_right:
	rr c
	jr nc, kempston_left
	or 0x8		;TEST right is pressed
	
kempston_left:
	rr c
	jr nc, kempston_down
	or $04		; left is pressed	
	
kempston_down:
	rr c
	jr nc, kempston_up
	or $02		; down is pressed
	
kempston_up:
	rr c
	jr nc, kempston_fire
	or $01		; up is pressed
	
kempston_fire:	
	rr c
	ret nc		; no carry, just return
	or $10		
ret

;--------------------------------------
; Read routine for Sinclair 1 joysticks
;--------------------------------------

read_sinclair1_joystick:
	ld bc, $effe
	in c, (c)  ; Leemos solo la fila 6-0. Los bits a 0 están pulsados
	xor a
	
sinclair1_fire:
	rr c
	jr c, sinclair1_up
	or $10		; fire is pressed
	
sinclair1_up:
	rr c
	jr c, sinclair1_down
	or $01		; up is pressed
	
sinclair1_down:
	rr c
	jr c, sinclair1_right
	or $02		; down is pressed
	
sinclair1_right:
	rr c
	jr c, sinclair1_left
	or 0x8		; TEST right is pressed
	
sinclair1_left:
	rr c
	ret c		; no carry, just return
	or $04		; left pressed
	ret

;--------------------------------------
; Read routine for Sinclair 2 joysticks
;--------------------------------------

read_sinclair2_joystick:
	ld bc, $f7fe
	in c, (c)  ; Leemos solo la fila 1-5. Los bits a 0 están pulsados
	xor a
	
sinclair2_left:
	rr c
	jr c, sinclair2_right
	or $04		; left is pressed
	
sinclair2_right:
	rr c
	jr c, sinclair2_down
	or 0x8		;TEST right is pressed
	
sinclair2_down:
	rr c
	jr c, sinclair2_up
	or $02		; down is pressed
	
sinclair2_up:
	rr c
	jr c, sinclair2_fire
	or $01		; up is pressed
	
sinclair2_fire:
	rr c
	ret c		; no carry, just return
	or $10		; left pressed
ret

;--------------------------------------
; Read routine for Redefined Keys
;--------------------------------------

read_redefined:; we use d as an A

redefined_up:
	ld d,0
	ld c,(ix+0)
	ld b,(ix+1)
	call _GET_KEY_STATE
	and a
	jr z, redefined_down
	ld d, a			; first bit
	
redefined_down:
	ld c,(ix+2)
	ld b,(ix+3)
	call _GET_KEY_STATE
	and a
	jr z, redefined_left
	ld a,d
	or $02
	ld d,a
	
redefined_left:
	ld c,(ix+4)
	ld b,(ix+5)
	call _GET_KEY_STATE
	and a
	jr z, redefined_right
	ld a,d
	or $04
	ld d,a
	
redefined_right:
	ld c,(ix+6)
	ld b,(ix+7)
	call _GET_KEY_STATE
	and a
	jr z, redefined_fire
	ld a,d
	or 0x8	;TEST
	ld d,a
	
redefined_fire:
	ld c,(ix+8)
	ld b,(ix+9)
	call _GET_KEY_STATE
	and a
	jr z, redefined_end
	ld a,d
	or $10
ret			;fire is pressed, return

redefined_end:
	ld a,d
ret
