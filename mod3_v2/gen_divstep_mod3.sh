#!/bin/bash

python gen_polymul_32x32N_sch3.py > mul.S
python gen_update_fg.py > update_fg.S