# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the "setup.py install" command
common_python() {
	cd $MYMKR_PREFIX/src/$1 || die 'common_python: could not access source directory'
	python ./setup.py build || die 'common_python: build failed'
	python ./setup.py install --prefix $MYMKR_PREFIX ${@:2} || die 'common_python: install failed'
}
