SET PATH=c:\z88dk199c;c:\z88dk199c\bin;c:\z88dk199c\lib\;c:\z88dk199c\lib\clibs;c:\z88dk199c\lib\config;C:\Program Files\SDCC\bin 


call ramlow

cd ..
	cd RAMMAGIC
		call abracadabra.bat
	cd ..
cd RAMLOW

REM Beep when done
@call beep.bat

