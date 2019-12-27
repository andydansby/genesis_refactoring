rem compiling order will matter
rem try data only areas first
rem then move to banked areas with code
rem moving each object file to the main directory
rem finally move all object files to the main.c
rem and then compile the main directory

rem RAM 3 has static screens
rem RAM 4 has game maps and enemy locations
rem RAM 1 has sprites data
rem RAM 0 has the WYZ player and game music
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

echo on

move "ram3.o" "mainRAM\banks\"
move "ram4.o" "mainRAM\banks\"
move "ram1.o" "mainRAM\banks\"
move "ram0.o" "mainRAM\banks\"
move "ram6.o" "mainRAM\banks\"

pause

cd mainRAM
	cd banks
		call obj.bat
	cd ..
cd ..


