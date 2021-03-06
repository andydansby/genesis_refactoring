SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

cls

cd codemaps
	del objects.o
cd ..

echo off

cd code1
	copy "depack.asm" "..\"
	copy "wyzplayer.h" "..\"
	copy "externs.h" "..\"
	copy "levelutils.h" "..\"
	copy "variables.h" "..\"
	copy "engine.h" "..\"
	copy "levelutils.asm" "..\"
	copy "structs.h" "..\"
	copy "graphicutils.h" "..\"
	copy "graphicutils.asm" "..\"
	copy "IM2utils.asm" "..\"
cd ..

rem cd supportcode
rem  	copy "engine.h" "..\"
rem  	copy "variables.h" "..\"
rem  	copy "constants.h" "..\"
rem  	copy "structs.h" "..\"
rem  	copy "externs.h" "..\"
rem 	copy "depack.asm" "..\"
rem cd ..

echo on
REM -----------------------------
REM -----------------------------

@rem zcc +zx -v -c -clib=new ram0.o --fsigned-char -o objects @ramlow.lst

@rem zcc +zx -v -c -clib=new --fsigned-char ramALL.o -o objects @ramlow.lst

rem this creates an object file
REM not used for anything other than creating a map
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramlow.lst

rem normal compile
zcc +zx -vn -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst

echo off

@rem zcc +zx -v -m -zorg=24460 -startup=31 -clib=new ramALL.o  -o compiled -pragma-include:zpragma.inc

rem this line compiles all files
@rem zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst

@rem TROUBLESHOOTING COMPILE
@rem zcc +zx -v -c -clib=new --fsigned-char -no-cleanup objects @ramlow.lst



@REM copy "objects.o" "ramlow.o"
@REM move "ramlow.o" "..\"
move "objects.o" "codemaps\"

copy "compiled.map" "codemaps\"

move "compiled.map" "..\RAMMAGIC"

del zcc_opt.def
rem del zcc_proj.lst

rem del "engine.h"
rem del "variables.h"
rem del "constants.h"
rem del "structs.h"
rem del "externs.h"
rem del "depack.asm"


del "depack.asm"
del "wyzplayer.h"
del "externs.h"
del "levelutils.h"
del "variables.h"
del "engine.h"
del "levelutils.asm"
del "structs.h"
del "graphicutils.h"
del "graphicutils.asm"
del "IM2utils.asm"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ramlow.txt
	copy "ramlow.txt" "..\"
	echo off
cd ..

call errorcheck.bat

rem echo off


copy "compiled_BANK_00.bin" "..\RAMMAGIC"
copy "compiled_BANK_01.bin" "..\RAMMAGIC"
copy "compiled_BANK_03.bin" "..\RAMMAGIC"
copy "compiled_BANK_04.bin" "..\RAMMAGIC"
copy "compiled_BANK_06.bin" "..\RAMMAGIC"
copy "compiled_CODE.bin" "..\RAMMAGIC"

copy "compiled_UNCONTENDED.bin" "..\RAMMAGIC"
copy "compiled_UNASSIGNED.bin" "..\RAMMAGIC"

copy "compiled_IM2_TABLE.bin" "..\RAMMAGIC"
copy "compiled_IM2_ISR_address.bin" "..\RAMMAGIC"
copy "compiled_ISR_ROUTINE.bin" "..\RAMMAGIC"
copy "compiled_UNCONTENDED_MAPSTART.bin" "..\RAMMAGIC"
copy "compiled_UNCONTENDED_TABLATILES.bin" "..\RAMMAGIC"

copy "compiled_SPRITE_CACHE.bin" "..\RAMMAGIC"
copy "compiled_LRU_next_Section.bin" "..\RAMMAGIC"
copy "compiled_LRU_prev_Section.bin" "..\RAMMAGIC"

copy "compiled_Level_Sprites.bin" "..\RAMMAGIC"


@REM --------------------------------------------------
move "compiled_BANK_00.bin" "codemaps\"
move "compiled_BANK_01.bin" "codemaps\"
move "compiled_BANK_03.bin" "codemaps\"
move "compiled_BANK_04.bin" "codemaps\"
move "compiled_BANK_06.bin" "codemaps\"
move "compiled_CODE.bin" "codemaps\"

move "compiled_UNCONTENDED.bin" "codemaps\"
move "compiled_UNASSIGNED.bin" "codemaps\"

move "compiled_IM2_TABLE.bin" "codemaps\"
move "compiled_IM2_ISR_address.bin" "codemaps\"
move "compiled_ISR_ROUTINE.bin" "codemaps\"
move "compiled_UNCONTENDED_MAPSTART.bin" "codemaps\"
move "compiled_UNCONTENDED_TABLATILES.bin" "codemaps\"
move "compiled_SPRITE_CACHE.bin" "codemaps\"

move "compiled_LRU_next_Section.bin" "codemaps\"
move "compiled_LRU_prev_Section.bin" "codemaps\"

move "compiled_Level_Sprites.bin" "codemaps\"

