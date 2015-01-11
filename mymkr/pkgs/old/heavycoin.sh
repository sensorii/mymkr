gitsrc $1 https://github.com/heavycoin/heavycoin.git
_COMMON_COIND_LEVELDB_FIX=1
export CFLAGS="-I$MYMKR_PREFIX/include"
export LIBPATHS="-L${MYMKR_PREFIX}/lib"
common_coind $1
