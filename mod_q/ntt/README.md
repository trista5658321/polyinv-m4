
# NTT-big prime
# 16bit
- intt 完結果需再乘 (2^layer)^-1 % q1，此運算保留至 crt 再做

## ntt
- input: +-q/2
- output: 16bit or +-q/2

## basemul_x
使 input 往右位移一位（ input *= x）
- input: 16bit or +-q/2
- output: +-q/2

## basemul
- input: 16bit or +-q/2
- output: +-q/2

## intt
- input: +-q (e.g. u2u1x + v2r1 )
- output: 16bit
- final ans = output value * (2^layer)^-1 % q1
- 兩層 reduction 一次 (e.g. 65 "r" 43 "r" 21 "r" 0)
    - q <= 7681

# 32bit
- basemul 完結果需再乘 2^32 % q0，此運算保留至 crt 再做
- intt 完結果需再乘 (2^layer)^-1 % q0，此運算保留至 crt 再做

## ntt
- input: +- q/2
- output: 32bit or +-q0
- 只有乘完 w 才做 montgomery reduction (w 已預先 * 2^32)

## basemul_x
使 input 往右位移一位（ input *= x）
- input: 32bit or +-q0
- output: 32bit or +-q0
- 乘完 w 做 montgomery reduction (w 已預先 * 2^32)

## basemul
- input: 32bit
- output: +-q0
- final ans = output value * 2^32 % q0
- 乘完 w 做 montgomery reduction (w 已預先 * 2^32)
- 最終底層係數加完，再做一次 montgomery reduction

## intt
- input: +-q0
- output: 32bit, +-q0
- final ans = output value * (2^32) * (2^layer)^-1 % q0
- 只有乘完 w 才做 montgomery reduction (w 已預先 * 2^32)
