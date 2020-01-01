

cd loading
	copy loading.scr loadscreen.bin
	move "loadscreen.bin" "..\"
cd ..

cd utils
	copy "bas2tap.exe" "..\"
	copy "bin2tap.exe" "..\"
cd ..

	bas2tap -a10 -sbologna loader.bas basloader.tap
	bin2tap -o loadscreen.tap -a 16384 loadscreen.bin

copy /b basloader.tap + loadscreen.tap loader.tap

echo off

rem cleanup
del bas2tap.exe
del bin2tap.exe
del loadscreen.bin
del loadscreen.tap
del basloader.tap