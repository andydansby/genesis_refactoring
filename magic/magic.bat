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