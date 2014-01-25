gitsrc $1 https://github.com/samr7/vanitygen.git
cd $MYMKR_PREFIX/src/$1
export CFLAGS="-I$MYMKR_PREFIX/include -L$MYMKR_PREFIX/lib"
make clean
make -e
