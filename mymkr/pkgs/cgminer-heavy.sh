gitsrc $1 https://github.com/reorder/cgminer_heavy
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O3 -Wall -march=native -mtune=native -I /opt/AMDAPP/include/'
export LDFLAGS="-L/opt/AMDAPP/lib/x86"
common_autotools $1 --enable-heavy --enable-opencl --enable-scrypt
