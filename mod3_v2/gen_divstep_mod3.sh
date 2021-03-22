#!/bin/bash

# 32
python gen_polymul_32x32N_sch3.py 32 > mul.S
python gen_update_fg.py 32 > update_fg.S
python gen_update_VS.py 32 > update_VS.S

# 64
python gen_polymul_32x32N_sch3.py 64 > assembly/mul64xN.S
python gen_update_fg.py 64 > assembly/update_fg_64.S
python gen_update_VS.py 64 > assembly/update_VS_64.S