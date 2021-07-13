#!/bin/bash

python b16to_4.py 32 > convert_bit_to_4_32.S
python b4to_16.py 32 > convert_bit_to_16_32.S

python b16to_4.py 512 > ntru509/convert_bit_to_4_512.S
python b4to_16.py 512 > ntru509/convert_bit_to_16_512.S
python b4to_16.py 544 > ntru509/convert_bit_to_16_544.S