# deps:
# ffmpeg
#_GIT_TAG=
gitsrc $1 git://code.dyne.org/veejay.git

msg_info 'making veejay server'
_MAKE_CLEAN=1
_MAKE_INSTALL=1
_MAKE=1

## DEBUG:
#./configure --prefix=$VEEJAY_PREFIX --enable-strict --enable-debug --enable-portleak
#./configure --prefix=$VEEJAY_PREFIX --enable-strict --enable-debug --enable-portleak LIBS='-lmjpegutils'

### PRODUCTION:
# 2013-05-28 added LIBS='-lmjpegutils' to fix linking error
#./configure --prefix=$VEEJAY_PREFIX LIBS='-lmjpegutils'

JOBS='-j1'
D='veejay/veejay-current/veejay'
common_autotools "$D-server" --prefix=$MYMKR_PREFIX || die 'veejay-server failed'


#msg_info 'making veejay client'
#
#
#msg_info 'making veejay utils'
