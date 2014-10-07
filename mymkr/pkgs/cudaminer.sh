_GIT_RESET=1
gitsrc $1 https://github.com/cbuchner1/CudaMiner.git

_MAKE_ENV_OVERRIDE=1
export LIBS='-lcrypto'
export JANSSON_INCLUDES="-I${MYMKR_PREFIX}/include"
common_autotools $1 --with-cuda="${MYMKR_PREFIX}/opt/cuda"
