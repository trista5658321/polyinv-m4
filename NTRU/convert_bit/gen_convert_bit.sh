#!/bin/bash

python b16to_4.py 32 > convert_bit_to_4_32.S
python b4to_16.py 32 > convert_bit_to_16_32.S

python b16to_4.py 512 > ntru509/convert_bit_to_4_512.S
python b4to_16.py 512 > ntru509/convert_bit_to_16_512.S
python b4to_16.py 544 > ntru509/convert_bit_to_16_544.S

python b16to_4.py 688 > ntru677/convert_bit_to_4_688.S
python b4to_16.py 704 > ntru677/convert_bit_to_16_704.S

python b16to_4.py 704 > ntru701/convert_bit_to_4_704.S
python b4to_16.py 736 > ntru701/convert_bit_to_16_736.S

python b16to_4.py 832 > ntru821/convert_bit_to_4_832.S
python b4to_16.py 864 > ntru821/convert_bit_to_16_864.S