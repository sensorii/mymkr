gitsrc $1 https://github.com/evan82/darkcoin.git

cd $MYMKR_PREFIX/src/$1/src || die 'cd source dir failed'

# compile leveldb first with no env vars
make PREFIX=$MYMKR_PREFIX USE_UPNP=- -f makefile.unix leveldb/libleveldb.a \
 || die 'make leveldb failed'

# compile the rest with  env vars
export CPPFLAGS="-I$MYMKR_PREFIX/include"
export CXXFLAGS="-I$MYMKR_PREFIX/include"
export LDFLAGS="-L${MYMKR_PREFIX}/lib"
make $JOBS -e PREFIX=$MYMKR_PREFIX USE_UPNP=- -f makefile.unix || die 'make failed'

cp -a darkcoind $MYMKR_PREFIX/bin || die 'could not install darkcoind'
