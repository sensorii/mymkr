_GIT_RESET=1
gitsrc $1 'https://github.com/reorder/cgminer_keccak.git'
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O3 -Wall -march=native'
common_autotools $1 --enable-keccak --enable-opencl
