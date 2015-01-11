fetch_wget $1 http://setup.hashfast.com/cgminer-3.9.0h2.tar.gz

_MAKE_INSTALL=0
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O2 -Wall -march=native'
common_autotools $1 '--enable-hashfast'

cp $MYMKR_PREFIX/src/$1/cgminer $MYMKR_PREFIX/bin/$1 || die 'manual install failed'
msg_warning "manually installed cgminer --> $MYMKR_PREFIX/bin/$1"
