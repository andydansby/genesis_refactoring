SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin

cd codemaps
	del objects.o
cd ..

cls

echo on

cd images
apack c credits_bkg.scr credits_bkg.bin
apack c genesis_title.scr genesis_title.bin
apack c title_hiscores.scr title_hiscores.bin

move "credits_bkg.bin" "..\"
move "genesis_title.bin" "..\"
move "title_hiscores.bin" "..\"

cd ..

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram6.lst

zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc



rem cleanup
rem echo off
move "compiled.map" "codemaps\"
move "objects.o" "codemaps\"

move "compiled_BANK_06.bin" "binary\"
move "compiled_CODE.bin" "binary\"

del compiled.tmp
del zcc_opt.def
del zcc_proj.lst

del credits_bkg.bin
del genesis_title.bin
del title_hiscores.bin

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..