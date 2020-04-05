SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
	del objects.o
cd ..

cls

echo off
cd supportCode
	copy "create_shifted_tables.asm" "..\"
	copy "drawmap.asm" "..\"
	copy "drawsprite.asm" "..\"
	copy "engine.asm" "..\"
rem	copy "im2.asm" "..\"
	copy "input.asm" "..\"
	copy "rambanks.asm" "..\"
	
	copy "engine.h" "..\"
	copy "structs.h" "..\"
	copy "movement.h" "..\"
	copy "constants.h" "..\"
	copy "variables.h" "..\"
	copy "utils.h" "..\"
	copy "playercontrols.h" "..\"
	copy "wyzplayer.h" "..\"
	copy "levelutils.h" "..\"
	copy "externs.h" "..\"
	
	copy "graphicutils.h" "..\"
	copy "collision.h" "..\"
	copy "displayloop.h" "..\"
	
	copy "mainmenu.h" "..\"
	
	
rem some of these might do better in low ram
cd ..

cls
echo on

rem this creates an object file
REM not used for anything other than creating a map
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramMain.lst




zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem pause

if exist objects.o (
rem file exists
) else (
exit /b
REM ERROR IN COMPILING
)

echo off

copy "objects.o" "uncontended.o"
move "uncontended.o" "..\"
move "objects.o" "codemaps\"
move "compiled.map" "codemaps\"

rem move "compiled_CODE.bin"  "codemaps\"
rem move "compiled_BANK_00.bin" "codemaps\"

rem del zcc_opt.def
rem del zcc_proj.lst




rem move "compiled_CONTENDED.bin" "BIN\"

rem pause



del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
rem del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "engine.h"
del "structs.h"
del "movement.h"
del "constants.h"
del "variables.h"
del "utils.h"
del "playercontrols.h"
del "wyzplayer.h"
del "levelutils.h"
del "graphicutils.h"
del "collision.h"
del "displayloop.h"
del "externs.h"

del "mainmenu.h"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > output.txt
	echo off
cd ..

echo on


copy "compiled_BANK_00.bin" "BIN\"
copy "compiled_BANK_01.bin" "BIN\"
copy "compiled_BANK_03.bin" "BIN\"
copy "compiled_BANK_04.bin" "BIN\"
copy "compiled_BANK_06.bin" "BIN\"
copy "compiled_CODE.bin" "BIN\"
copy "compiled_CONTENDED.bin" "BIN\"

move "compiled_BANK_00.bin" "..\RAMMAGIC\"
move "compiled_BANK_01.bin" "..\RAMMAGIC\"
move "compiled_BANK_03.bin" "..\RAMMAGIC\"
move "compiled_BANK_04.bin" "..\RAMMAGIC\"
move "compiled_BANK_06.bin" "..\RAMMAGIC\"
move "compiled_CODE.bin" 	"..\RAMMAGIC\"
move "compiled_CONTENDED.bin" "..\RAMMAGIC\"

cd ..
cd rammagic
	call abracadabra.bat
cd ..
cd ramMain


