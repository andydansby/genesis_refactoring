:again
cls
@echo YOU MUST DO A [F]ULL COMPILE COMPILE THE FIRST TIME!!
@echo ..................................
@echo afterwards, if you want to compile uncontended 
@echo memory + contended, select [M]
@echo .............
@echo otherwise, to compile just contended
@echo memory only, select [L]
@echo .............
@echo Options: [F]ull Compile, [M]ain, [L]ow, [Q]uit" 
@echo [F]ull compile of all RAM Banks
@echo [M]ain compile compiles contended and uncontended up to 49152
@echo [L]ow compile compiles contended RAM only 24200 to 32167
@set /p answer=Enter selection:

@ECHO off
if /i "%answer:~,1%" EQU "F" GOTO full
if /i "%answer:~,1%" EQU "M" GOTO main
if /i "%answer:~,1%" EQU "L" GOTO low
if /i "%answer:~,1%" EQU "Q" GOTO quit

   goto again
   
:quit
@echo off
GOTO GOODBYE



:full
call all.bat
@echo off
GOTO GOODBYE

:main
cd RAMLOW
	call most.bat
cd ..
@echo off
GOTO GOODBYE

:low
cd RAMLOW
	call some.bat
cd ..
@echo off
GOTO GOODBYE


REM LAST ENTRY
:GOODBYE
@echo on
exit /b