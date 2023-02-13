;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_gfx
	.globl b___func_blank_tile_data
	.globl ___func_blank_tile_data
	.globl b___func_logo_map
	.globl ___func_logo_map
	.globl b___func_logo_tiles_data
	.globl ___func_logo_tiles_data
	.globl _fill_bkg_rect
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:6: INCBIN(logo_tiles_data, "res/gbdk2020.bin") // Variable name to use, Path to file
;	---------------------------------
; Function __func_logo_tiles_data
; ---------------------------------
	b___func_logo_tiles_data	= 0
___func_logo_tiles_data::
_logo_tiles_data::
1$:
	.incbin "res/gbdk2020.bin" 
2$:
	___size_logo_tiles_data = (2$-1$) 
	.globl ___size_logo_tiles_data 
	.local b___func_logo_tiles_data 
	___bank_logo_tiles_data = b___func_logo_tiles_data 
	.globl ___bank_logo_tiles_data 
;src/main.c:9: INCBIN(logo_map, "res/gbdk2020_map.bin")
;	---------------------------------
; Function __func_logo_map
; ---------------------------------
	b___func_logo_map	= 0
___func_logo_map::
_logo_map::
1$:
	.incbin "res/gbdk2020_map.bin" 
2$:
	___size_logo_map = (2$-1$) 
	.globl ___size_logo_map 
	.local b___func_logo_map 
	___bank_logo_map = b___func_logo_map 
	.globl ___bank_logo_map 
;src/main.c:12: INCBIN(blank_tile_data, "res/blanktile.bin")
;	---------------------------------
; Function __func_blank_tile_data
; ---------------------------------
	b___func_blank_tile_data	= 0
___func_blank_tile_data::
_blank_tile_data::
1$:
	.incbin "res/blanktile.bin" 
2$:
	___size_blank_tile_data = (2$-1$) 
	.globl ___size_blank_tile_data 
	.local b___func_blank_tile_data 
	___bank_blank_tile_data = b___func_blank_tile_data 
	.globl ___bank_blank_tile_data 
;src/main.c:28: void init_gfx() {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src/main.c:30: set_bkg_data(0x80u, 1u, blank_tile_data); // The first 0x80u here is the tile ID
	ld	de, #_blank_tile_data
	push	de
	ld	hl, #0x180
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:31: fill_bkg_rect(0u, 0u, 20u, 18u, 0x80u);   // The last 0x80u here is the tile ID 
	ld	hl, #0x8012
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;src/main.c:35: set_bkg_data(0u, INCBIN_SIZE(logo_tiles_data) / TILE_BYTES, logo_tiles_data);
	ld	bc, #_logo_tiles_data+0
	ld	de, #___size_logo_tiles_data+0
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	push	bc
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:38: logo_map);
;src/main.c:36: set_bkg_tiles(LOGO_MAP_X, LOGO_MAP_Y,
	ld	de, #_logo_map
	push	de
	ld	hl, #0xc07
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:41: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:42: }
	ret
;src/main.c:46: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:48: init_gfx();
	call	_init_gfx
;src/main.c:51: while(1) {
00102$:
;src/main.c:56: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:58: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
