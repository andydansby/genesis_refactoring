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

appmake +zx -b compiled_IM_MATRIX.bin -o IM_MATRIX.tap --org 40448 --noloader --blockname IM

appmake +zx -b compiled_UNCONTENDED_MAPSTART.bin -o UNCONTENDED_MAPSTART.tap --org 40960 --noloader --blockname MAPSTART

appmake +zx -b compiled_UNCONTENDED_TABLATILES.bin -o UNCONTENDED_TABLATILES.tap --org 45056 --noloader --blockname TABLATILES


REM compiled_CODE.bin should include the CRT C Run Time

appmake +zx -b compiled_CODE.bin -o contended.tap --org 24250 --noloader --blockname contended
@REM OK





rem UNcontended above 32768




@rem appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01

@rem appmake +zx -b compiled_CODE.bin -o lowRAM.tap --org 24450 --noloader --blockname lowRAM

copy /b loader.tap + bank00.tap + bank01.tap + bank03.tap + bank04.tap + bank06.tap + uncontended.tap + ISR_ROUTINE.tap + IM_MATRIX.tap + UNCONTENDED_MAPSTART.tap + UNCONTENDED_TABLATILES.tap + contended.tap  1output.tap



