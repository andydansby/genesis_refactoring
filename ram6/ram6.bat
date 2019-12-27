SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin

rem ram6.bin: menu.asm genesis_title.bin title_hiscores.bin credits_bkg.bin move.asm behav.asm maindefs.asm
rem 	pasmo menu.asm menu.bin menu.sym
rem 	pasmo move.asm move.bin move.sym
rem 	pasmo behav.asm behav.bin behav.sym
rem 	copy /b menu.bin+move.bin+behav.bin  ram6.bin
	
cls

echo on

rem a little cleanup first

cd codemaps
	del objects.o
cd ..

cd images
	apack c credits_bkg.scr credits_bkg.bin
	apack c genesis_title.scr genesis_title.bin
	apack c title_hiscores.scr title_hiscores.bin

	move "credits_bkg.bin" "..\"
	move "genesis_title.bin" "..\"
	move "title_hiscores.bin" "..\"
cd ..

cd supportcode
	copy "menu.asm" "..\"
	copy "move.asm" "..\"
	copy "behav.asm" "..\"
	copy "maindefs.asm" "..\"
cd ..



zcc +zx -v -c -clib=new --fsigned-char -o objects @ram6.lst

@rem zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc



rem cleanup
 echo off
move "objects.o" "codemaps\"

rem move "compiled_BANK_06.bin" "binary\"
rem move "compiled_CODE.bin" "binary\"

del zcc_opt.def
del zcc_proj.lst

del credits_bkg.bin
del genesis_title.bin
del title_hiscores.bin

@rem -----------------
del "menu.asm"
del "move.asm"
del "behav.asm"
del "maindefs.asm"


cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..