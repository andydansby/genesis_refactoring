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


echo on

rem CREATE MAP
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramMain.lst




REM C COMPILE
zcc +zx -v -m -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst



GOTO bye
@REM zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst


echo off
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

rem exit batch file but not close CMD
:bye
exit /b
