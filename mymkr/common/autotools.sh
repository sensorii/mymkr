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
 		(make $JOBS && make install) || die 'make failed'
 	else
 		# for packages without a configure script (like jack_oscrolloscope)
 		(make $JOBS && make PREFIX=$MYMKR_PREFIX install) || die 'make failed'
 	fi

	return 0
}
