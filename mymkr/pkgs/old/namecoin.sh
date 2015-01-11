gitsrc $1 https://github.com/namecoin/namecoin.git

cd $MYMKR_PREFIX/src/$1/src || die "cd source dir failed"
export INCLUDEPATHS="-I$MYMKR_PREFIX/include"
export LIBPATHS="-L$MYMKR_PREFIX/lib"
make -e PREFIX=$MYMKR_PREFIX USE_UPNP= || die "make failed"
cp -a namecoind $MYMKR_PREFIX/bin
