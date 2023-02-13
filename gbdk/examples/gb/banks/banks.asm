;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module banks
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _print_var
	.globl _bank_fixed
	.globl b_bank_3
	.globl _bank_3
	.globl b_bank_2
	.globl _bank_2
	.globl b_bank_1
	.globl _bank_1
	.globl _puts
	.globl _printf
	.globl _var_internal
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_var_internal::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;banks.c:18: void bank_fixed(void) NONBANKED
;	---------------------------------
; Function bank_fixed
; ---------------------------------
_bank_fixed::
;banks.c:20: puts("I'm in fixed ROM");
	ld	de, #___str_0
;banks.c:21: }
	jp	_puts
___str_0:
	.ascii "I'm in fixed ROM"
	.db 0x00
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;banks.c:23: void print_var(uint8_t bank)
;	---------------------------------
; Function print_var
; ---------------------------------
_print_var::
	ld	c, a
;banks.c:25: SWITCH_RAM(bank);
	ld	hl, #0x4000
	ld	(hl), c
;banks.c:26: printf("Var_%u is %u\n");
	ld	de, #___str_1
	push	de
	call	_printf
	pop	hl
;banks.c:27: }
	ret
___str_1:
	.ascii "Var_%u is %u"
	.db 0x0a
	.db 0x00
;banks.c:29: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;banks.c:31: puts("Program Start...");
	ld	de, #___str_2
	call	_puts
;banks.c:33: ENABLE_RAM;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;banks.c:35: var_internal = 1;
	ld	hl, #_var_internal
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;banks.c:36: SWITCH_RAM(0);
	ld	hl, #0x4000
	ld	(hl), #0x00
;banks.c:37: var_0 = 2;
	ld	hl, #_var_0
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;banks.c:38: SWITCH_RAM(1);
	ld	hl, #0x4000
	ld	(hl), #0x01
;banks.c:39: var_1 = 3;
	ld	hl, #_var_1
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;banks.c:40: SWITCH_RAM(2);
	ld	hl, #0x4000
	ld	(hl), #0x02
;banks.c:41: var_2 = 4;
	ld	hl, #_var_2
	ld	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;banks.c:42: SWITCH_RAM(3);
	ld	hl, #0x4000
	ld	(hl), #0x03
;banks.c:43: var_3 = 5;
	ld	hl, #_var_3
	ld	a, #0x05
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;banks.c:45: bank_fixed();
	call	_bank_fixed
;banks.c:46: bank_1();
	ld	e, #b_bank_1
	ld	hl, #_bank_1
	call	___sdcc_bcall_ehl
;banks.c:47: bank_2();
	ld	e, #b_bank_2
	ld	hl, #_bank_2
	call	___sdcc_bcall_ehl
;banks.c:48: bank_3();
	ld	e, #b_bank_3
	ld	hl, #_bank_3
	call	___sdcc_bcall_ehl
;banks.c:50: printf("Var is %u\n", var_internal);
	ld	hl, #_var_internal
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #4
;banks.c:51: SWITCH_RAM(0);
	ld	hl, #0x4000
	ld	(hl), #0x00
;banks.c:52: printf("Var_0 is %u\n", var_0);
	ld	hl, #_var_0
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	de, #___str_4
	push	de
	call	_printf
	add	sp, #4
;banks.c:53: SWITCH_RAM(1);
	ld	hl, #0x4000
	ld	(hl), #0x01
;banks.c:54: printf("Var_1 is %u\n", var_1);
	ld	hl, #_var_1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	de, #___str_5
	push	de
	call	_printf
	add	sp, #4
;banks.c:55: SWITCH_RAM(2);
	ld	hl, #0x4000
	ld	(hl), #0x02
;banks.c:56: printf("Var_2 is %u\n", var_2);
	ld	hl, #_var_2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	de, #___str_6
	push	de
	call	_printf
	add	sp, #4
;banks.c:57: SWITCH_RAM(3);
	ld	hl, #0x4000
	ld	(hl), #0x03
;banks.c:58: printf("Var_3 is %u\n", var_3);
	ld	hl, #_var_3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	de, #___str_7
	push	de
	call	_printf
	add	sp, #4
;banks.c:60: puts("The End...");
	ld	de, #___str_8
;banks.c:61: }
	jp	_puts
___str_2:
	.ascii "Program Start..."
	.db 0x00
___str_3:
	.ascii "Var is %u"
	.db 0x0a
	.db 0x00
___str_4:
	.ascii "Var_0 is %u"
	.db 0x0a
	.db 0x00
___str_5:
	.ascii "Var_1 is %u"
	.db 0x0a
	.db 0x00
___str_6:
	.ascii "Var_2 is %u"
	.db 0x0a
	.db 0x00
___str_7:
	.ascii "Var_3 is %u"
	.db 0x0a
	.db 0x00
___str_8:
	.ascii "The End..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
