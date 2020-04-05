INTERR:
	defb     0
	;INTERRUPTORES 1=ON 0=OFF
	;BIT 0=CARGA CANCION ON/OFF
	;BIT 1=PLAYER ON/OFF
	;BIT 2=EFECTOS ON/OFF
	;MUSICA  EL ORDEN DE LAS VARIABLES ES FIJO 



SONG:
	defb     0           ;defb Number DE CANCION
TEMPO:
	defb     0           ;defb TEMPO
TTEMPO:
	defb     0           ;defb CONTADOR TEMPO
PUNTERO_A:
	defw     0           ;defw PUNTERO DEL CANAL A
PUNTERO_B:
	defw     0           ;defw PUNTERO DEL CANAL B
PUNTERO_C:
	defw     0           ;defw PUNTERO DEL CANAL C

CANAL_A:
	defw     BUFFER_DEC
		;defw DIRECION DE INICIO DE LA MUSICA A
CANAL_B:
	defw     0           ;defw DIRECION DE INICIO DE LA MUSICA B
CANAL_C:
	defw     0           ;defw DIRECION DE INICIO DE LA MUSICA C

PUNTERO_P_A:
	defw     0           ;defw PUNTERO PAUTA CANAL A
PUNTERO_P_B:
	defw     0           ;defw PUNTERO PAUTA CANAL B
PUNTERO_P_C:
	defw     0           ;defw PUNTERO PAUTA CANAL C

PUNTERO_P_A0:
	defw     0           ;defw INI PUNTERO PAUTA CANAL A
PUNTERO_P_B0:
	defw     0           ;defw INI PUNTERO PAUTA CANAL B
PUNTERO_P_C0:
	defw     0           ;defw INI PUNTERO PAUTA CANAL C

;CANAL DE EFECTOS - ENMASCARA OTRO CANAL

PUNTERO_P:
	defw    0            ;defw PUNTERO DEL CANAL EFECTOS
CANAL_P:
	defw    0            ;defw DIRECION DE INICIO DE LOS EFECTOS

;defb (13) BUFFER DE REGISTROS DEL PSG
PSG_REG:
	defb	00,00,00,00,00,00,00,10111000B,00,00,00,00,00,00
PSG_REG_SEC:
	defb	00,00,00,00,00,00,00,10111000B,00,00,00,00,00,00

;EFECTOS DE SONIDO

N_SONIDO:
	defb     0           ;defb : NUMERO DE SONIDO
PUNTERO_SONIDO:
	defw     0           ;defw : PUNTERO DEL SONIDO QUE SE REPRODUCE