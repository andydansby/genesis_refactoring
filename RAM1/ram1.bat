SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin

cd codemaps
	del objects.o
cd ..

cls

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram1.lst


copy "objects.o" "ram1.o"
move "ram1.o" "..\"
move "objects.o" "codemaps\"

rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

del zcc_opt.def
rem del zcc_proj.lst




cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ram1.txt
	copy "ram1.txt" "..\"
	echo off
cd ..

