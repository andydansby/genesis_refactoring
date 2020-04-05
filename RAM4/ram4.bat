SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

echo off

cd codemaps
	del objects.o
cd ..

cd game_maps
@rem	copy "level1.map" "..\"
@rem	copy "level2.map" "..\"
@rem	copy "level3.map" "..\"
apack c level1.map level1map.bin
apack c level2.map level2map.bin
apack c level3.map level3map.bin

move "level1map.bin" "..\"
move "level2map.bin" "..\"
move "level3map.bin" "..\"
cd ..

echo on

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram4.lst

echo off
rem cleanup

copy "objects.o" "ram4.o"
move "ram4.o" "..\"
move "objects.o" "codemaps\"

del zcc_opt.def
del zcc_proj.lst


del "level1map.bin"
del "level2map.bin"
del "level3map.bin"
	

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ram4.txt
	copy "ram4.txt" "..\"
	echo off
cd ..
