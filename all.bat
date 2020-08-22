SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin

cls

cd RAMLOADER
	call loader.bat
cd ..

@rem pause

cd RAM1
	call ram1.bat
	echo on
	REM RAM 1 NOTHING YET
cd ..

@rem pause

cd RAM3
	call ram3.bat
	echo on
	REM RAM 1 GRAPHICS
cd ..

@rem pause

cd RAM4
	call ram4.bat
	echo on
	REM RAM 4 LEVELS and ENEMIES
cd ..

@rem pause

cd RAM6	
	call ram6.bat
	echo on
	REM RAM 6 GRAPHICS
cd ..

@rem pause

cd RAM0
	call ram0.bat
	echo on
	REM RAM 0 WYZ FILES
cd ..

@rem pause

cd RAMMAIN
	call rammain.bat
	echo on
	REM UNCONTENDED MEMORY 32768-49151
cd ..




REM Let's move all of our object files into RAMMAGIC
move "ram0.o" "RAMMAGIC\"
move "ram1.o" "RAMMAGIC\"
move "ram3.o" "RAMMAGIC\"
move "ram4.o" "RAMMAGIC\"
move "ram6.o" "RAMMAGIC\"
@rem move "ramlow.o" "RAMMAGIC\"
move "uncontended.o" "RAMMAGIC\"

REM let's move our loader as well
move "loader.tap" "RAMMAGIC\"


rem HERE we are combining all of our object files into 1 large file
cd RAMMAGIC
	call magic.bat
cd ..

rem exit /b




rem compile lowRAM
cd RAMLOW
	call ramlow.bat
echo on
cd ..



cd RAMMAGIC
 	call abracadabra.bat
cd ..

REM Beep when done
@call beep.bat