@REM used for build of low memory only

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
	copy "Drawing.asm" "..\"
	copy "miscellaneous.asm" "..\"
cd ..

cd banks
	copy "ram99.o" "..\"
cd ..

cls
echo on

rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst
@rem build as an object file
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @main.lst
rem build as a binary
@rem zcc +zx -v -m -startup=31 -clib=new objects.o -o compiled.tmp -pragma-include:zpragma.inc


rem build as an object file
zcc +zx -v -c -clib=new --fsigned-char -o objects @main.lst

rem tester
zcc +zx -v -m -clib=new ram99.o -o compiled.tmp -pragma-include:zpragma.inc @main.lst


echo off
 
copy "compiled.map" "codemaps\"
move "compiled_CODE.bin" "..\"
move "compiled_BANK_00.bin" "..\"
move "compiled_BANK_01.bin" "..\"
move "compiled_BANK_03.bin" "..\"
move "compiled_BANK_04.bin" "..\"
move "compiled_BANK_06.bin" "..\"

rem tester
rem zcc +zx -v -m -clib=new ram99.o -o compiled.tmp -pragma-include:zpragma.inc


rem pause
rem cleanup


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
del "Drawing.asm"
del "miscellaneous.asm"

del ram99.o


move "compiled.map" "codemaps\"
move "objects.o" "banks\"



del compiled.tmp
del zcc_opt.def
rem del zcc_proj.lst





@rem cd codemaps
@rem 	echo on
@rem 	@REM all these objects match up
@rem 	z80nm objects.o
@rem 	echo off
@rem cd ..

