# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the ./configure command
common_autotools () {
	test -z "${_MAKE}" && _MAKE=1
	test -z "${_MAKE_INSTALL}" && _MAKE_INSTALL=1
	test -z "${_MAKE_ENV_OVERRIDE}" && _MAKE_ENV_OVERRIDE=0

 	cd $MYMKR_PREFIX/src/$1 || die "source dir does not exist?: $MYMKR_PREFIX/src/$1"
 	#make clean

 	if [ -f 'bootstrap' ]
 	then
 		sh bootstrap || die 'bootstrap failed'
 	fi

 	if [ -f './autogen.sh' ]
 	then
 		sh autogen.sh || die './autogen.sh failed'
 	fi

 	if [ -x './configure' ]
 	then
		export LDFLAGS="-L${MYMKR_PREFIX}/lib ${LDFLAGS}"
		export CPPFLAGS="-I$MYMKR_PREFIX/include ${CPPFLAGS}"
 		./configure --prefix=$MYMKR_PREFIX "${@:2}" || die 'configure failed'
	fi

	OPTS=
	if [ $_MAKE_ENV_OVERRIDE -eq 1 ]
	then
		OPTS='-e'
	fi

 	if [ $_MAKE -eq 0 ]
	then
		msg_warning "skipping make"
	else
		make $OPTS $JOBS || die 'make failed'
	fi

 	if [ $_MAKE_INSTALL -eq 0 ]
	then
		msg_warning "skipping make install"
	else
 		# PREFIX given again for packages without a configure script (like jack_oscrolloscope)
		make $OPTS PREFIX=$MYMKR_PREFIX install || die 'make install failed'
 	fi

	return 0
}
