#!/bin/bash

# 32
python polymul/gen_polymul_32x32N_sch3.py 32 761 768 > assembly/mul.S
python gen_update_fg.py 32 761 768 > assembly/update_fg.S
python gen_update_VS.py 32 761 768 > assembly/update_VS.S

# 64
python polymul/gen_polymul_32x32N_sch3.py 64 761 768 > assembly/mul64xN.S

# for diff params
# python gen_polyinverse/gen.py 64 653 672 > final/sntrup653/jump1312divsteps_mod3_64.c
python gen_polyinverse/gen.py 64 653 672 > final/sntrup653/jump1344divsteps_mod3_64.c
python polymul/gen_mul.py 64 653 672 > final/sntrup653/mod3_mul64xN.S
# python polymul/gen_mul.py 32 653 672 > final/sntrup653/mod3_mul32xN.S
python gen_update_fg.py 64 653 672 > final/sntrup653/mod3_update_fg_64.S
python gen_update_VS.py 64 653 672 > final/sntrup653/mod3_update_VS_64.S

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