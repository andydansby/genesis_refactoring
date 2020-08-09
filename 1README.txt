THIS is working towards a new compile technique

We are going to making seperate TAPS via BIN files

object files

on each ram bank, do not compile into a BIN, just an object file.  We then move the object file to a common directory, combine all of the object files into one and then compile the main with the combined object files


-------
What I need to accomplish is to have 

lowRAM hold variables, especially slower variables 
and perhaps universal routines such as decompression.

NON contended RAM should hold main.c (test.c) and main()

ramALL.o needs to go into NON-contended RAM

non-contended RAM has 16k we can work with and falls in Fast RAM, from 32768 to 49151








C:\z88dk199c\game\genesis\12-28-2019\magic
look@12-28-2019\all.bat
-------------
rem compiling order will matter

RAM Banks first, then main.c

rem try data only areas first
rem then move to banked areas with code
rem moving each object file to the main directory
rem finally move all object files to the main.c
rem and then compile the main directory

rem RAM 0 has the WYZ player and game music
rem RAM 1 has sprites data
rem RAM 3 has static screens
rem RAM 4 has game maps and enemy locations
rem RAM 6 has ASM routines for menu, movement and behavior

rem main memory has all game routines

rem compile order 3,4,1,0,6,MAIN

REM clean up some stuff first
cd mainRAM	
	cd banks
		del "ram3.o"	rem OK
		del "ram4.o"	rem OK
		del "ram1.o"	rem OK
		del "ram0.o"	rem OK
		del "ram6.o"	rem OK
	cd ..	
cd ..

rem make a loader
cd loader
	call loader
	move "loader.tap" "..\"
cd ..


rem BANK 3
cd ram3
	call ram3.bat	
	cd codemaps
		copy "objects.o" "..\"
	cd ..
	rename "objects.o" "ram3.o"
	move "ram3.o" "..\"
cd ..


REM BANK 4
cd ram4
	call ram4.bat	
	cd codemaps
		copy "objects.o" "..\"
	cd ..
	rename "objects.o" "ram4.o"
	move "ram4.o" "..\"
cd ..


REM BANK 1
cd ram1
	call ram1.bat	
	cd codemaps
		copy "objects.o" "..\"
	cd ..
	rename "objects.o" "ram1.o"
	move "ram1.o" "..\"
cd ..


REM BANK 0
cd ram0
	call ram0.bat	
	cd codemaps
		copy "objects.o" "..\"
	cd ..
	rename "objects.o" "ram0.o"
	move "ram0.o" "..\"
cd ..


REM BANK 6
cd ram6
	call ram6.bat	
	cd codemaps
		copy "objects.o" "..\"
	cd ..
	rename "objects.o" "ram6.o"
	move "ram6.o" "..\"
cd ..

REM at this point all banks have been compiled
rem need to move them to main
rem compile order 3,4,1,0,6,MAIN

echo off

move "ram3.o" "mainRAM\banks\"
move "ram4.o" "mainRAM\banks\"
move "ram1.o" "mainRAM\banks\"
move "ram0.o" "mainRAM\banks\"
move "ram6.o" "mainRAM\banks\"

@rem pause

echo on

cd mainRAM
	cd banks
		z80asm --output=ram99.o ram3.o ram4.o ram6.o ram1.o ram0.o
		rem z80nm ram99.o
		z80nm ram99.o > output.txt
		@rem output.txt will have the listing of routines		
	cd ..
	call main.bat
cd ..

move "compiled_CODE.bin" "magic\"
move "compiled_BANK_00.bin" "magic\"
move "compiled_BANK_01.bin" "magic\"
move "compiled_BANK_03.bin" "magic\"
move "compiled_BANK_04.bin" "magic\"
move "compiled_BANK_06.bin" "magic\"

move "loader.tap" "magic\"


cd magic
	call magic.bat
cd ..



---------
magic.bat
---------
rem this is where the magic happens

appmake +zx -b compiled_BANK_00.bin -o bank00.tap --org 49152 --noloader --blockname bank0

appmake +zx -b compiled_BANK_01.bin -o bank01.tap --org 49152 --noloader --blockname bank1

appmake +zx -b compiled_BANK_03.bin -o bank03.tap --org 49152 --noloader --blockname bank3

appmake +zx -b compiled_BANK_04.bin -o bank04.tap --org 49152 --noloader --blockname bank4

appmake +zx -b compiled_BANK_06.bin -o bank06.tap --org 49152 --noloader --blockname bank6

appmake +zx -b compiled_CODE.bin -o main.tap --org 24300 --noloader --blockname main

copy /b loader.tap + bank03.tap + bank04.tap + bank06.tap + bank02.tap + bank01.tap + bank00.tap + main.tap output.tap


	del loader.tap
	del bank00.tap
	del bank01.tap
	del bank03.tap
	del bank04.tap
	del bank06.tap	
	del main.tap


move "compiled_BANK_00.bin" "bin\"
move "compiled_BANK_01.bin" "bin\"
move "compiled_BANK_03.bin" "bin\"
move "compiled_BANK_04.bin" "bin\"
move "compiled_BANK_06.bin" "bin\"
move "compiled_CODE.bin" "bin\"
