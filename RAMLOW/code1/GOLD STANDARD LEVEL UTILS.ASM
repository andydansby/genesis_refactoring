;;gold standard
;;same as _load_levelpart3
;;new ver. 60f1
$61FA	LD DE, $A000
$61FD	LD HL, ($7648)
$6200	CALL $60BC; (_depack)
;.......................
;;OK to this point

;;troubleshoot_1_start
;; new ver. 60f4-6105
;;level_pointer=(unsigned int*)enemy_address[level];
$6203	LD HL, $75AF
$6206	PUSH HL
$6207	LD HL, $0004
$620A	ADD HL, SP
$620B	LD L, (HL)
$620C	LD H, $00
$620E	ADD HL, HL
$620F	POP DE
$6210	ADD HL, DE
$6211	CALL $7245; WTH
$6214	LD ($7648), HL
;;GS
;;#7648 now holds level_pointer
;;hl = C65E <--
;;new 6105 -	HL = c65e

;;troubleshoot_2_start
;; new ver. 6108-610e
;;dummy_i = *level_pointer;
$6217	LD L, (HL)
$6218	LD H, $00
$621A	LD ($764D), HL
;;GS
;; 764D now holds dummy_i
;;hl = C65E <-- D
;;new 610e - 	HL = #050e <--- WRONGo
;; if it were just E (14 it would be ok)


;;troubleshoot_3_start
;; new ver. 6111-611a
;;level_pointer++;
$621D	LD HL, ($7648)
$6220	INC HL
$6221	LD ($7648), HL
;;GS
;; $7648 now holds level_pointer
;;hl = C65E <--
;;new 6111 -	HL = c65e

;;troubleshoot_4_start
;; new ver 611b
;;dummy_i *= sizeof (struct Enemy);
$6224	LD HL, ($764D)
$6227	ADD HL, HL
$6228	ADD HL, HL
$6229	ADD HL, HL
$622A	LD ($764D), HL
;;GS
;; $764D now holds dummy_i
;;hl = C65E <-- D

;...
;same as _load_levelpart4
;;troubleshoot_5_start
;; new ver. call to 6627
$622D	LD DE, $76C4
$6230	LD HL, ($7648)
$6233	LD BC, ($764D)
$6237	LDIR