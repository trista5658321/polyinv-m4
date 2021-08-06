#!/bin/bash

# 653
python gen_divstep.py 32 653 > mod_q/jumpdivstep/sntrup653/_jump64divsteps.S
python gen_divstep.py 64 653 > mod_q/jumpdivstep/sntrup653/_jump128divsteps.S

# 761
python gen_divstep.py 32 761 > mod_q/jumpdivstep/sntrup761/_jump64divsteps.S
python gen_divstep.py 64 761 > mod_q/jumpdivstep/sntrup761/_jump128divsteps.S

# 857
python gen_divstep.py 32 857 > mod_q/jumpdivstep/sntrup857/_jump64divsteps.S
python gen_divstep.py 64 857 > mod_q/jumpdivstep/sntrup857/_jump128divsteps.S

# 953
python gen_divstep.py 32 953 > mod_q/jumpdivstep/sntrup953/_jump64divsteps.S
python gen_divstep.py 64 953 > mod_q/jumpdivstep/sntrup953/_jump128divsteps.S

# 1013
python gen_divstep.py 32 1013 > mod_q/jumpdivstep/sntrup1013/_jump64divsteps.S
python gen_divstep.py 64 1013 > mod_q/jumpdivstep/sntrup1013/_jump128divsteps.S

# 1277
python gen_divstep.py 32 1277 > mod_q/jumpdivstep/sntrup1277/_jump64divsteps.S
python gen_divstep.py 64 1277 > mod_q/jumpdivstep/sntrup1277/_jump128divsteps.S

python gen_divstep.py 32 761 > jump64divsteps.S
python gen_divstep.py 64 761 > jump128divsteps.S

python gen_divstep.py 256 2 1 761 > jump768divsteps.S
python gen_divstep.py 256 1 2 761 >> jump768divsteps.S