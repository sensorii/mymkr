_GIT_TAG='v0.10.28'
gitsrc $1 https://github.com/joyent/node.git

#opts='--debug'
opts=

case ${MYMKR_PROFILE} in
	# avoid npm/node segfault on arm platform
	beagleboneblack) opts="${opts} --without-snapshot" ;;
esac

common_autotools $1 ${opts}
