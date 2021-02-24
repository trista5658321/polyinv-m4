#!/bin/bash

python gen_divstep_mod3.py 8 > assembly/jump16divsteps_mod3.S
python gen_divstep_mod3.py 16 > assembly/jump32divsteps_mod3.S