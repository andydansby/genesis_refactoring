SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin

cd codemaps
	del objects.o
cd ..

cls
echo on

cd images
	apack c background.scr background.bin
	move "background.bin" "..\"
cd ..

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram3.lst

echo off
rem cleanup

copy "objects.o" "ram3.o"
move "ram3.o" "..\"
move "objects.o" "codemaps\"

rem move "compiled_BANK_03.bin" "binary\"
rem move "compiled_CODE.bin" "binary\"

del zcc_opt.def
del zcc_proj.lst


del "background.bin"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ram3.txt
	copy "ram3.txt" "..\"
	echo off
cd ..



rem move "ram3.sym" "..\"
rem move "ram3.bin" "..\"

rem ram3.bin: ram3.asm background.bin	
rem pasmo ram3.asm ram3.bin ram3.sym
rem background.bin: background.scr
rem	apack background.scr background.bin
	
	
	