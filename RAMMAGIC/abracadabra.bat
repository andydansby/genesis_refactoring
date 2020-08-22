SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

appmake +zx -b compiled_BANK_00.bin -o bank00.tap --org 49152 --noloader --blockname bank00
@REM OK

appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01
@REM OK

appmake +zx -b compiled_BANK_03.bin -o bank03.tap --org 49152 --noloader --blockname bank03
@REM OK

appmake +zx -b compiled_BANK_04.bin -o bank04.tap --org 49152 --noloader --blockname bank04
@REM OK

appmake +zx -b compiled_BANK_06.bin -o bank06.tap --org 49152 --noloader --blockname bank06
@REM OK


@REM  THIS SECTION NEEDS TO BE REEVALUATED

@REM	we want the matrix to be here at 32768
appmake +zx -b compiled_IM2_TABLE.bin -o IM2_TABLE.tap --org 32768 --noloader --blockname IM2_TABLE
REM $8000	32768	IM2 TABLE


@REM -------------------------------------------------

appmake +zx -b compiled_UNCONTENDED.bin -o uncontended.tap --org 33026 --noloader --blockname uncontended
REM $8102	33026	ENGINE CODE

appmake +zx -b compiled_LRU_prev_Section.bin -o LRUprev.tap --org 35328 --noloader --blockname LRUprev
REM $8A00	35328	LRUprev


appmake +zx -b compiled_ISR_ROUTINE.bin -o ISR_ROUTINE.tap --org 35371 --noloader --blockname ISR
REM $8A2B	35371	IM.asm


@REM -------------------------------------------------
appmake +zx -b compiled_IM2_ISR_address.bin -o IM2_ISR.tap --org 35466 --noloader --blockname IM2_ISR
REM $8A8A	35466	im2.asm
REM $9D9D	want $8a8a		im2.asm



appmake +zx -b compiled_LRU_next_Section.bin -o LRUnext.tap --org 35584 --noloader --blockname LRUnext
REM $8B00	35584	LRUnext

@REM ------------------------------------------

appmake +zx -b compiled_SPRITE_CACHE.bin -o SPRITE_CACHE.tap --org 35840 --noloader --blockname SPRITE_CACHE
REM $8C00	35840

appmake +zx -b compiled_Level_Sprites.bin -o LEVELSPRITES.tap --org 36864 --noloader --blockname LEVELSPRITES
REM $9000	36864

appmake +zx -b compiled_UNCONTENDED_MAPSTART.bin -o MAPSTART.tap --org 40960 --noloader --blockname MAPSTART
REM $A000	40960

appmake +zx -b compiled_UNCONTENDED_TABLATILES.bin -o TABLATILES.tap --org 45056 --noloader --blockname TABLATILES
REM $B000	45056

REM compiled_CODE.bin should include the CRT C Run Time

appmake +zx -b compiled_CODE.bin -o contended.tap --org 24384 --noloader --blockname contended

@REM appmake +zx -b compiled_CODE.bin -o contended.tap --org 24272 --noloader --blockname contended
@REM OK

@REM 24249 = 5EB9
@REM 24250 = 5EBA

@REM 24270 = 5ECE
@REM 24272 = 5ED0





rem UNcontended above 32768




@rem appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01

@rem appmake +zx -b compiled_CODE.bin -o lowRAM.tap --org 24450 --noloader --blockname lowRAM

copy /b loader.tap + bank00.tap + bank01.tap + bank03.tap + bank04.tap + bank06.tap + IM2_TABLE.tap + uncontended.tap + LRUprev.tap + ISR_ROUTINE.tap +  IM2_ISR.tap + LRUnext.tap + SPRITE_CACHE.tap + LEVELSPRITES.tap + MAPSTART.tap + TABLATILES.tap + contended.tap  1output.tap


rem call cleanup.bat
