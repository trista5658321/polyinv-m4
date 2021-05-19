import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from ntt_python.gen_wpad import inverse_modq, gen_iwpad, gen_wpad