# USE same source as mintcoin
PKG=mintcoin

gitsrc $PKG https://github.com/mintcoinproject/mintcoin.git

cd $MYMKR_PREFIX/src/$PKG || die "cd source dir failed"
qmake \
 "USE_UPNP=-" \
 INCLUDEPATH="$MYMKR_PREFIX/include" \
 LIBS="-L$MYMKR_PREFIX/lib" \
 DESTDIR="$MYMKR_PREFIX/bin" \
 || die 'qmake failed'
make $JOBS || die 'make failed'
