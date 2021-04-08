#!/bin/bash

# 32
python polymul/gen_polymul_32x32N_sch3.py 32 761 768 > assembly/mul.S
python gen_update_fg.py 32 761 768 > assembly/update_fg.S
python gen_update_VS.py 32 761 768 > assembly/update_VS.S

# 64
python polymul/gen_polymul_32x32N_sch3.py 64 761 768 > assembly/mul64xN.S

# for diff params
python gen_polyinverse/gen.py 64 761 768 > final/sntrup761/jump1536divsteps_mod3_64.c
python polymul/polymul_N1xN_sch3_componemt.py 64 761 768 > final/sntrup761/mod3_mul64xN.S
python gen_update_fg.py 64 761 768 > final/sntrup761/mod3_update_fg_64.S
python gen_update_VS.py 64 761 768 > final/sntrup761/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 857 864 > final/sntrup857/jump1728divsteps_mod3_64.c
python polymul/polymul_N1xN_sch3_componemt.py 64 857 864 > final/sntrup857/mod3_mul64xN.S
python gen_update_fg.py 64 857 864 > final/sntrup857/mod3_update_fg_64.S
python gen_update_VS.py 64 857 864 > final/sntrup857/mod3_update_VS_64.S

python gen_polyinverse/gen.py 64 953 960 > final/sntrup953/jump1920divsteps_mod3_64.c
python polymul/polymul_N1xN_sch3_componemt.py 64 953 960 > final/sntrup953/mod3_mul64xN.S
python gen_update_fg.py 64 953 960 > final/sntrup953/mod3_update_fg_64.S
python gen_update_VS.py 64 953 960 > final/sntrup953/mod3_update_VS_64.S