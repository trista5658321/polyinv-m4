#!/bin/bash

# jump 256
python gen_jumpdivsteps/gen_n_full.py 256 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump256divsteps.c
python gen_jumpdivsteps/gen_n_full.py 256 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump256divsteps.c
python gen_jumpdivsteps/gen_n_full.py 256 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump256divsteps.c

# jump 512
python gen_jumpdivsteps/gen_n_full.py 512 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump512divsteps.c
python gen_jumpdivsteps/gen_n_full.py 512 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump512divsteps.c
python gen_jumpdivsteps/gen_n_full.py 512 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump512divsteps.c

# jump 1024
# python gen_jumpdivsteps/.py 1024 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump1024divsteps.c
python gen_jumpdivsteps/gen_n_full_v2.py 1024 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump1024divsteps.c
python gen_jumpdivsteps/gen_1024.py 1024 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump1024divsteps.c












# === v1 ===
python v_1/gen_recip/gen_divsteps_653.py 512 653 656 > v_1/final/sntrup653/jump656divsteps.c



# 128
# python gen_polyinverse/gen.py 128 653 656 > final/sntrup653/jump1312divsteps_mod3_128.c
# python polymul/gen_mul.py 128 653 656 > final/sntrup653/mod3_mul128xN.S
# python polymul/gen_mul_last.py 32 653 656 > final/sntrup653/mod3_mul32xN.S
# python gen_update_fg.py 128 653 656 > final/sntrup653/mod3_update_fg_128.S
# python gen_update_VS.py 128 653 656 > final/sntrup653/mod3_update_VS_128.S

python v_2/gen_polyinverse/gen_divsteps.py 128 761 768 > v_2/assembly/sntrup761/jump1536divsteps_128.c

# python polymul/gen_mul.py 128 761 768 > final/sntrup761/mod3_mul128xN.S
# python gen_update_fg.py 128 761 768 > final/sntrup761/mod3_update_fg_128.S
# python gen_update_VS.py 128 761 768 > final/sntrup761/mod3_update_VS_128.S

# python gen_polyinverse/gen.py 128 857 864 > final/sntrup857/jump1728divsteps_mod3_128.c
# python polymul/gen_mul.py 128 857 864 > final/sntrup857/mod3_mul128xN.S
# python polymul/gen_mul_last.py 64 857 864 > final/sntrup857/mod3_mul64xN_128.S
# python gen_update_fg.py 128 857 864 > final/sntrup857/mod3_update_fg_128.S
# python gen_update_VS.py 128 857 864 > final/sntrup857/mod3_update_VS_128.S

# python gen_polyinverse/gen.py 128 953 960 > final/sntrup953/jump1920divsteps_mod3_128.c
# python polymul/gen_mul.py 128 953 960 > final/sntrup953/mod3_mul128xN.S
# python gen_update_fg.py 128 953 960 > final/sntrup953/mod3_update_fg_128.S
# python gen_update_VS.py 128 953 960 > final/sntrup953/mod3_update_VS_128.S

# python gen_polyinverse/gen.py 128 1013 1024 > final/sntrup1013/jump2048divsteps_mod3_128.c
# python polymul/gen_mul.py 128 1013 1024 > final/sntrup1013/mod3_mul128xN.S
# python gen_update_fg.py 128 1013 1024 > final/sntrup1013/mod3_update_fg_128.S
# python gen_update_VS.py 128 1013 1024 > final/sntrup1013/mod3_update_VS_128.S

# python gen_polyinverse/gen.py 128 1277 1280 > final/sntrup1277/jump2560divsteps_mod3_128.c
# python polymul/gen_mul.py 128 1277 1280 > final/sntrup1277/mod3_mul128xN.S
# python gen_update_fg.py 128 1277 1280 > final/sntrup1277/mod3_update_fg_128.S
# python gen_update_VS.py 128 1277 1280 > final/sntrup1277/mod3_update_VS_128.S

# # 256
# python gen_polyinverse/gen.py 256 1013 1024 > final/sntrup1013/jump2048divsteps_mod3_256.c
# python polymul/gen_mul.py 256 1013 1024 > final/sntrup1013/mod3_mul256xN.S
# python gen_update_fg.py 256 1013 1024 > final/sntrup1013/mod3_update_fg_256.S
# python gen_update_VS.py 256 1013 1024 > final/sntrup1013/mod3_update_VS_256.S
