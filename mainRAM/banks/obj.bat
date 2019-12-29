SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin

rem https://www.z88dk.org/forum/viewtopic.php?pid=14548

	
rem z80asm --output=pietro_loader.o pietro_loader.asm pietro_zx.asm
rem z80nm pietro_loader.o


	
z80asm --output=ram99.o ram3.o ram4.o ram1.o ram0.o ram6.o

z80nm ram99.o

z80nm ram99.o > output.txt
@rem will create a new file with all the output of myProgram
