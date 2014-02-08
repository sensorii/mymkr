gitsrc $1 https://github.com/Max-Coin/MaxCoin

cd $MYMKR_PREFIX/src/$1/src || die 'cd source dir failed'
export CXXFLAGS="-I$MYMKR_PREFIX/include"
export LDFLAGS="-L${MYMKR_PREFIX}/lib"
make -e PREFIX=$MYMKR_PREFIX USE_UPNP=- -f makefile.unix || die 'make failed'
cp -a maxcoind $MYMKR_PREFIX/bin || die 'could not install maxcoind'
