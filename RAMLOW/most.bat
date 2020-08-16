REM to compile RAMMAIN and RAMLOW only, just include banks

SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config

cls

cd codemaps
	del objects.o
cd ..

cd ..
cd RAMMAIN
	call rammain.bat
cd ..
move "uncontended.o" "RAMMAGIC\"

cd RAMMAGIC
	call magic.bat
cd ..


cd ramlow

call ramlow

rem cls


cd ..
	cd RAMMAGIC
		call abracadabra.bat
	cd ..
cd RAMLOW

REM Beep when done
@call beep.bat















