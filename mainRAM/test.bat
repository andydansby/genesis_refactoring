
@REM used for build of low memory only

SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

cd codemaps
	del objects.o
cd ..

echo off
rem ram3.bin: ram3.asm background.bin
rem	pasmo ram3.asm ram3.bin ram3.sym

rem background.bin: background.scr
rem apack background.scr background.bin

cd supportCode
rem apack c background.scr background.bin
rem move "background.bin" "..\"
copy "movement.c" "..\"
copy "movement.h" "..\"
copy "structs.h" "..\"
copy "behav.asm" "..\"
copy "behavior.c" "..\"
copy "behavior.h" "..\"
copy "constants.h" "..\"
copy "sprdefs.h" "..\"
copy "engine.h" "..\"
copy "engine.asm" "..\"
copy "drawmap.asm"  "..\"
copy "drawsprite.asm" "..\"
copy "input.asm" "..\"
copy "variables.h" "..\"
copy "loadBackground.asm" "..\"
copy "LoadSprBlock.asm" "..\"
copy "LoadLevel.asm" "..\"
copy "create_shifted_tables.asm"  "..\"
copy "im2.asm" "..\"
copy "starfield.asm" "..\"
cd ..

cd banks
	copy "ram99.o" "..\"
cd ..

cls
echo on

rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst


rem build as an object file
zcc +zx -v -c -clib=new --fsigned-char -o objects @main.lst

rem build as a binary
rem zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


rem tester
zcc +zx -v -m -clib=new ram99.o -o compiled.tmp -pragma-include:zpragma.inc @main.lst


rem cleanup
echo off






move "compiled.map" "codemaps\"


rem move "compiled_BANK_03.bin" "binary\"
move "compiled_CODE.bin" "binary\"
 


z80nm objects.o



echo off


del "movement.c"
del "movement.h"
del "structs.h"
del "behav.asm"
del "behavior.c"
del "behavior.h"
del "constants.h"
del "sprdefs.h"
del "engine.h"
del "engine.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "input.asm"
del "variables.h"
del "loadBackground.asm"
del "LoadSprBlock.asm"
del "LoadLevel.asm"
del "create_shifted_tables.asm"
del "im2.asm"
del "starfield.asm"