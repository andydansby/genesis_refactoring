;* * * * *  Small-C/Plus z88dk * * * * *
;  Version: 20170112
;
;	Reconstructed for z80 Module Assembler
;
;	Module compile time: Mon Feb 10 03:14:57 2020



	MODULE	test


	INCLUDE "z80_crt0.hdr"


	SECTION	code_compiler


._main
	ret




; --- Start of Static Variables ---

	SECTION	bss_compiler

	SECTION	code_compiler



; --- Start of Scope Defns ---

	EXTERN	zx_aaddr2cx
	EXTERN	zx_aaddr2cy
	EXTERN	zx_px2bitmask
	EXTERN	fmemopen
	EXTERN	sprintf
	EXTERN	zx_aaddr2px
	EXTERN	zx_aaddr2py
	EXTERN	snprintf
	EXTERN	fdopen_callee
	EXTERN	fmemopen_callee
	EXTERN	fopen_callee
	EXTERN	freopen_callee
	EXTERN	zx_py2saddr
	EXTERN	zx_saddrcleft
	EXTERN	zx_saddrcdown
	EXTERN	asprintf
	EXTERN	zx_pattern_fill
	EXTERN	flockfile
	EXTERN	zx_cy2aaddr
	EXTERN	vprintf
	EXTERN	fgetpos_callee
	EXTERN	fseek_callee
	EXTERN	fsetpos_callee
	EXTERN	fwrite_callee
	EXTERN	vsscanf
	EXTERN	zx_aaddrcup
	EXTERN	zx_saddr2cx
	EXTERN	zx_saddr2cy
	EXTERN	zx_saddr2px
	EXTERN	zx_saddr2py
	EXTERN	zx_scroll_wc_up
	EXTERN	fclose
	EXTERN	fgetpos_unlocked
	EXTERN	fseek_unlocked
	EXTERN	fsetpos_unlocked
	EXTERN	fwrite_unlocked
	EXTERN	getline_unlocked
	EXTERN	zx_cyx2aaddr_callee
	EXTERN	zx_cyx2saddr_callee
	EXTERN	zx_pxy2aaddr_callee
	EXTERN	zx_pxy2saddr_callee
	EXTERN	fdopen
	EXTERN	zx_saddrpleft
	EXTERN	fgetpos_unlocked_callee
	EXTERN	fgets_unlocked_callee
	EXTERN	fputc_unlocked_callee
	EXTERN	zx_saddrpdown
	EXTERN	fputs_unlocked_callee
	EXTERN	fread_unlocked_callee
	EXTERN	freopen_unlocked_callee
	EXTERN	fseek_unlocked_callee
	EXTERN	fsetpos_unlocked_callee
	EXTERN	fwrite_unlocked_callee
	EXTERN	getdelim_unlocked_callee
	EXTERN	getline_unlocked_callee
	EXTERN	putc_unlocked_callee
	EXTERN	ungetc_unlocked_callee
	EXTERN	vfprintf_unlocked_callee
	EXTERN	vfscanf_unlocked_callee
	EXTERN	vprintf_unlocked_callee
	EXTERN	vscanf_unlocked_callee
	EXTERN	fileno
	EXTERN	fflush
	EXTERN	ferror
	EXTERN	fscanf
	EXTERN	zx_scroll_up
	EXTERN	open_memstream_callee
	EXTERN	zx_saddrcup
	EXTERN	zx_cy2saddr
	EXTERN	zx_aaddrcright
	EXTERN	zx_saddrcright
	EXTERN	zx_saddrpup
	EXTERN	zx_pxy2aaddr
	EXTERN	zx_saddrpleft_callee
	EXTERN	zx_saddr2aaddr
	EXTERN	fwrite
	EXTERN	funlockfile
	EXTERN	zx_cls_wc_callee
	EXTERN	getline_callee
	EXTERN	perror
	EXTERN	rewind
	EXTERN	vsprintf
	EXTERN	fgetpos
	EXTERN	clearerr_unlocked
	EXTERN	fflush_unlocked
	EXTERN	fprintf_unlocked
	EXTERN	fread_unlocked
	EXTERN	fscanf_unlocked
	EXTERN	printf_unlocked
	EXTERN	scanf_unlocked
	EXTERN	vfprintf_unlocked
	EXTERN	vfscanf_unlocked
	EXTERN	vprintf_unlocked
	EXTERN	vscanf_unlocked
	EXTERN	printf
	EXTERN	zx_scroll_up_callee
	EXTERN	sscanf
	EXTERN	zx_pxy2saddr
	EXTERN	getchar
	EXTERN	ungetc
	EXTERN	_stderr
	EXTERN	zx_aaddr2saddr
	EXTERN	zx_saddrpright
	EXTERN	vscanf
	EXTERN	_stdout
	EXTERN	getline
	EXTERN	fgets_callee
	EXTERN	getdelim_callee
	EXTERN	ungetc_callee
	EXTERN	zx_saddrpright_callee
	EXTERN	zx_pattern_fill_callee
	EXTERN	fgetc
	EXTERN	freopen
	EXTERN	fgets
	EXTERN	zx_cls
	EXTERN	zx_aaddrcleft
	EXTERN	zx_aaddrcdown
	EXTERN	fread
	EXTERN	open_memstream
	EXTERN	fseek
	EXTERN	fopen
	EXTERN	ftell
	EXTERN	fsetpos
	EXTERN	fprintf
	EXTERN	fputc
	EXTERN	scanf
	EXTERN	fputs
	EXTERN	fclose_unlocked
	EXTERN	fgetc_unlocked
	EXTERN	fgets_unlocked
	EXTERN	fileno_unlocked
	EXTERN	fputc_unlocked
	EXTERN	fputs_unlocked
	EXTERN	getc_unlocked
	EXTERN	getdelim_unlocked
	EXTERN	gets_unlocked
	EXTERN	putc_unlocked
	EXTERN	puts_unlocked
	EXTERN	ungetc_unlocked
	EXTERN	obstack_vprintf
	EXTERN	fread_callee
	EXTERN	_stdin
	EXTERN	zx_cyx2aaddr
	EXTERN	clearerr
	EXTERN	obstack_printf
	EXTERN	feof
	EXTERN	getc
	EXTERN	gets
	PUBLIC	_main
	EXTERN	vsnprintf
	EXTERN	_fmemopen_
	EXTERN	putc
	EXTERN	vasprintf
	EXTERN	puts
	EXTERN	zx_cyx2saddr
	EXTERN	zx_bitmask2px
	EXTERN	zx_cls_wc
	EXTERN	zx_border
	EXTERN	vfscanf
	EXTERN	zx_py2aaddr
	EXTERN	feof_unlocked
	EXTERN	ferror_unlocked
	EXTERN	freopen_unlocked
	EXTERN	ftell_unlocked
	EXTERN	getchar_unlocked
	EXTERN	putchar_unlocked
	EXTERN	rewind_unlocked
	EXTERN	zx_scroll_wc_up_callee
	EXTERN	obstack_vprintf_callee
	EXTERN	vasprintf_callee
	EXTERN	vfprintf_callee
	EXTERN	vfscanf_callee
	EXTERN	vprintf_callee
	EXTERN	vscanf_callee
	EXTERN	vsnprintf_callee
	EXTERN	vsprintf_callee
	EXTERN	vsscanf_callee
	EXTERN	getdelim
	EXTERN	putchar
	EXTERN	ftrylockfile
	EXTERN	vfprintf
	EXTERN	_fmemopen__callee
	EXTERN	fputc_callee
	EXTERN	fputs_callee
	EXTERN	putc_callee


; --- End of Scope Defns ---


; --- End of Compilation ---
