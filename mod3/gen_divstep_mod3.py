import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import LENGTH, LENGTH_1, LENGTH_2
import x2p2.j16_x2p2_mod3 as j16_p
import _2x2.j16_2x2_mod3 as j16_2x2

if LENGTH*2 == 16:
    j16_p.main()
    j16_2x2.main()