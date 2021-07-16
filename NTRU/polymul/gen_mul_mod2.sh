#!/bin/bash

# NTRU
## 32
python ./gen_mul.py 32 508 512 > final/ntru509/mod2_mul32xN.S
# python ./gen_mul.py 32 676 688 > final/ntru677/mod2_mul32xN.S
python ./gen_mul.py 32 676 704 > final/ntru677/mod2_mul32xN.S

## 64
python ./gen_mul.py 64 508 512 > final/ntru509/mod2_mul64xN.S
python ./gen_mul.py 64 676 688 > final/ntru677/mod2_mul64xN.S
python ./gen_mul_last.py 32 676 688 > final/ntru677/mod2_mul32xN.S
# python ./gen_mul.py 64 676 704 > final/ntru677/mod2_mul64xN.S
python ./gen_mul.py 64 700 704 > final/ntru701/mod2_mul64xN.S
python ./gen_mul.py 64 820 832 > final/ntru821/mod2_mul64xN.S

## 128
## python ./gen_mul.py 128 676 688 > final/ntru677/mod2_mul128xN.S
# python ./gen_mul.py 128 676 704 > final/ntru677/mod2_mul128xN.S
# python ./gen_mul.py 128 700 704 > final/ntru701/mod2_mul128xN.S
# python ./gen_mul.py 128 820 832 > final/ntru821/mod2_mul128xN.S

