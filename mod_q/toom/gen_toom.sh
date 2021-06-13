#!/bin/bash

# 653
python Toom-asm_structured_general.py 128 4621 > asm/sntrup653/polymul_128x128.S
python Toom-asm_structured_general.py 256 4621 > asm/sntrup653/polymul_256x256.S

# 761
python Toom-asm_structured_general.py 128 4591 > asm/sntrup761/polymul_128x128.S
python Toom-asm_structured_general.py 256 4591 > asm/sntrup761/polymul_256x256.S

# 857
python Toom-asm_structured_general.py 128 5167 > asm/sntrup857/polymul_128x128.S
python Toom-asm_structured_general.py 256 5167 > asm/sntrup857/polymul_256x256.S
python Toom-asm_structured_general.py 192 5167 > asm/sntrup857/polymul_192x192.S
python Toom-asm_structured_general.py 512 5167 > asm/sntrup857/polymul_512x512.S

# 953
python Toom-asm_structured_general.py 128 6343 > asm/sntrup953/polymul_128x128.S
python Toom-asm_structured_general.py 256 6343 > asm/sntrup953/polymul_256x256.S
python Toom-asm_structured_general.py 384 6343 > asm/sntrup953/polymul_384x384.S
python Toom-asm_structured_general.py 512 6343 > asm/sntrup953/polymul_512x512.S
python Toom-asm_structured_general.py 240 6343 > asm/sntrup953/polymul_240x240.S
python Toom-asm_structured_general.py 960 6343 > asm/sntrup953/polymul_960x960.S

# 1013
python Toom-asm_structured_general.py 128 7177 > asm/sntrup1013/polymul_128x128.S
python Toom-asm_structured_general.py 256 7177 > asm/sntrup1013/polymul_256x256.S
python Toom-asm_structured_general.py 512 7177 > asm/sntrup1013/polymul_512x512.S
python Toom-asm_structured_general.py 1024 7177 > asm/sntrup1013/polymul_1024x1024.S

# 1277
python Toom-asm_structured_general.py 128 7879 > asm/sntrup1277/polymul_128x128.S
python Toom-asm_structured_general.py 256 7879 > asm/sntrup1277/polymul_256x256.S
python Toom-asm_structured_general.py 512 7879 > asm/sntrup1277/polymul_512x512.S
python Toom-asm_structured_general.py 320 7879 > asm/sntrup1277/polymul_320x320.S
python Toom-asm_structured_general.py 1280 7879 > asm/sntrup1277/polymul_1280x1280.S