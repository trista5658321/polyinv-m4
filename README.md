# Initial

https://github.com/mupq/pqm4/tree/master/crypto_kem/sntrup761/m4f

commit: f7a99d8fc54cdd509c0c6b5cfad86a38a659a8cd

|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|11349863|789446|742182|

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


## Current
|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|10544734|789444|742182|






