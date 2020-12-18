from utility import LENGTH
import gen_x2p2
import gen_x2p2_toom
import gen_2x2

if LENGTH < 128:
    gen_x2p2.main()
else:
    gen_x2p2_toom.main()
print("\n")
gen_2x2.main()