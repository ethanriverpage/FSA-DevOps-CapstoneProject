#include <gb/gb.h>
#include <stdio.h>
#include "include/hUGEDriver.h"

extern const hUGESong_t song;

UBYTE joy;
UBYTE c0 = 0, c1 = 0, c2 = 0, c3 = 0;

void main()
{
    LCDC_REG = 0xD1;
    BGP_REG = 0b11100100;
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;

    __critical
    {
        hUGE_init(&song);
        hUGE_dosound();
    }
    // What?
    while (1)
    {
        wait_vbl_done();
        joy = joypad();
        switch (joy)
        {
        case J_UP:
            c0 ^= 1;
            hUGE_mute_channel(HT_CH1, c0);
            // set_bkg_tiles(0, 0, 1, 1, &map[c0 & 1]);
            waitpadup();
            break;
        case J_DOWN:
            c1 ^= 1;
            hUGE_mute_channel(HT_CH2, c1);
            // set_bkg_tiles(1, 0, 1, 1, &map[c1 & 1]);
            waitpadup();
            break;
        case J_LEFT:
            c2 ^= 1;
            hUGE_mute_channel(HT_CH3, c2);
            // set_bkg_tiles(2, 0, 1, 1, &map[c2 & 1]);
            waitpadup();
            break;
        case J_RIGHT:
            c3 ^= 1;
            hUGE_mute_channel(HT_CH4, c3);
            // set_bkg_tiles(3, 0, 1, 1, &map[c3 & 1]);
            waitpadup();
            break;
        }
    }
}