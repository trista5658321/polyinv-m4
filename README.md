# Initial

https://github.com/mupq/pqm4/tree/master/crypto_kem/sntrup761/m4f

commit: f7a99d8fc54cdd509c0c6b5cfad86a38a659a8cd

|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|11349863|789446|742182|


# mod q ntt
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
做兩層 reduction 一次 (e.g. 65 "r" 43 "r" 21 "r" 0)

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


# Progress (4591_761)
## mod q
|      |8  |16 |32 |64 |128|256|512|753|768|1521|
|------|---|---|---|---|---|---|---|---|---|---|
| x2p2 | v | v | v | v | v | v | v | x | v | x |
| 2x2  | v | v | v | v | v | v | v | v | v |---|

## mod3
|      |16 |32 |64 |128|256|512|753|768|1521|
|------|---|---|---|---|---|---|---|---|---|
| x2p2 | v | v | v | v | v | v | x |---| x |
| 2x2  | v | v | v | v | v | v |---|---|---|

| N        |16      |32      |64      |128     |256     |512     |753|768|1521|
|----------|--------|--------|--------|--------|--------|--------|---|---|---|
| cycles   | -85665 | -84206 | -60567 | -52855 | -54199 | -35755 |---|---|---|
| codesize |  1640  |  4632  |  2424  |  3832  |  9360  |  31640 |---|---|---|
| code lines |  425  |  1173  |  645  |  1043  |  2613  |  8943 |---|---|---|


## Current
|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|10544734|789444|742182|



## mod3 v2
|      |761     |857    |
|------|--------|-------|
|Cycles|2255964 |2743298|