SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

echo off

cd codemaps
	del objects.o
	del rammain.txt
cd ..

rem cls



REM LOAD FILES FROM ANOTHER DIRECTORY
cd code1
	copy "drawmap.asm" "..\"
rem	copy "clearMapArea.asm" "..\"
	copy "create_shifted_tables.asm" "..\"
	copy "drawsprite.asm" "..\"
	copy "input.asm" "..\"
	copy "im2.asm" "..\"
	copy "isr.asm" "..\"
	copy "im2Manager.asm" "..\"
REM	copy "rambank.asm" "..\"
REM	copy "gameISR.asm" "..\"
cd ..

echo on



rem this creates an object file
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramMain.lst

@rem normal compile
@rem zcc +zx -vn -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramMain.lst

rem pause


copy "objects.o" "uncontended.o"
move "uncontended.o" "..\"
move "objects.o" "codemaps\"

REM Cleanup
del zcc_opt.def


REM Delete our support files
rem del "clearMapArea.asm"
REM del "rambank.asm"
REM del "gameISR.asm"
del "drawmap.asm"
del "create_shifted_tables.asm"
del "drawsprite.asm"
del "input.asm"
del "im2.asm"
del "isr.asm"
del "im2Manager.asm"

cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > rammain.txt
	copy "rammain.txt" "..\"
	echo off
cd ..