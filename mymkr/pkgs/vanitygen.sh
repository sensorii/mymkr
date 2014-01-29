gitsrc $1 https://github.com/samr7/vanitygen.git
cd $MYMKR_PREFIX/src/$1 || die "source dir not found"
export CFLAGS="-I$MYMKR_PREFIX/include -L$MYMKR_PREFIX/lib"
make clean || die "make clean failed"
make -e || die "make failed"
cp -a vanitygen $MYMKR_PREFIX/bin || die "vanitygen executable not accessible"
cp -a keyconv $MYMKR_PREFIX/bin/vanitygen-keyconv || die "keyconv executable not accessible"
