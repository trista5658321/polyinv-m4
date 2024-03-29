import sys

LENGTH = -1
argv_len = len(sys.argv)
if argv_len > 1:
    LENGTH = int(sys.argv[1])

assert(LENGTH > 0)

import x2p2.j16_x2p2_mod2 as j16_p
import x2p2.j32_x2p2_mod2 as j32_p
import x2p2.j64_x2p2_mod2 as j64_p
import x2p2.jN_x2p2_mod2 as jN_p

import _2x2.j16_2x2_mod2 as j16_2x2
import _2x2.j32_2x2_mod2 as j32_2x2
import _2x2.j64_2x2_mod2 as j64_2x2
import _2x2.jN_2x2_mod2 as jN_2x2

if LENGTH == 16:
    j16_p.main()
    print("")
    j16_2x2.main()

elif LENGTH == 32:
    j32_p.main()
    print("")
    j32_2x2.main()

elif LENGTH == 64:
    j64_p.main()
    print("")
    j64_2x2.main()

else:
    jN_p.main()
    print("")
    jN_2x2.main()
