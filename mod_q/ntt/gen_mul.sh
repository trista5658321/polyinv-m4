#!/bin/bash

python bit32/gen_intt.py 518657 512 1595 9 > asm/mul256x256/intt512_32bit.S
python bit32/gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt512_32bit.S
python bit32/gen_basemul.py 518657 512 1595 9 > asm/mul256x256/basemul_32bit_4x4.S

python bit16/gen_intt.py 7681 512 62 9 > asm/mul256x256/intt512_16bit.S
python bit16/gen_basemul.py 7681 512 62 9 > asm/mul256x256/basemul_16bit_4x4.S
# python bit16/gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt_256x256_16bit.S
