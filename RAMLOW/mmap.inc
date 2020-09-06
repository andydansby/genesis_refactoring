;; Genesis Engine Custom memory map
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; memory model
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; include zx spectrum target defines

;INCLUDE "config_zx_private.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sections defined by Genesis
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION BANK_00
org 0xc000		;;//	49152

SECTION BANK_01
org 0xc000		;;//	49152

SECTION BANK_03
org 0xc000		;;//	49152

SECTION BANK_04
org 0xc000		;;//	49152

SECTION BANK_06
org 0xc000		;;//	49152

;;-------------------------------------

;;// ORIGINAL game is 24600 as start $6018
;;//SECTION CONTENDED
;;//org 0x5ED0		0x5F1E
SECTION CONTENDED
org 0x5F40		;;//	24384


SECTION LOW_CODE_END
org 0x7fff		;;//	32767

;;-------------------------------------
SECTION IM2_TABLE
org 0x8000		;;//	32768
;;//0x101 long
;;//IM_MATRIX

SECTION UNCONTENDED
org 0x8102		;;//	33026
;;need to be reworked

SECTION ISR_ROUTINE
org 0x8a2b		;;//	35371
;;//need to be reworked

SECTION LRU_prev_Section
org 0x8a00		;;//	35328

SECTION IM2_ISR_address
org 0x8a8a		;;//	35466
;;need to be reworked

SECTION LRU_next_Section
org 0x8b00		;;//	35584

SECTION SPRITE_CACHE
org 0x8C00		;;//	35840
;;need to be reworked




SECTION Level_Sprites
org 0x9000		;;//	36864

SECTION UNCONTENDED_MAPSTART
org 0xa000		;;//	40960
;;matches original

SECTION UNCONTENDED_TABLATILES
org 0xb000		;;//	45056
;;matches original









;;-------------------------------------



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;SECTION data_user
;;INCLUDEs are at the bottom

;SECTION code_user
; code_user is for read-only code

;SECTION bss_user
; bss_user is for zeroed ram variables

;SECTION data_user
; data_user is for initially non-zero ram variables

;SECTION smc_user
; smc_user is for self-modifying code

;SECTION rodata_user
; rodata_user is for constant data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION CODE
org __crt_org_code






section code_crt_init
section code_crt_main
section code_crt_exit
section code_crt_return
section code_crt_common

section code_driver
section code_font
section code_clib
  include "../../clib_code.inc"
section code_lib
section code_compiler
section code_user

section rodata_driver
section rodata_font
section rodata_clib
  include "../../clib_rodata.inc"
  ;;section rodata_error_strings
  ;;section rodata_error_string_end
  ;;defb 0
section rodata_lib
section rodata_compiler
section rodata_user

SECTION CODE_END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION DATA

IF __crt_org_data

   org __crt_org_data

ELSE

   IF __crt_model
      
      "DATA section address must be specified for rom models"
   
   ENDIF

ENDIF

defb 0

section smc_driver
section smc_font
section smc_clib
  include "../../clib_smc.inc"
section smc_lib
section smc_compiler
section smc_user

section data_driver
section data_font
section data_clib
  include "../../clib_data.inc"
  ;;section data_fcntl_stdio_heap_head
  ;;section data_fcntl_stdio_heap_body
  ;;section data_fcntl_stdio_heap_tail
  ;;section data_fcntl_fdtable_body
section data_lib
section data_compiler
section data_user

SECTION DATA_END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION BSS

IF __crt_org_bss

   org __crt_org_bss

ELSE

   IF __crt_model

      org -1

   ENDIF

ENDIF

defb 0

section BSS_UNINITIALIZED

section bss_driver
section bss_font
section bss_clib
  include "../../clib_bss.inc"
section bss_lib
section bss_compiler
section bss_user

SECTION BSS_END

;; end memory model ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

















