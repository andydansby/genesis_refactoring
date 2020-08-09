echo off

SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
	del objects.o
cd ..


cd songs
	copy "parasol.mus.bin" "..\"
	copy "genesis_gangway.mus.bin" "..\"
	copy "genesis_fin.mus.bin" "..\"
	copy "Genesis_warrior.mus.bin" "..\"
	copy "genesis_jeff2.mus.bin" "..\"
	copy "genesis_line.mus.bin" "..\"
	copy "genesis_compote.mus.bin" "..\"
	copy "genesis_alice.mus.bin" "..\"
	copy "genesis_homage.mus.bin" "..\"
	copy "Genesis_equinox_v2.mus.bin" "..\"
	copy "genesis_microint.mus.bin" "..\"
	copy "genesis_words.mus.bin" "..\"
	copy "genesis_town.mus.bin" "..\"
	copy "genesis_hoc.mus.bin" "..\"
	copy "parasol_a.mus.asm" "..\"
cd ..

rem cd proplay
rem	copy "genesis_sfx.asm" "..\"
rem	copy "ProPlay37a.asm" "..\"
rem	copy "ProPlay37a_intro.asm" "..\"
rem cd ..

cd wyzplayer
	copy "genesis_sfx.asm" "..\"
	copy "wyzplayer.asm" "..\"
	copy "ProPlay37a_intro.asm" "..\"
	copy "apack.asm" "..\"
	copy "variables.asm" "..\"
cd ..

cls

echo on


zcc +zx -v -c -clib=new --fsigned-char -o objects @ram0.lst

rem zcc +zx -v -m -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc

rem troubleshooting compile
REM zcc +zx -v -c -clib=new -no-cleanup --fsigned-char -o objects @ram0.lst

echo off

copy "objects.o" "ram0.o"
move "ram0.o" "..\"
move "objects.o" "codemaps\"


rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

del zcc_opt.def
rem del zcc_proj.lst

del "parasol.mus.bin"
del "genesis_gangway.mus.bin"
del "genesis_fin.mus.bin"
del "Genesis_warrior.mus.bin"
del "genesis_jeff2.mus.bin"
del "genesis_line.mus.bin"
del "genesis_compote.mus.bin"
del "genesis_alice.mus.bin"
del "genesis_homage.mus.bin"
del "Genesis_equinox_v2.mus.bin"
del "genesis_microint.mus.bin"
del "genesis_words.mus.bin"
del "genesis_town.mus.bin"
del "genesis_hoc.mus.bin"
del "parasol_a.mus.asm"

del "genesis_sfx.asm"
del "wyzplayer.asm"
del "ProPlay37a_intro.asm"
del "apack.asm"
del "variables.asm"


cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ram0.txt
	copy "ram0.txt" "..\"
	echo off
cd ..



rem move "ram3.sym" "..\"
rem move "ram3.bin" "..\"

rem ram3.bin: ram3.asm background.bin	
rem pasmo ram3.asm ram3.bin ram3.sym
rem background.bin: background.scr
rem	apack background.scr background.bin
	

rem apack c background.scr background.bin
rem pasmo ram3.asm ram3.bin ram3.sym


	