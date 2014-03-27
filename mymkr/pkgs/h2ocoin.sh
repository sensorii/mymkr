gitsrc $1 https://github.com/CoinDev-io/H2O

mkdir $MYMKR_PREFIX/src/$1/src/obj
chmod u+x $MYMKR_PREFIX/src/$1/src/leveldb/build_detect_platform

_COMMON_COIND_BIN_NAME=H2Od
_COMMON_COIND_LEVELDB_FIX=1
common_coind $1
