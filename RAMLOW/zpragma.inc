#pragma output __MMAP	= -1
// memory map is provided in file "mmap.inc"

#pragma output CRT_ORG_CODE = 0x5ED0	//24272
// main binary program start 24600	0x6018


//$5CCB is the lowest useable memory address
#pragma output REGISTER_SP = 0x5DCB		//23755 = 0x5E86
//#pragma output REGISTER_SP = 0x9fff
//was 0xbfff, but this runs into TablaTiles
// keep stack out of top 16k 0xc000  49152
//0x5DC8
//#5E86 is being used to place the STACK where the basic program resides

//stack = 23755 - 24011
//stack = $5CCB - $5DCB
//no earier that $5CCB

#pragma output CRT_STACK_SIZE = 0x100

#pragma output CRT_ON_EXIT = 0
// jump to address 0 at exit
// halt on program exit		0x10001

#pragma output CLIB_MALLOC_HEAP_SIZE = 0
// no heap

#pragma output CLIB_STDIO_HEAP_SIZE = 0
// no heap for opening files


//_MAP_START = $A000
//TablaTiles = $B000
///9fff