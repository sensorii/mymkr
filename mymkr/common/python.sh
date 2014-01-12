# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the "setup.py install" command
common_python() {
	cd $MYMKR_PREFIX/src/$1 || exit 1
	python ./setup.py build || exit 1
	python ./setup.py install --prefix $MYMKR_PREFIX ${@:2} || exit 1
}
