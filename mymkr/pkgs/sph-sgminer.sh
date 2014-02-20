gitsrc $1 https://github.com/prettyhatemachine/sph-sgminer.git

_MAKE_ENV_OVERRIDE=1
export CFLAGS='-O3 -Wall -march=native -I /opt/AMDAPP/include/'
export LDFLAGS="-L/opt/AMDAPP/lib/x86"
common_autotools $1
