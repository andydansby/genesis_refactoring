SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram1.lst

zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


z80nm objects.o
@REM all these objects match up

rem cleanup
move "compiled.map" "codemaps\"
move "objects.o" "codemaps\"

move "compiled_BANK_01.bin" "binary\"
move "compiled_CODE.bin" "binary\"
 
del compiled.tmp
del zcc_opt.def
del zcc_proj.lst

cd codemaps
	echo on
	z80nm objects.o
	echo off
cd ..

