SET PATH=c:\z88dk199b;c:\z88dk199b\bin;c:\z88dk199b\lib\;c:\z88dk199b\lib\clibs;c:\z88dk199b\lib\config;C:\Program Files\SDCC\bin 

cls

echo on

rem a little cleanup first

cd codemaps
	del objects.o
cd ..



rem BUILD OBJECT FILE
@rem zcc +zx -v -c -clib=new --fsigned-char -o objects @zproject.lst

zcc +zx -v -c -clib=new --fsigned-char -o objects @ram1.lst
rem just make the object file


rem cleanup

move "objects.o" "codemaps\"

rem move "compiled_BANK_01.bin" "binary\"
rem move "compiled_CODE.bin" "binary\"
 
del zcc_opt.def
del zcc_proj.lst

cd codemaps
	echo on
	z80nm objects.o
	echo off
cd ..

