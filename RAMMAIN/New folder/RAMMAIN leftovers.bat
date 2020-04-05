cd supportCode
	copy "create_shifted_tables.asm" "..\"
	copy "drawmap.asm" "..\"
	copy "drawsprite.asm" "..\"
	copy "engine.asm" "..\"
	rem	copy "im2.asm" "..\"
	copy "input.asm" "..\"
	copy "rambanks.asm" "..\"
	copy "displayloop.asm" "..\"
	copy "clearMapArea.asm" "..\"
	copy "drawGameMap.asm" "..\"
	copy "levelutils.asm" "..\"
	
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




REM
rem normal compile
zcc +zx -vn -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

IF NOT EXIST "objects.o" (
GOTO error
)



IF NOT EXIST "compiled.map" (
GOTO error
)


echo on

copy "objects.o" "uncontended.o"
move "uncontended.o" "..\"
move "objects.o" "codemaps\"
copy "compiled.map" "..\"
REM will finish move in all.bat
move "compiled.map" "codemaps\"


cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > output.txt
@REM	echo off
cd ..



REM START ERROR CHECKING
if not exist "compiled_BANK_00.bin" (
GOTO error
)

if not exist "compiled_BANK_01.bin" (
GOTO error
)

if not exist "compiled_BANK_03.bin" (
GOTO error
)

if not exist "compiled_BANK_04.bin" (
GOTO error
)

if not exist "compiled_BANK_06.bin" (
GOTO error
)

if not exist "compiled_CODE.bin" (
GOTO error
)

if not exist "compiled_CONTENDED.bin" (
GOTO error
)

REM END ERROR CHECKING



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


:bye
echo off
del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
rem del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "displayloop.asm"
del "clearMapArea.asm"
del "drawGameMap.asm"
del "levelutils.asm"

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

rem exit batch file but not close CMD prompt
exit /b


:error
REM Beep when error
@call beep.bat
echo off
del "create_shifted_tables.asm"
del "drawmap.asm"
del "drawsprite.asm"
del "engine.asm"
rem del "im2.asm"
del "input.asm"
del "rambanks.asm"
del "displayloop.asm"
del "clearMapArea.asm"
del "drawGameMap.asm"
del "levelutils.asm"

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


call beep.bat
call beep.bat
ECHO ON
REM ERROR