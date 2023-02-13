;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module sample_player
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _play_length
	.globl _play_sample
	.globl _play_bank
	.globl _play_isr
	.globl _set_sample
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_play_bank::
	.ds 1
_play_sample::
	.ds 2
_play_length::
	.ds 2
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
;src/sample_player.c:7: void play_isr() __nonbanked __naked {
;	---------------------------------
; Function play_isr
; ---------------------------------
_play_isr::
;src/sample_player.c:62: __endasm;
	ld	hl, #_play_length ; something left to play?
	ld	a, (hl+)
	or	(hl)
	ret	z
	ld	hl, #_play_sample
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a ; HL = current position inside the sample
;	load new waveform
	ld	a, (#__current_bank) ; save bank and switch
	ld	e, a
	ld	a, (#_play_bank)
	ld	(#0x2000), a
	xor	a
	ldh	(_NR30_REG),a
	_wave_addr	= 0xFF30
	.rept	16
	ld	a, (hl+)
	ldh	(_wave_addr), a
	_wave_addr	= _wave_addr + 1
	.endm
	ld	a, #0x80
	ldh	(_NR30_REG),a
	ld	a, #0xFE ; length of wave
	ldh	(_NR31_REG),a
	ld	a, #0x20 ; volume
	ldh	(_NR32_REG),a
	xor	a ; low freq bits are zero
	ldh	(_NR33_REG),a
	ld	a, #0xC7 ; start; no loop; high freq bits are 111
	ldh	(_NR34_REG),a
	ld	a, e ; restore bank
	ld	(#0x2000), a
	ld	a, l ; save current position
	ld	(#_play_sample), a
	ld	a, h
	ld	(#_play_sample+1), a
	ld	hl, #_play_length ; decrement length variable
	ld	a, (hl)
	sub	#1
	ld	(hl+), a
	ld	a, (hl)
	sbc	#0
	ld	(hl), a
	ret
;src/sample_player.c:63: }
;src/sample_player.c:65: void set_sample(UINT8 bank, const UINT8 * sample, UINT16 length) __critical {
;	---------------------------------
; Function set_sample
; ---------------------------------
_set_sample::
	di
	ld	(#_play_bank),a
	ld	hl, #_play_sample
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/sample_player.c:66: play_bank = bank, play_sample = sample, play_length = length >> 4;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_play_length),a
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_play_length + 1
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;src/sample_player.c:67: }
	ei
	pop	hl
	pop	af
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__play_bank:
	.db #0x01	; 1
__xinit__play_sample:
	.dw #0x0000
__xinit__play_length:
	.dw #0x0000
	.area _CABS (ABS)
