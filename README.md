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
| x2p2 | v |---|---|---|---|---| x |---| x |
| 2x2  | v |---|---|---|---|---|---|---|---|

|        |16      |32 |64 |128|256|512|753|768|1521|
|--------|--------|---|---|---|---|---|---|---|---|
| cycles | -84367 |---|---|---|---|---|---|---|---|

## Current
|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|10833614|789441|742181|
