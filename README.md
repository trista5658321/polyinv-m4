# Initial

https://github.com/mupq/pqm4/tree/master/crypto_kem/sntrup761/m4f

commit: f7a99d8fc54cdd509c0c6b5cfad86a38a659a8cd

|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|11349863|789446|742182|

# Progress (4591_761)
|      |8  |16 |32 |64 |128|256|512|753|768|1521|
|------|---|---|---|---|---|---|---|---|---|---|
| x2p2 | v | v | v | v | v | v | v | x |---| x |
| 2x2  |---|---|---| v | v | v | v |---|---|---|

## Current
|keypair cycles|encaps cycles|decaps cycles|
|---|---|---|
|11121863|789443|742181|

# Optimization
## x2p2
|         |8  |16 |32 |64 |128|256|512|
|---------|---|---|---|---|---|---|---|
| keypair |11290363|11259336|11240247|11230215|11207951|11186664|---|
| encaps  |789446  |789445  |789444  |789446  |789443  |789441|---|
| decaps  |742182  |742182  |742181  |742182  |742181  |742180|---|
