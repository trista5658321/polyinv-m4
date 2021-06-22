#!/bin/bash

# 32
python polymul/gen_polymul_32x32N_sch3.py 32 761 768 > assembly/mul.S
python gen_update_fg.py 32 761 768 > assembly/update_fg.S
python gen_update_VS.py 32 761 768 > assembly/update_VS.S

# 64
python polymul/gen_polymul_32x32N_sch3.py 64 761 768 > assembly/mul64xN.S

# for diff params
python gen_polyinverse/gen.py 64 653 656 > final/sntrup653/jump1312divsteps_mod3_64.c
python polymul/gen_mul.py 64 653 656 > final/sntrup653/mod3_mul64xN_656.S
python polymul/gen_mul_last.py 32 653 656 > final/sntrup653/mod3_mul32xN.S
python gen_update_fg.py 64 653 656 > final/sntrup653/mod3_update_fg_64.S
python gen_update_VS.py 64 653 656 > final/sntrup653/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 653 672 > final/sntrup653/jump1344divsteps_mod3_64.c
python polymul/gen_mul.py 64 653 672 > final/sntrup653/mod3_mul64xN.S

python gen_polyinverse/gen.py 64 761 768 > final/sntrup761/jump1536divsteps_mod3_64.c
python polymul/gen_mul.py 64 761 768 > final/sntrup761/mod3_mul64xN.S
python gen_update_fg.py 64 761 768 > final/sntrup761/mod3_update_fg_64.S
python gen_update_VS.py 64 761 768 > final/sntrup761/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 857 864 > final/sntrup857/jump1728divsteps_mod3_64.c
python polymul/gen_mul.py 64 857 864 > final/sntrup857/mod3_mul64xN.S
python gen_update_fg.py 64 857 864 > final/sntrup857/mod3_update_fg_64.S
python gen_update_VS.py 64 857 864 > final/sntrup857/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 953 960 > final/sntrup953/jump1920divsteps_mod3_64.c
python polymul/gen_mul.py 64 953 960 > final/sntrup953/mod3_mul64xN.S
python gen_update_fg.py 64 953 960 > final/sntrup953/mod3_update_fg_64.S
python gen_update_VS.py 64 953 960 > final/sntrup953/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 1013 1024 > final/sntrup1013/jump2048divsteps_mod3_64.c
python polymul/gen_mul.py 64 1013 1024 > final/sntrup1013/mod3_mul64xN.S
python gen_update_fg.py 64 1013 1024 > final/sntrup1013/mod3_update_fg_64.S
python gen_update_VS.py 64 1013 1024 > final/sntrup1013/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 1277 1280 > final/sntrup1277/jump2560divsteps_mod3_64.c
python polymul/gen_mul.py 64 1277 1280 > final/sntrup1277/mod3_mul64xN.S
python gen_update_fg.py 64 1277 1280 > final/sntrup1277/mod3_update_fg_64.S
python gen_update_VS.py 64 1277 1280 > final/sntrup1277/mod3_update_VS_64.S

# 128
python gen_polyinverse/gen.py 128 653 656 > final/sntrup653/jump1312divsteps_mod3_128.c
python polymul/gen_mul.py 128 653 656 > final/sntrup653/mod3_mul128xN.S
python polymul/gen_mul_last.py 32 653 656 > final/sntrup653/mod3_mul32xN.S
python gen_update_fg.py 128 653 656 > final/sntrup653/mod3_update_fg_128.S
python gen_update_VS.py 128 653 656 > final/sntrup653/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 761 768 > final/sntrup761/jump1536divsteps_mod3_128.c
python polymul/gen_mul.py 128 761 768 > final/sntrup761/mod3_mul128xN.S
python gen_update_fg.py 128 761 768 > final/sntrup761/mod3_update_fg_128.S
python gen_update_VS.py 128 761 768 > final/sntrup761/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 857 864 > final/sntrup857/jump1728divsteps_mod3_128.c
python polymul/gen_mul.py 128 857 864 > final/sntrup857/mod3_mul128xN.S
python polymul/gen_mul_last.py 64 857 864 > final/sntrup857/mod3_mul64xN_128.S
python gen_update_fg.py 128 857 864 > final/sntrup857/mod3_update_fg_128.S
python gen_update_VS.py 128 857 864 > final/sntrup857/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 953 960 > final/sntrup953/jump1920divsteps_mod3_128.c
python polymul/gen_mul.py 128 953 960 > final/sntrup953/mod3_mul128xN.S
python gen_update_fg.py 128 953 960 > final/sntrup953/mod3_update_fg_128.S
python gen_update_VS.py 128 953 960 > final/sntrup953/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 1013 1024 > final/sntrup1013/jump2048divsteps_mod3_128.c
python polymul/gen_mul.py 128 1013 1024 > final/sntrup1013/mod3_mul128xN.S
python gen_update_fg.py 128 1013 1024 > final/sntrup1013/mod3_update_fg_128.S
python gen_update_VS.py 128 1013 1024 > final/sntrup1013/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 1277 1280 > final/sntrup1277/jump2560divsteps_mod3_128.c
python polymul/gen_mul.py 128 1277 1280 > final/sntrup1277/mod3_mul128xN.S
python gen_update_fg.py 128 1277 1280 > final/sntrup1277/mod3_update_fg_128.S
python gen_update_VS.py 128 1277 1280 > final/sntrup1277/mod3_update_VS_128.S

