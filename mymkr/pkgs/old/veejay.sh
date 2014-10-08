# veejay consists of 3 parts: server client utils
# Dependencies include ffmpeg n0.8.15

D='veejay/veejay-current'
########################################################################
# veejay server
########################################################################

# old, known to work
_GIT_TAG=bf48249a2a88fc16538c869887fec6ca8c76a8dd

gitsrc $1 git://code.dyne.org/veejay.git

msg_info 'making veejay server'
_MAKE_CLEAN=1
_MAKE=1
_MAKE_INSTALL=1

# 2013-05-28 added LIBS='-lmjpegutils' to fix linking error

## DEBUG:
#./configure --prefix=$VEEJAY_PREFIX --enable-strict --enable-debug --enable-portleak LIBS='-lmjpegutils'

## PRODUCTION:
#./configure --prefix=$VEEJAY_PREFIX LIBS='-lmjpegutils'

common_autotools "$D/veejay-server" LIBS='-lmjpegutils' \
	|| die 'compile/install veejay-server failed'


########################################################################
# veejay client
########################################################################
msg_info 'making veejay client'
common_autotools "$D/veejay-client" LIBS='-lX11 -lm' \
	|| die 'compile/install veejay-client failed'


########################################################################
# veejay utils
########################################################################
msg_info 'making veejay utils'
common_autotools "$D/veejay-utils" || die 'compile/install veejay-utils failed'


########################################################################
# sendVIMS (requires puredata)
########################################################################
# msg_info 'making sendVIMS'
# common_autotools "$D/sendVIMS" || die 'compile/install sendVIMS failed'
