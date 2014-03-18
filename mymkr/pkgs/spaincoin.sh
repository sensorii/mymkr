gitsrc $1 https://github.com/SpainCoinProject/spaincoin.git
mkdir $MYMKR_PREFIX/src/$1/src/obj
_COMMON_COIND_LEVELDB_FIX=1
common_coind $1
