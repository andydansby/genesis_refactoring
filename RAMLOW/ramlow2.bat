SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin 

cd codemaps
	del objects.o
cd ..

rem cls

echo off

cd code1
	copy "depack.asm" "..\"
	copy "wyzplayer.h" "..\"
	copy "externs.h" "..\"
	copy "levelutils.h" "..\"
	copy "variables.h" "..\"
	copy "engine.h" "..\"
	copy "constants.h" "..\"
	copy "levelutils.asm" "..\"
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

@rem zcc +zx -v -c -clib=new ram0.o --fsigned-char -o objects @ramlow.lst

rem this creates an object file
REM not used for anything other than creating a map
zcc +zx -v -c -clib=new --fsigned-char -o objects @ramlow.lst


REM
rem normal compile
zcc +zx -vn -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst

@rem zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst




echo off

@rem zcc +zx -v -m -zorg=24450 -startup=31 -clib=new ramALL.o  -o compiled -pragma-include:zpragma.inc
rem this line compiles all files
@rem zcc +zx -v -m -startup=31 -clib=new ramALL.o -o compiled -pragma-include:zpragma.inc @ramlow.lst

@rem TROUBLESHOOTING COMPILE
@rem zcc +zx -v -c -clib=new --fsigned-char -no-cleanup objects @ramlow.lst




@REM copy "objects.o" "ramlow.o"
@REM move "ramlow.o" "..\"
move "objects.o" "codemaps\"

del zcc_opt.def
del zcc_proj.lst



cd codemaps
	echo on
	@REM all these objects match up
	z80nm objects.o
	z80nm objects.o > ramlow.txt
	copy "ramlow.txt" "..\"
	echo off
cd ..

call errorcheck.bat

