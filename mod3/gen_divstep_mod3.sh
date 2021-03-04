#!/bin/bash

python gen_divstep_mod3.py 8 > assembly/jump16divsteps_mod3.S
python gen_divstep_mod3.py 16 > assembly/jump32divsteps_mod3.S
python gen_divstep_mod3.py 32 > assembly/jump64divsteps_mod3.S
python gen_divstep_mod3.py 64 > assembly/jump128divsteps_mod3.S
python gen_divstep_mod3.py 128 > assembly/jump256divsteps_mod3.S
python gen_divstep_mod3.py 256 > assembly/jump512divsteps_mod3.S