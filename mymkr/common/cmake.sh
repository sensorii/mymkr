# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the cmake command
common_cmake() {
	cd $MYMKR_PREFIX/src
	rm -rf $1.build
	test -d $1.build || mkdir $1.build
	cd $MYMKR_PREFIX/src/$1.build

	cmake -D CMAKE_INSTALL_PREFIX=$MYMKR_PREFIX ${@:2} ../$1
	make $JOBS && make install
}
