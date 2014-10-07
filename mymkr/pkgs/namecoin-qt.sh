gitsrc $1 https://github.com/namecoin-qt/namecoin-qt

cd $MYMKR_PREFIX/src/$1 || die "cd source dir failed"
export INCLUDEPATHS="-I$MYMKR_PREFIX/include"
export LIBPATHS="-L$MYMKR_PREFIX/lib"
qmake \
 "USE_UPNP=-" \
 INCLUDEPATH="$MYMKR_PREFIX/include" \
 LIBS="-L$MYMKR_PREFIX/lib" \
 DESTDIR="$MYMKR_PREFIX/bin" \
 || die "qmake failed"
make || die "make failed"
