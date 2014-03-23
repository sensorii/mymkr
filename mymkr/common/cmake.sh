# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the cmake command
common_cmake() {
	test -z "${_MAKE}" && _MAKE=1
	test -z "${_MAKE_INSTALL}" && _MAKE_INSTALL=1
	test -z "${_MAKE_CLEAN}" && _MAKE_CLEAN=0
	test -z "${_MAKE_ENV_OVERRIDE}" && _MAKE_ENV_OVERRIDE=0

	cd $MYMKR_PREFIX/src

	if [ $_MAKE_CLEAN -eq 1 ]
	then
		msg_warning "make clean"
		rm -rf $1.build
	fi

	test -d $1.build || mkdir $1.build
	cd $MYMKR_PREFIX/src/$1.build
	cmake -D CMAKE_INSTALL_PREFIX=$MYMKR_PREFIX ${@:2} ../$1

	OPTS=
	if [ $_MAKE_ENV_OVERRIDE -eq 1 ]
	then
		OPTS='-e'
	fi

 	if [ $_MAKE -eq 0 ]
	then
		msg_warning "skipping make"
	else
		make $OPTS $JOBS PREFIX=$MYMKR_PREFIX || die 'make failed'
	fi

 	if [ $_MAKE_INSTALL -eq 0 ]
	then
		msg_warning "skipping make install"
	else
		make $OPTS install || die 'make install failed'
 	fi
}
