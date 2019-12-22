SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on


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



rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram3.lst

zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


rem cleanup
echo off
move "compiled.map" "codemaps\"
move "objects.o" "codemaps\"

move "compiled_BANK_03.bin" "binary\"
move "compiled_CODE.bin" "binary\"
 
del compiled.tmp
del zcc_opt.def
del zcc_proj.lst

del alien.bin
del background.bin
del gameend.bin
del gameover.bin
del ship_pieces.bin
del endattr.bin

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..

