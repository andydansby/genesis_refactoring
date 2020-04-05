
;FUNCIONES DEL PLAYER DE FX
;___________________________

;INICIA FX
;REPRODUCE_EFECTO
;FIN_EFECTO


;VARIBLES Y FUNCIONES EXTERNAS
;_____________________________

;TABLA_EFECTOS		DW TABLA DE DIRECCIONES DE LOS EFECTOS
;INTERR			defb
;EXT_WORD		FUNCION DE EXTRACCION DE LA DIRECCION DEL FX POR Nº DE ORDEN


; *** AJUSTAR CANAL DE EFECTOS ANTES DE INICIAR EL REPRODUCTOR
; *** LLAMAR EN CADA INTERRUPCION A REPRODUCE_EFECTO

; VARIABLES
;___________

;INTERR:         defb     00              ;INTERRUPTORES 1=ON 0=OFF
                                        ;BIT 0=CARGA CANCION ON/OFF
                                        ;BIT 1=PLAYER ON/OFF
                                        ;BIT 2=SONIDOS ON/OFF

					;BIT 3=EFECTOS ON/OFF
;EFECTOS

;N_EFECTO	       	defb	0   ;defb : NUMERO DE SONIDO
PUNTERO_EFECTO:
		defw	0   ;DW : PUNTERO DEL SONIDO QUE SE REPRODUCE;REPRODUCE EFECTOS
CANAL_EFECTOS:
		defb  	1   ;defb : 1:CANAL A - 2:CANAL B - OTRO:CANAL C

; B: effect number


INICIA_EFECTO:
	LD	A,B
		LD      HL,TABLA_EFECTOS
                CALL    EXT_WORD
                LD      (PUNTERO_EFECTO),HL
		LD      HL,INTERR
                SET     3,(HL)
                RET

REPRODUCE_EFECTO:

                LD      HL,INTERR
                BIT     3,(HL)          	;ESTA ACTIVADO EL EFECTO?
                RET     Z
                LD      HL,(PUNTERO_EFECTO)
                LD      A,(HL)
                CP      $FF
                JP      Z,FIN_EFECTO
                LD	B,A			;FRECUENCIA FINO
                INC     HL
                LD	A,(HL)
                RRCA
                RRCA
                RRCA
                RRCA
                AND     00001111B
                LD	C,A			;	FRECUENCIA GRAVE
		LD      A,10111000B		;	ELIMINA RUIDO
       		LD      (PSG_REG_SEC+7),A
                LD      A,(HL)
                DEC	A			;DEC A PARA BAJR VOLUMEN!! O PONER VARIABLE
                ;DEC	A
                AND     00001111B

                LD	D,A			;VOLUMEN
                INC     HL			;INCREMENTA Y GUARDA EL PUNTERO
                LD      (PUNTERO_EFECTO),HL
           	LD	IX,PSG_REG_SEC
                LD	A,(CANAL_EFECTOS)	;SELECCION DE CANAL *********
                CP	1
                JR	Z,RS_CANALA
                CP	2
		JR	Z,RS_CANALB
		
RS_CANALC:
	LD      (IX+4),B
		LD      (IX+5),C
                LD      (IX+10),D
                RET
		
RS_CANALA:
	LD      (IX+0),B
		LD      (IX+1),C
                LD      (IX+8),D
                RET
                
RS_CANALB:	LD      (IX+2),B
		LD      (IX+3),C
                LD      (IX+9),D
                RET
                
FIN_EFECTO:     LD      HL,INTERR
                RES     3,(HL)			;DESACTIVA EFECTO
                RET         


;EFECTO ENSAMBLE
ASSEMBLE_EFFECT:
      LD   HL,SFX_ENSAMBLE
      LD   DE,PSG_REG
      LD   BC,14
      LDIR
      CALL   ROUT
      RET
      

SFX_ENSAMBLE:
	defb   $FF,$02,$01,$03,0,0,0,10111000B,$10,0,$00,$C0,$00,$0C



TABLA_EFECTOS:
	defw	EXPLOSION_NAVE,BLAST,ABRE_CAPSULA,DANO,DISPARO_DOBLE,TECLA_INERCIA,CAPSULA_RECOGIDA,DISPARO_SIMPLE,DISPARO_TRIPLE,JUEGO_START,EXPLOSION_SENCILLA_ORGANICA,LASER,SCORE,DISPARO_MULTI,DISPARO_HOMMING ; .......