# 256
python gen_polyinverse/gen.py 256 1013 1024 > final/sntrup1013/jump2048divsteps_mod3_256.c
python polymul/gen_mul.py 256 1013 1024 > final/sntrup1013/mod3_mul256xN.S
python gen_update_fg.py 256 1013 1024 > final/sntrup1013/mod3_update_fg_256.S
python gen_update_VS.py 256 1013 1024 > final/sntrup1013/mod3_update_VS_256.S

# NTRU
## 64
python gen_polyinverse/gen.py 64 508 512 > final/ntru509/jump1024divsteps_mod3_64.c
python polymul/gen_mul.py 64 508 512 > final/ntru509/mod3_mul64xN.S
python gen_update_fg.py 64 508 512 > final/ntru509/mod3_update_fg_64.S
python gen_update_VS.py 64 508 512 > final/ntru509/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 676 688 > final/ntru677/jump1376divsteps_mod3_64.c
python polymul/gen_mul_last.py 32 676 688 > final/ntru677/mod3_mul32xN.S
python polymul/gen_mul.py 64 676 688 > final/ntru677/mod3_mul64xN.S
python gen_update_fg.py 64 676 688 > final/ntru677/mod3_update_fg_64.S
python gen_update_VS.py 64 676 688 > final/ntru677/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 700 704 > final/ntru701/jump1408divsteps_mod3_64.c
python polymul/gen_mul.py 64 700 704 > final/ntru701/mod3_mul64xN.S
python gen_update_fg.py 64 700 704 > final/ntru701/mod3_update_fg_64.S
python gen_update_VS.py 64 700 704 > final/ntru701/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 820 832 > final/ntru821/jump1664divsteps_mod3_64.c
python polymul/gen_mul.py 64 820 832 > final/ntru821/mod3_mul64xN.S
python gen_update_fg.py 64 820 832 > final/ntru821/mod3_update_fg_64.S
python gen_update_VS.py 64 820 832 > final/ntru821/mod3_update_VS_64.S

## 128
python gen_polyinverse/gen.py 128 676 688 > final/ntru677/jump1376divsteps_mod3_128.c
python polymul/gen_mul.py 128 676 688 > final/ntru677/mod3_mul128xN.S
python gen_update_fg.py 128 676 688 > final/ntru677/mod3_update_fg_128.S
python gen_update_VS.py 128 676 688 > final/ntru677/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 700 704 > final/ntru701/jump1408divsteps_mod3_128.c
python polymul/gen_mul.py 128 700 704 > final/ntru701/mod3_mul128xN.S
python gen_update_fg.py 128 700 704 > final/ntru701/mod3_update_fg_128.S
python gen_update_VS.py 128 700 704 > final/ntru701/mod3_update_VS_128.S

python gen_polyinverse/gen.py 128 820 832 > final/ntru821/jump1664divsteps_mod3_128.c
python polymul/gen_mul.py 128 820 832 > final/ntru821/mod3_mul128xN.S
python gen_update_fg.py 128 820 832 > final/ntru821/mod3_update_fg_128.S
python gen_update_VS.py 128 820 832 > final/ntru821/mod3_update_VS_128.S
