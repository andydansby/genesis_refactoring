@REM This is an incremental build for
@REM the main low memory
@REM all.bat needs to be called first
@REM before this gets called if you
@REM make any changes to any other bank

cls

cd mainRAM

cd banks
	copy "ram99.o" "ram98.o"
	copy "ram98.o" "..\"
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

pause

rem tester
zcc +zx -v -m -clib=new ram98.o -o compiled.tmp -pragma-include:zpragma.inc @main.lst




echo off


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

move "compiled.map" "codemaps\"
move "objects.o" "banks\"

del compiled.tmp
del zcc_opt.def
rem del zcc_proj.lst


 







rem going back to root directory
cd ..


cd loader
	call loader.bat
	move "loader.tap" "..\"
cd ..
move "loader.tap" "mainRAM\"

cd mainRAM

	echo on

	appmake +zx -b compiled_CODE.bin -o main.tap --org 24300 --noloader --blockname main
	
	appmake +zx -b compiled_BANK_00.bin -o bank00.tap --org 49152 --noloader --blockname bank0

	appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank1

	appmake +zx -b compiled_BANK_03.bin -o bank03.tap --org 49152 --noloader --blockname bank3

	appmake +zx -b compiled_BANK_04.bin -o bank04.tap --org 49152 --noloader --blockname bank4

	appmake +zx -b compiled_BANK_06.bin -o bank06.tap --org 49152 --noloader --blockname bank6
	
	echo off
	
	del "compiled_CODE.bin"
	del "compiled_BANK_00.bin"
	del "compiled_BANK_01.bin"
	del "compiled_BANK_03.bin"
	del "compiled_BANK_04.bin"
	del "compiled_BANK_06.bin"
	
	copy /b loader.tap + bank03.tap + bank04.tap + bank06.tap + bank02.tap + bank01.tap + bank00.tap + main.tap testmain.tap
	
	del loader.tap
	del bank00.tap
	del bank01.tap
	del bank03.tap
	del bank04.tap
	del bank06.tap	
	del main.tap
	
	copy "testmain.tap" "..\"
cd ..