EXPLOSION_NAVE:

defb $B0,$0E
defb $db,$0E
defb $43,$1C
defb $84,$1C
defb $00,$2E
defb $00,$3E
defb $A0,$0D
defb $CB,$0D
defb $33,$1E
defb $74,$1E
defb $00,$2D
defb $00,$3D
defb $05,$4D
defb $90,$0B
defb $BB,$0B
defb $23,$1C
defb $64,$1C
defb $00,$2B
defb $00,$3B
defb $05,$48
defb $50,$58
defb $B0,$07
defb $BB,$07
defb $23,$18
defb $64,$18
defb $00,$27
defb $00,$37
defb $05,$46
defb $50,$56
defb $B0,$05
defb $BB,$05
defb $23,$16
defb $64,$16
defb $00,$25
defb $00,$34
defb $05,$44
defb $50,$53
defb $B0,$04
defb $db,$04
defb $43,$15
defb $84,$15
defb $00,$24
defb $00,$33
defb $05,$42
defb $50,$51
defb $B0,$03
defb $db,$03
defb $43,$14
defb $84,$14
defb $00,$23
defb $00,$33
defb $05,$42
defb $50,$51
defb $FF


;blast

BLAST:

defb $10,$0C
defb $15,$0D
defb $00,$0D
defb $25,$0F
defb $30,$0E
defb $35,$0D
defb $80,$0D
defb $00,$81
defb $10,$09
defb $15,$0A
defb $00,$0A
defb $25,$0B
defb $30,$0A
defb $35,$0A
defb $80,$09
defb $00,$81
defb $10,$06
defb $15,$07
defb $00,$07
defb $25,$08
defb $30,$07
defb $35,$07
defb $80,$05
defb $00,$81
defb $B0,$0E
defb $db,$0E
defb $43,$1C
defb $84,$1C
defb $00,$2E
defb $00,$3E
defb $B0,$0D
defb $db,$0D
defb $43,$1E
defb $84,$1E
defb $00,$2D
defb $00,$3D
defb $05,$4D
defb $B0,$0B
defb $db,$0B
defb $43,$1C
defb $84,$1C
defb $00,$2B
defb $00,$3B
defb $05,$48
defb $50,$58
defb $B0,$07
defb $db,$07
defb $43,$18
defb $84,$18
defb $00,$27
defb $00,$37
defb $05,$46
defb $50,$56
defb $B0,$05
defb $db,$05
defb $43,$16
defb $84,$16
defb $00,$25
defb $00,$34
defb $05,$44
defb $50,$53
defb $B0,$04
defb $db,$04
defb $43,$15
defb $84,$15
defb $00,$24
defb $00,$33
defb $05,$42
defb $50,$51
defb $B0,$03
defb $db,$03
defb $43,$14
defb $84,$14
defb $00,$23
defb $00,$33
defb $05,$42
defb $50,$51
defb $FF

;abre capsula

ABRE_CAPSULA:

defb $C3,$0D
defb $B8,$0A
defb $C6,$0A
defb $7C,$07
defb $0F,$04
defb $09,$04
defb $18,$0B
defb $08,$07
defb $0F,$0B
defb $09,$0C
defb $18,$0A
defb $08,$09
defb $0F,$08
defb $09,$09
defb $18,$06
defb $08,$05
defb $FF

;daño

DANO:

defb $C3,$0D
defb $08,$0A
defb $46,$0A
defb $2C,$07
defb $0F,$04
defb $09,$04
defb $18,$0B
defb $08,$07
defb $FF

;disparo doble

DISPARO_DOBLE:

defb $3A,$0C
defb $29,$0B
defb $22,$0A
defb $2B,$0A
defb $39,$09
defb $52,$09
defb $69,$08
defb $80,$07
defb $A7,$07
defb $D7,$06
defb $FF

;tecla inercia

TECLA_INERCIA:

defb $33,$0D
defb $13,$0D
defb $77,$0B
defb $33,$0C
defb $13,$0B
defb $77,$0B
defb $97,$0A
defb $33,$0A
defb $13,$09
defb $77,$09
defb $97,$08
defb $33,$09
defb $13,$08
defb $77,$07
defb $97,$06
defb $33,$07
defb $13,$06
defb $77,$06
defb $97,$05
defb $33,$06
defb $13,$05
defb $77,$05
defb $97,$04
defb $FF


