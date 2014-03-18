_GIT_RESET=1
gitsrc $1 'https://github.com/reorder/cgminer_skein.git'
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O3 -Wall -march=native -I /opt/AMDAPP/include/'
export LDFLAGS="-L/opt/AMDAPP/lib/x86"
common_autotools $1 --enable-skein --enable-keccak --enable-scrypt --enable-opencl
