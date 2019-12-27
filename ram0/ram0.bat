SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on

rem a little cleanup first

cd codemaps
	del objects.o
cd ..



cd songs
	copy "genesis_alice.mus.bin" "..\"
	copy "genesis_compote.mus.bin" "..\"
	copy "Genesis_equinox_v2.mus.bin" "..\"
	copy "genesis_fin.mus.bin" "..\"
	copy "genesis_gangway.mus.bin" "..\"
	copy "genesis_homage.mus.bin" "..\"
	copy "genesis_jeff2.mus.bin" "..\"
	copy "genesis_line.mus.bin" "..\"
	copy "genesis_microint.mus.bin" "..\"
	copy "genesis_town.mus.bin" "..\"	
	copy "Genesis_warrior.mus.bin" "..\"	
	copy "genesis_words.mus.bin" "..\"	
	copy "parasol.mus.bin" "..\"
	copy "genesis_hoc.mus.bin" "..\"
	copy "parasol_a.mus.asm" "..\"
cd ..

cd wyzplayer
	copy "ProPlay37a.asm" "..\"
	copy "genesis_sfx.asm" "..\"
cd ..

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram0.lst
rem just make the object file



echo off
rem cleanup

move "objects.o" "codemaps\"

rem move "compiled_BANK_00.bin" "binary\"
rem move "compiled_CODE.bin" "binary\"


del zcc_opt.def
del zcc_proj.lst


	del "genesis_alice.mus.bin"
	del "genesis_compote.mus.bin"
	del "Genesis_equinox_v2.mus.bin"
	del "genesis_fin.mus.bin"
	del "genesis_gangway.mus.bin"
	del "genesis_homage.mus.bin"
	del "genesis_jeff2.mus.bin"
	del "genesis_line.mus.bin"
	del "genesis_microint.mus.bin"
	del "genesis_town.mus.bin"
	del "Genesis_warrior.mus.bin"
	del "genesis_words.mus.bin"
	del "parasol.mus.bin"
	del "parasol_a.mus.asm"
	del "genesis_hoc.mus.bin"
	del "ProPlay37a.asm"
	del "genesis_sfx.asm"

cd codemaps
	echo on
	@REM all these objects match up
 	z80nm objects.o
 	echo off
cd ..