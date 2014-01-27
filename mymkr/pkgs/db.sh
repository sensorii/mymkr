# http://www.oracle.com/technetwork/products/berkeleydb/downloads/index.html
V=4.8.30
SRC='http://download.oracle.com/berkeley-db/db-4.8.30.tar.gz'
wgetsrc $1 $V $SRC

cd $MYMKR_PREFIX/src/$1-$V/build_unix || die "cd src dir failed"
../dist/configure --prefix=$MYMKR_PREFIX --enable-cxx || die "configure failed"
make || die "make failed"
make install || die "make install failed"
