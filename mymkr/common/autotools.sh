# $1: location in /src/ directory (usually package name)
# $2...: all other arguments get appended to the ./configure command
common_autotools () {
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
 		./configure --prefix=$MYMKR_PREFIX "${@:2}" || die 'configure failed'
	fi

 	if [ $_MAKE -eq 0 ]
	then
		msg_warning "skipping make"
	else
		make $JOBS || die 'make failed'
	fi

 	if [ $_MAKE_INSTALL -eq 0 ]
	then
		msg_warning "skipping make install"
	else
 		# PREFIX given again for packages without a configure script (like jack_oscrolloscope)
		make PREFIX=$MYMKR_PREFIX install || die 'make install failed'
 	fi

	return 0
}
