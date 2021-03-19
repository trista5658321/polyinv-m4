import sys

BASE = 0 # jump N divsteps

def get_BASE():
    argv_len = len(sys.argv)
    if argv_len > 1:
        BASE = int(sys.argv[1])
    
    return BASE
