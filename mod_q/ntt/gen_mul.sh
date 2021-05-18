#!/bin/bash

python gen_intt.py 518657 512 1595 9 > asm/mul256x256/intt_256x256_32bit.S
python gen_ntt.py 518657 512 1595 9 > asm/mul256x256/ntt_256x256_32bit.S
