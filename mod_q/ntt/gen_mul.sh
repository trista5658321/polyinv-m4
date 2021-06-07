#!/bin/bash

# 256

python bit16/gen_ntt.py 769 256 7 8 256 > asm/mul128x128/ntt256_16bit.S
python bit16/gen_intt.py 769 256 7 8 256 > asm/mul128x128/intt256_16bit.S
python bit16/gen_basemul_2x2.py 769 256 7 8 256 > asm/mul128x128/basemul256_16bit_2x2.S
python bit16/gen_basemul_x_2x2.py 769 256 7 8 256 > asm/mul128x128/basemul_x_256_16bit_2x2.S

python bit32/gen_ntt.py 5168129 256 27827 8 256 > asm/mul128x128/ntt256_32bit.S
python bit32/gen_intt.py 5168129 256 27827 8 256 > asm/mul128x128/intt256_32bit.S
python bit32/gen_basemul_2x2.py 5168129 256 27827 8 256 > asm/mul128x128/basemul256_32bit_2x2.S
python bit32/gen_basemul_x_2x2.py 5168129 256 27827 8 256 > asm/mul128x128/basemul_x_256_32bit_2x2.S

python ./gen_crt.py 7879 256 5168129 769 8 > asm/mul128x128/crt256_7879.S
python ./gen_crt.py 7177 256 5168129 769 8 > asm/mul128x128/crt256_7177.S
python ./gen_crt.py 6343 256 5168129 769 8 > asm/mul128x128/crt256_6343.S

# 512

python bit16/gen_ntt.py 7681 512 62 9 512 > asm/mul256x256/ntt512_16bit.S
python bit16/gen_intt.py 7681 512 62 9 512 > asm/mul256x256/intt512_16bit.S
python bit16/gen_basemul.py 7681 512 62 9 512 > asm/mul256x256/basemul512_16bit_4x4.S
python bit16/gen_basemul_x.py 7681 512 62 9 512 > asm/mul256x256/basemul_x_512_16bit_4x4.S

python bit32/gen_intt.py 1038337 512 1151 9 512 > asm/mul256x256/intt512_32bit.S
python bit32/gen_ntt.py 1038337 512 1151 9 512 > asm/mul256x256/ntt512_32bit.S
python bit32/gen_basemul.py 1038337 512 1151 9 512 > asm/mul256x256/basemul512_32bit_4x4.S
python bit32/gen_basemul_x.py 1038337 512 1151 9 512 > asm/mul256x256/basemul_x_512_32bit_4x4.S

python ./gen_crt.py 7879 512 1038337 7681 9 > asm/mul256x256/crt512.S
python ./gen_crt.py 7177 512 1038337 7681 9 > asm/mul256x256/crt512_7177.S
python ./gen_crt.py 6343 512 1038337 7681 9 > asm/mul256x256/crt512_6343.S

# 1024

python bit16/gen_ntt.py 7681 1024 62 10 512 > asm/mul512x512/ntt1024_16bit.S
python bit16/gen_intt.py 7681 1024 62 10 512 > asm/mul512x512/intt1024_16bit.S
python bit16/gen_basemul_2x2.py 7681 1024 62 10 512 > asm/mul512x512/basemul1024_16bit_2x2.S
python bit16/gen_basemul_x_2x2.py 7681 1024 62 10 512 > asm/mul512x512/basemul_x_1024_16bit_2x2.S

python bit32/gen_intt.py 1038337 1024 1151 10 512 > asm/mul512x512/intt1024_32bit.S
python bit32/gen_ntt.py 1038337 1024 1151 10 512 > asm/mul512x512/ntt1024_32bit.S
python bit32/gen_basemul_2x2.py 1038337 1024 1151 10 512 > asm/mul512x512/basemul1024_32bit_2x2.S
python bit32/gen_basemul_x_2x2.py 1038337 1024 1151 10 512 > asm/mul512x512/basemul_x_1024_32bit_2x2.S

python ./gen_crt.py 7879 1024 1038337 7681 10 > asm/mul512x512/crt1024_7879.S
python ./gen_crt.py 7177 1024 1038337 7681 10 > asm/mul512x512/crt1024_7177.S
python ./gen_crt.py 6343 1024 1038337 7681 10 > asm/mul512x512/crt1024_6343.S