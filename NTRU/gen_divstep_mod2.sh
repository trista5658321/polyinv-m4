#!/bin/bash
# NTRU
## 32
python gen_poly_r2_inv.py 32 508 512 > final/ntru509/poly_r2_inv_jumpdivsteps.c
python gen_jumpdivstep.py 32 508 512 > final/ntru509/jump1024divsteps_mod2_32.c
python gen_update_fg.py 32 508 512 > final/ntru509/mod2_update_fg_32.S
python gen_update_VS.py 32 508 512 > final/ntru509/mod2_update_VS_32.S

## 64
python gen_jumpdivstep.py 64 508 512 > final/ntru509/jump1024divsteps_mod2_64.c
# python gen_update_fg.py 64 508 512 > final/ntru509/mod2_update_fg_64.S
# python gen_update_VS.py 64 508 512 > final/ntru509/mod2_update_VS_64.S

# python gen_jumpdivstep.py 64 676 688 > final/ntru677/jump1376divsteps_mod2_64.c
# python gen_update_fg.py 64 676 688 > final/ntru677/mod2_update_fg_64.S
# python gen_update_VS.py 64 676 688 > final/ntru677/mod2_update_VS_64.S
python gen_jumpdivstep.py 64 676 704 > final/ntru677/jump1408divsteps_mod2_64.c
# python gen_update_fg.py 64 676 704 > final/ntru677/mod2_update_fg_64.S
# python gen_update_VS.py 64 676 704 > final/ntru677/mod2_update_VS_64.S

python gen_jumpdivstep.py 64 700 704 > final/ntru701/jump1408divsteps_mod2_64.c
# python gen_update_fg.py 64 700 704 > final/ntru701/mod2_update_fg_64.S
# python gen_update_VS.py 64 700 704 > final/ntru701/mod2_update_VS_64.S

python gen_jumpdivstep.py 64 820 832 > final/ntru821/jump1664divsteps_mod2_64.c
# python gen_update_fg.py 64 820 832 > final/ntru821/mod2_update_fg_64.S
# python gen_update_VS.py 64 820 832 > final/ntru821/mod2_update_VS_64.S

# ## 128
# python gen.py 128 676 688 > final/ntru677/jump1376divsteps_mod2_128.c
# python gen_update_fg.py 128 676 688 > final/ntru677/mod2_update_fg_128.S
# python gen_update_VS.py 128 676 688 > final/ntru677/mod2_update_VS_128.S

# python gen.py 128 700 704 > final/ntru701/jump1408divsteps_mod2_128.c
# python gen_update_fg.py 128 700 704 > final/ntru701/mod2_update_fg_128.S
# python gen_update_VS.py 128 700 704 > final/ntru701/mod2_update_VS_128.S

# python gen.py 128 820 832 > final/ntru821/jump1664divsteps_mod2_128.c
# python gen_update_fg.py 128 820 832 > final/ntru821/mod2_update_fg_128.S
# python gen_update_VS.py 128 820 832 > final/ntru821/mod2_update_VS_128.S
