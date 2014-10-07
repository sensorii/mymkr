gitsrc $1 'https://github.com/Max-Coin/cpuminer.git'

export CFLAGS='-O3 -msse2 -Wall -march=native'
_MAKE=1
_MAKE_INSTALL=0
common_autotools $1

msg_warning 'manually installing minerd --> bin/maxcoin-cpuminerd'
cd $MYMKR_PREFIX/src/$1
strip minerd
mv minerd $MYMKR_PREFIX/bin/maxcoin-cpuminerd
