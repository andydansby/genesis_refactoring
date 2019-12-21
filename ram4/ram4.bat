SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on

cd gamelevels
	copy "levels.asm" "..\"
	copy "level1.map" "..\"
	copy "level2.map" "..\"
	copy "level3.map" "..\"
	copy "level4.map" "..\"	
	copy "level5.map" "..\"
	copy "level6.map" "..\"
	copy "level7.map" "..\"
	
	copy "level1_enemies.asm" "..\"
	copy "level2_enemies.asm" "..\"
	copy "level3_enemies.asm" "..\"
	copy "level4_enemies.asm" "..\"
	copy "level5_enemies.asm" "..\"
	copy "level6_enemies.asm" "..\"
	copy "level7_enemies.asm" "..\"
cd ..

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram4.lst

zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


@rem ram4.bin: levels.asm level1.map level2.map level3.map level4.map level5.map level6.map level7.map level1_enemies.asm level2_enemies.asm level3_enemies.asm level4_enemies.asm level5_enemies.asm level6_enemies.asm level7_enemies.asm
@rem 	pasmo levels.asm ram4.bin levels.sym


echo off

move "compiled.map" "codemaps\"
move "objects.o" "codemaps\"

move "compiled_BANK_04.bin" "binary\"
move "compiled_CODE.bin" "binary\"

del compiled.tmp
del zcc_opt.def
del zcc_proj.lst

rem cleanup
	del "levels.asm"
	del "level1.map"
	del "level2.map"
	del "level3.map"
	del "level4.map"	
	del "level5.map"
	del "level6.map"
	del "level7.map"
	
	del "level1_enemies.asm"
	del "level2_enemies.asm"
	del "level3_enemies.asm"
	del "level4_enemies.asm"
	del "level5_enemies.asm"
	del "level6_enemies.asm"
	del "level7_enemies.asm"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	echo off
cd ..