gitsrc $1 https://github.com/ig0tik3d/darkcoin-cpuminer-1.2c.git
_MAKE_ENV_OVERRIDE=1
#export CFLAGS='-O3 -march=native'
export CFLAGS='-O3 -msse2'
common_autotools $1
