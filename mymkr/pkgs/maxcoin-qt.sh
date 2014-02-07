# :NOTE: depends on cryptopp

# USE same source as maxcoin
PKG=maxcoin

# do git reset because of source file changed by pkg/maxcoin
_GIT_RESET=1
gitsrc $PKG https://github.com/Max-Coin/MaxCoin

cd $MYMKR_PREFIX/src/$PKG || die "cd source dir failed"
qmake \
 "USE_UPNP=-" \
 INCLUDEPATH="$MYMKR_PREFIX/include" \
 LIBS="-L$MYMKR_PREFIX/lib" \
 DESTDIR="$MYMKR_PREFIX/bin" \
 || die 'qmake failed'
make || die 'make failed'
