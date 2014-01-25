OPENSSL_GIT=https://github.com/openssl/openssl.git
OPENSSL_BRANCH=OpenSSL_1_0_1-stable
OPENSSL_TAG=OpenSSL_1_0_1f

# make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
JOBS='-j1'

if [ ! -d $MYMKR_PREFIX/src/$1 ]
then
	git clone -b $OPENSSL_BRANCH --single-branch $OPENSSL_GIT $MYMKR_PREFIX/src/$1
else
	cd $MYMKR_PREFIX/src/$1
	git pull
fi

cd $MYMKR_PREFIX/src/$1 || die "source directory does not exist"
git checkout $OPENSSL_TAG || die "git checkout tag '$OPENSSL_TAG' failed"
./config shared \
 --prefix=$MYMKR_PREFIX \
 --openssldir=$MYMKR_PREFIX/openssl \
 -fPIC || die "openssl: config failed"

make clean
make $JOBS || die "openssl: make failed"
make test || die "openssl: make test failed" 
make install_sw || die "openssl: make install failed"
