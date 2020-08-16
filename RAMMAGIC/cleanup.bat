
echo on

rem a bit of cleanup

rem get rid of the object files
rem move "ram0.o" "objects\"
rem move "ram1.o" "objects\"
rem move "ram3.o" "objects\"
rem move "ram4.o" "objects\"
rem move "ram6.o" "objects\"
rem move "ramALL.o" "objects\"
rem move "uncontended.o" "objects\"

rem get rid of the BINs
move "compiled_BANK_00.bin" "objects\"
move "compiled_BANK_01.bin" "objects\"
move "compiled_BANK_03.bin" "objects\"
move "compiled_BANK_04.bin" "objects\"
move "compiled_BANK_06.bin" "objects\"
move "compiled_CODE.bin" "objects\"

move "compiled_UNCONTENDED.bin" "objects\"

move "compiled_IM_MATRIX.bin" "objects\"
move "compiled_IM2_ISR_address.bin" "objects\"
move "compiled_ISR_ROUTINE.bin" "objects\"
move "compiled_UNCONTENDED_MAPSTART.bin" "objects\"
move "compiled_UNCONTENDED_TABLATILES.bin" "objects\"








REM for some reason ALL.bin does not process
rem compiled_ISR_ROUTINE.bin
rem compiled_IM_MATRIX.bin





del "compiled_UNASSIGNED.bin"



rem get rid of the TAPs
move "bank00.tap" "objects\"
move "bank01.tap" "objects\"
move "bank03.tap" "objects\"
move "bank04.tap" "objects\"
move "bank06.tap" "objects\"

move "uncontended.tap" "objects\"

move "contended.tap" "objects\"
move "loader.tap" "objects\"

move "IM_MATRIX.tap" "objects\"
move "ISR_ROUTINE.tap" "objects\"
move "IM2-ISR.tap" "objects\"


move "TABLATILES.tap" "objects\"



move "MAPSTART.tap" "objects\"
