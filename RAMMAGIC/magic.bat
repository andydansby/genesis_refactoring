


rem combine all object files

rem z80asm --output=ramALL.o ramlow.o ram0.o ram1.o ram3.o ram4.o ram6.o

z80asm --output=ramALL.o  ram0.o ram1.o ram3.o ram4.o ram6.o uncontended.o


z80nm ramALL.o > ramALL.txt
	@rem output.txt will have the listing of routines

REM move the object file created above into the RAMMAIN directory to compile the test.c file
copy "ramALL.o" "..\RAMLOW\"


