SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on

rem a little cleanup first

cd codemaps
	del objects.o
cd ..


cd images
	apack c alien.scr 			alien.bin
	apack c background.scr		background.bin
	apack c gameend.scr 		gameend.bin
	apack c gameover.scr		gameover.bin
	apack c ship_pieces.scr		ship_pieces.bin
	apack c alienattr.att		alienattr.bin
	apack c gameend.att			endattr.bin
	move "*.bin" "..\"
cd ..


zcc +zx -v -c -clib=new --fsigned-char -o objects @ram3.lst


rem cleanup
echo off

move "objects.o" "codemaps\"

rem move "compiled_BANK_03.bin" "binary\"
rem move "compiled_CODE.bin" "binary\"
 

del zcc_opt.def
del zcc_proj.lst

del alien.bin
del background.bin
del gameend.bin
del gameover.bin
del ship_pieces.bin
del endattr.bin
del alienattr.bin

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..

