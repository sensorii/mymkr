# $1: package name
common_coinqt ()
{
	cd $MYMKR_PREFIX/src/$1 || die "cd source dir failed"
	qmake \
	 "USE_UPNP=-" \
	 INCLUDEPATH="$MYMKR_PREFIX/include" \
	 LIBS="-L$MYMKR_PREFIX/lib" \
	 DESTDIR="$MYMKR_PREFIX/bin" \
	 || die 'qmake failed'
	make $JOBS || die 'make failed'
}
