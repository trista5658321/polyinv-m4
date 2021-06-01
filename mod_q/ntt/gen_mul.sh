#!/bin/bash

python bit32/gen_intt.py 1038337 512 1151 9 > asm/mul256x256/intt512_32bit.S
python bit32/gen_ntt.py 1038337 512 1151 9 > asm/mul256x256/ntt512_32bit.S
python bit32/gen_basemul.py 1038337 512 1151 9 > asm/mul256x256/basemul512_32bit_4x4.S
python bit32/gen_basemul_x.py 1038337 512 1151 9 > asm/mul256x256/basemul_x_512_32bit_4x4.S

# python bit16/gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt_256x256_16bit.S
python bit16/gen_intt.py 7681 512 62 9 > asm/mul256x256/intt512_16bit.S
python bit16/gen_basemul.py 7681 512 62 9 > asm/mul256x256/basemul512_16bit_4x4.S
python bit16/gen_basemul_x.py 7681 512 62 9 > asm/mul256x256/basemul_x_512_16bit_4x4.S

python ./gen_crt.py 7879 512 1038337 7681 9 > asm/mul256x256/crt512.S
python ./gen_crt.py 7177 512 1038337 7681 9 > asm/mul256x256/crt512_7177.S