gitsrc $1 https://github.com/h2o-coin/H2Ocoin.git

mkdir $MYMKR_PREFIX/src/$1/src/obj
chmod u+x $MYMKR_PREFIX/src/$1/src/leveldb/build_detect_platform

_COMMON_COIND_LEVELDB_FIX=1
common_coind $1
