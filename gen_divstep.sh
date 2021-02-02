#!/bin/bash

python gen_divstep.py 256 2 1 > jump768divsteps.S
python gen_divstep.py 256 1 2 >> jump768divsteps.S