SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on
rem ram3.bin: ram3.asm background.bin
rem	pasmo ram3.asm ram3.bin ram3.sym

rem background.bin: background.scr
rem apack background.scr background.bin

cd images
apack c background.scr background.bin
move "background.bin" "..\"

cd ..



rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram3.lst

zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


rem cleanup
rem echo off
move "compiled.map" "codemaps\"
move "objects.o" "codemaps\"

move "compiled_BANK_03.bin" "binary\"
move "compiled_CODE.bin" "binary\"
 
del compiled.tmp
del zcc_opt.def
del zcc_proj.lst

del background.bin

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..

