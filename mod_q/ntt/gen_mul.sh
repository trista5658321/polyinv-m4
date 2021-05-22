#!/bin/bash

python bit32/gen_intt.py 518657 512 1595 9 > asm/mul256x256/intt_256x256_32bit.S
python bit32/gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt_256x256_32bit.S

python bit16/gen_intt.py 7681 512 62 9 > asm/mul256x256/intt_256x256_16bit.S
# python bit16/gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt_256x256_16bit.S
