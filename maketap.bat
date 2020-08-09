
cd RAM0
	cd codemaps
		copy "compiled_CODE.bin" "compiled_CODE00.bin"
		copy "objects.o" "object00.o"
		move "compiled_CODE00.bin" "..\"
		move "object00.o" "..\"
	cd ..
	move "compiled_CODE00.bin" "..\"
	move "object00.o" "..\"
cd ..
move "compiled_CODE00.bin" "compiled\"
move "object00.o" "compiled\"


cd RAM3
	cd codemaps
		copy "compiled_CODE.bin" "compiled_CODE03.bin"
		copy "objects.o" "object03.o"
		move "compiled_CODE03.bin" "..\"
		move "object03.o" "..\"
	cd ..
	move "compiled_CODE03.bin" "..\"
	move "object03.o" "..\"
cd ..
move "compiled_CODE03.bin" "compiled\"
move "object03.o" "compiled\"


cd RAM4
	cd codemaps
		copy "compiled_CODE.bin" "compiled_CODE04.bin"
		copy "objects.o" "object04.o"
		move "compiled_CODE04.bin" "..\"
		move "object04.o" "..\"
	cd ..
	move "compiled_CODE04.bin" "..\"
	move "object04.o" "..\"
cd ..
move "compiled_CODE04.bin" "compiled\"
move "object04.o" "compiled\"


cd RAM6
	cd codemaps
		copy "compiled_CODE.bin" "compiled_CODE06.bin"
		copy "objects.o" "object06.o"
		move "compiled_CODE06.bin" "..\"
		move "object06.o" "..\"
	cd ..
	move "compiled_CODE06.bin" "..\"
	move "object06.o" "..\"
cd ..
move "compiled_CODE06.bin" "compiled\"
move "object06.o" "compiled\"

cd compiled

	rem BROKEN
	rem z80asm --output=combined.o object03.o object04.o object06.o object00.o
	rem z80nm combined.o
	rem z80nm combined.o > output.txt
cd ..	
	
	

rem copy *.bin "compiled\"

rem engine.bin
