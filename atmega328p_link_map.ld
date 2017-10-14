MEMORY
{
	/* FLASH RAM Section and permissions in brackets. R - read; X - execute */
	FLASH (RX) : ORIGIN = 0x0000, LENGTH = 0x10000	/* 64kb */
	/* W - write, A - allocate, I - initialize?, L - load */ 
	SRAM (WAIL) : ORIGIN = 0x005F, LENGTH = 0x1000 /* 2kb */
}
SECTIONS
{
	.text :	/*section type in binary file*/ 
	{
		*(.text);	/* section type in *.s file */ 
		*(.code);	/* in case we have .code sections in *.s file it should also go to FLASH RAM */
	} > FLASH		/* goes to FLASH RAM */
	.bss : /* bss section in binary file */
	{
		*(.bss);	/* .bss section in SRAM */
	} > SRAM
	.data : /* bss section in binary file */
	{
		*(.data);	/* .data section in SRAM */
	} > SRAM
}