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

REM compiled_CODE.bin should include the CRT C Run Time

appmake +zx -b compiled_CODE.bin -o contended.tap --org 24600 --noloader --blockname uncontended
@REM OK



rem UNcontended above 32768




@rem appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank01

@rem appmake +zx -b compiled_CODE.bin -o lowRAM.tap --org 24450 --noloader --blockname lowRAM

copy /b loader.tap + bank00.tap + bank01.tap + bank03.tap + bank04.tap + bank06.tap + uncontended.tap + contended.tap  1output.tap