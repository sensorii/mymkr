# $1: package name
common_coind ()
{
	test -z "${_COMMON_COIND_LEVELDB_FIX}" && _COMMON_COIND_LEVELDB_FIX=0

	cd $MYMKR_PREFIX/src/$1/src || die 'cd source dir failed'

	if [ $_COMMON_COIND_LEVELDB_FIX -eq 1 ]
	then
		# compile leveldb first with no env vars
		make PREFIX=$MYMKR_PREFIX USE_UPNP=- -f makefile.unix leveldb/libleveldb.a \
		 || die 'make leveldb failed'
	fi

	export CXXFLAGS="-I$MYMKR_PREFIX/include"
	export CPPFLAGS="-I$MYMKR_PREFIX/include"
	export LDFLAGS="-L${MYMKR_PREFIX}/lib"
	make $JOBS -e PREFIX=$MYMKR_PREFIX USE_UPNP=- -f makefile.unix || die 'make failed'
	cp -a "${1}d" $MYMKR_PREFIX/bin || die "could not install ${1}d"
}
