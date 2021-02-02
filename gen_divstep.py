from utility import LENGTH, LENGTH_1, LENGTH_2
import gen_x2p2
import gen_x2p2_toom
import gen_2x2

import gen_x2p2_stack
import gen_2x2_512

if LENGTH < 256:
    if LENGTH < 128:
        gen_x2p2.main()
    else:
        gen_x2p2_toom.main()
    print("\n")
    gen_2x2.main()

if LENGTH == 256:
    if LENGTH_1 > LENGTH_2:
        gen_x2p2_stack.main()
    else:
        gen_x2p2_stack.main(True)
        gen_2x2_512.main(True)
