# $1: location in /src/ directory (usually package name)
common_waf() {
	cd $MYMKR_PREFIX/src/$1 || exit 1
	./waf configure --prefix=$MYMKR_PREFIX || exit 1
	(./waf build $JOBS && ./waf install) || exit 1
}
