#!/bin/bash

# jump 256
python gen_jumpdivsteps/gen_n_full.py 256 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump256divsteps.c
python gen_jumpdivsteps/gen_n_full.py 256 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump256divsteps.c
python gen_jumpdivsteps/gen_n_full.py 256 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump256divsteps.c
python gen_jumpdivsteps/gen_n_full.py 256 7879 > jumpdivstep/big_prime_ntt/sntrup1277/jump256divsteps.c

# jump 512
python gen_jumpdivsteps/gen_n_full.py 512 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump512divsteps.c
python gen_jumpdivsteps/gen_n_full.py 512 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump512divsteps.c
python gen_jumpdivsteps/gen_n_full.py 512 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump512divsteps.c
python gen_jumpdivsteps/gen_n_full.py 512 7879 > jumpdivstep/big_prime_ntt/sntrup1277/jump512divsteps.c

# jump 1024
# python gen_jumpdivsteps/.py 1024 5167 > jumpdivstep/big_prime_ntt/sntrup857/jump1024divsteps.c
python gen_jumpdivsteps/gen_n_full_v2.py 1024 6343 > jumpdivstep/big_prime_ntt/sntrup953/jump1024divsteps.c
python gen_jumpdivsteps/gen_1024.py 1024 7177 > jumpdivstep/big_prime_ntt/sntrup1013/jump1024divsteps.c
python gen_jumpdivsteps/gen_n_full.py 1024 7879 > jumpdivstep/big_prime_ntt/sntrup1277/jump1024divsteps.c


# === v1 ===
python v_1/gen_recip/gen_divsteps_653.py 512 653 656 > v_1/final/sntrup653/jump656divsteps.c
python v_2/gen_polyinverse/gen_divsteps.py 128 761 768 > v_2/assembly/sntrup761/jump1536divsteps_128.c