gitsrc $1 https://github.com/Bufius/vertminer-gpu.git

# compile and install
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O3 -Wall -march=native -I /opt/AMDAPP/include/'
export LDFLAGS="-L/opt/AMDAPP/lib/x86"
common_autotools $1 --enable-scrypt --enable-opencl
