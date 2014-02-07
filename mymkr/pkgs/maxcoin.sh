# do git reset because of source file changed below
_GIT_RESET=1
gitsrc $1 https://github.com/Max-Coin/MaxCoin

cd $MYMKR_PREFIX/src/$1/src || die 'cd source dir failed'
#chmod u+x leveldb/build_detect_platform

export CPPFLAGS="-I$MYMKR_PREFIX/include"
export INCLUDEPATHS="-I$MYMKR_PREFIX/include"
export LIBPATHS="-L$MYMKR_PREFIX/lib"
#make -e PREFIX=$MYMKR_PREFIX USE_UPNP= || die "make failed"
make clean
make -e PREFIX=$MYUSR_PREFIX USE_UPNP=- -f makefile.unix || die 'make failed'
#cp -a bitcoind $MYUSR_PREFIX/bin
