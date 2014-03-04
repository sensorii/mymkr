# $1: package name
common_coind ()
{
	test -z "${_COMMON_COIND_LEVELDB_FIX}" && _COMMON_COIND_LEVELDB_FIX=0
	test -z "${_COMMON_COIND_BIN_NAME}" && _COMMON_COIND_BIN_NAME="${1}d"

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
	cp -a "${_COMMON_COIND_BIN_NAME}" $MYMKR_PREFIX/bin \
	 || die "could not install ${_COMMON_COIND_BIN_NAME}"
}
