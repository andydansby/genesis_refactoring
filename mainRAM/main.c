
//main.bin: main.c movement.o behavior.o engine.h movement.h behavior.h structs.h constants.h sprdefs.h
//	zcc +zx -vn -O3 -zorg=24600 main.c movement.o behavior.o -lndos -o main.bin -m

//movement.o: movement.c structs.h
//	zcc +zx -vn -O3 -c movement.c -m

//behavior.o: behavior.c structs.h
//	zcc +zx -vn -O3 -c behavior.c -m

//engine.bin: engine.asm  input.asm rambanks.asm drawmap.asm drawsprite.asm create_shifted_tables.asm im2.asm starfield.asm
//	pasmo engine.asm engine.bin engine.sym







#include <arch/zx.h>
#include <input.h>
#include <stdlib.h>//standard library
#include <string.h>
//#include <compress/aplib.h>
#include <compress/zx7.h>

#include "structs.h"//
#include "movement.h"//
#include "behavior.h"//
#include "constants.h"//
#include "sprdefs.h"//
#include "engine.h"

#include "variables.h"
#include "main.h"




//decompose_5digit


void main(void)
{
	clean_screen_asm();
}


