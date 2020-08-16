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

appmake +zx -b compiled_UNCONTENDED.bin -o uncontended.tap --org 32768 --noloader --blockname uncontended

appmake +zx -b compiled_ISR_ROUTINE.bin -o ISR_ROUTINE.tap --org 40192 --noloader --blockname ISR

appmake +zx -b compiled_IM2_ISR_address.bin -o IM2-ISR.tap --org 40349 --noloader --blockname IM2-ISR

appmake +zx -b compiled_IM_MATRIX.bin -o IM_MATRIX.tap --org 40448 --noloader --blockname IMmatric

appmake +zx -b compiled_UNCONTENDED_MAPSTART.bin -o MAPSTART.tap --org 40960 --noloader --blockname MAPSTART

appmake +zx -b compiled_UNCONTENDED_TABLATILES.bin -o TABLATILES.tap --org 45056 --noloader --blockname TABLATILES


REM compiled_CODE.bin should include the CRT C Run Time

appmake +zx -b compiled_CODE.bin -o contended.tap --org 24272 --noloader --blockname contended
@REM OK

@REM 24249 = 5EB9
@REM 24250 = 5EBA

@REM 24270 = 5ECE
@REM 24272 = 5ED0





rem UNcontended above 32768




@rem appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01

@rem appmake +zx -b compiled_CODE.bin -o lowRAM.tap --org 24450 --noloader --blockname lowRAM

copy /b loader.tap + bank00.tap + bank01.tap + bank03.tap + bank04.tap + bank06.tap + uncontended.tap + ISR_ROUTINE.tap + IM2-ISR.tap + IM_MATRIX.tap + MAPSTART.tap + TABLATILES.tap + contended.tap  1output.tap


call cleanup.bat
