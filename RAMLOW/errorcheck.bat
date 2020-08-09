
REM START ERROR CHECKING

echo off

if not exist "ramALL.o" (
GOTO ramall
)

if not exist "compiled_BANK_00.bin" (
GOTO bank0
)

if not exist "compiled_BANK_01.bin" (
GOTO bank1
)

if not exist "compiled_BANK_03.bin" (
GOTO bank3
)

if not exist "compiled_BANK_04.bin" (
GOTO bank4
)

if not exist "compiled_BANK_06.bin" (
GOTO bank6
)

if not exist "compiled_CODE.bin" (
GOTO rammain
)



:error
REM Beep when error
echo off

REM ERROR
GOTO end


:bank0
echo on
REM ERROR is in RAM0
@call beep.bat
pause
GOTO end

:bank1
echo on
REM ERROR is in RAM1
@call beep.bat
pause
GOTO end

:bank3
echo on
REM ERROR is in RAM3
@call beep.bat
pause
GOTO end

:bank4
echo on
REM ERROR is in RAM4
@call beep.bat
pause
GOTO end

:bank6
echo on
REM ERROR is in RAM6
@call beep.bat
pause
GOTO end

:rammain
echo on
REM ERROR is in Contended memory / RAMLOW
@call beep.bat
pause
GOTO end


:ramall
echo on
REM Object file refused to build
@call beep.bat
pause
GOTO end


:end
echo on