;capsula recogida

CAPSULA_RECOGIDA:

defb $50,$0B
defb $C0,$0D
defb $50,$0E
defb $40,$0F
defb $40,$0D
defb $20,$0C
defb $40,$0B
defb $20,$0A
defb $A0,$09
defb $20,$0A
defb $A0,$0B
defb $20,$0B
defb $20,$0A
defb $10,$08
defb $20,$06
defb $10,$05
defb $A0,$04
defb $20,$06
defb $A0,$05
defb $20,$04
defb $20,$04
defb $10,$03
defb $20,$03
defb $10,$02
defb $FF

;disparo simple

DISPARO_SIMPLE:

defb $27,$0C
defb $1C,$0B
defb $22,$0A
defb $2B,$0A
defb $39,$09
defb $52,$09
defb $69,$08
defb $80,$07
defb $A7,$07
defb $D7,$06
defb $FF


;start!!!

JUEGO_START:

defb $97,$0A
defb $77,$0C
defb $33,$0D
defb $10,$0C
defb $97,$0B
defb $77,$0C
defb $33,$0C
defb $13,$0A
defb $87,$09
defb $67,$09
defb $23,$08
defb $77,$09
defb $57,$08
defb $25,$07
defb $10,$06
defb $67,$07
defb $47,$06
defb $13,$06
defb $08,$05
defb $67,$06
defb $47,$05
defb $13,$05
defb $08,$04
defb $77,$07
defb $47,$06
defb $13,$05
defb $10,$04
defb $57,$05
defb $37,$04
defb $13,$04
defb $08,$03
defb $47,$04
defb $27,$03
defb $13,$02
defb $08,$02
defb $57,$04
defb $37,$03
defb $13,$03
defb $08,$03
defb $47,$02
defb $27,$02
defb $13,$01
defb $08,$01
defb $FF

;disparo triple

DISPARO_TRIPLE:

defb $4F,$0B
defb $1B,$0B
defb $65,$0C
defb $1A,$0B
defb $74,$0C
defb $60,$0B
defb $85,$0B
defb $A1,$0A
defb $C7,$09
defb $54,$17
defb $FF

;EXPLOSION SENCILLA ORGANICA

EXPLOSION_SENCILLA_ORGANICA:

defb $80,$0E
defb $25,$0D
defb $00,$0D
defb $55,$0D
defb $60,$0D
defb $65,$0C
defb $C0,$0C
defb $00,$81
defb $30,$09
defb $35,$0A
defb $00,$0A
defb $45,$0B
defb $40,$0A
defb $55,$0A
defb $B0,$09
defb $00,$81
defb $20,$06
defb $25,$07
defb $00,$07
defb $FF

LASER:
  
defb $85,$0A
defb $60,$1B
defb $00,$1C
defb $00,$2C
defb $00,$1B
defb $00,$2B
defb $00,$1B
defb $00,$2B
defb $00,$1B
defb $00,$2A
defb $00,$19
  defb $FF

SCORE:
  
defb $25,$0D
defb $18,$0C
defb $36,$0B
defb $1A,$0B
defb $40,$0B
defb $1C,$0A
defb $38,$0D
defb $1E,$0C
defb $20,$0C
defb $28,$0D
defb $27,$0D
defb $28,$0F
defb $27,$0E
defb $38,$0D
defb $37,$0B
defb $38,$0A
defb $37,$09
defb $28,$08
defb $37,$08
defb $38,$07
defb $37,$0B
defb $38,$0A
defb $47,$09
defb $48,$07
defb $37,$06
defb $37,$05
defb $37,$05
defb $37,$07
defb $38,$07
defb $27,$06
defb $28,$06
defb $27,$05
  defb $FF
  
DISPARO_MULTI:

defb $20,$0B
defb $90,$0C
defb $20,$2C
defb $20,$3C
defb $20,$4B
defb $20,$1B
defb $20,$1B
defb $20,$3A
defb $20,$49
defb $20,$17
defb $20,$15
defb $B0,$18
defb $20,$36
defb $FF

DISPARO_HOMMING:

defb $20,$0B
defb $80,$0C
defb $20,$1C
defb $00,$2B
defb $00,$3A
defb $20,$1A
defb $80,$0A
defb $70,$09
defb $60,$08
defb $50,$07
defb $40,$07
defb $30,$06
defb $20,$05
defb $FF

