# $1: package name
# $2: git url
# $3: (optional) git tag or branch to checkout
gitsrc() {
	test -z "${_GIT_RESET}" && _GIT_RESET=0
	test ! -z "${3}" && _GIT_TAG="${3}"

	if [ ! -d $MYMKR_PREFIX/src/$1 ]
	then
		msg_info "$1 source dir does not exist, git clone'ing..."
		git clone $2 $MYMKR_PREFIX/src/$1 || die "git clone failed"
	else
		msg_info "$1 source dir exists, git pull'ing..."
		cd $MYMKR_PREFIX/src/$1

		if [ $_GIT_RESET -eq 1 ]
		then
			# http://stackoverflow.com/a/4550966
			msg_warning 'performing git reset --hard HEAD'
			git reset --hard HEAD
		fi
		git pull || die 'git pull failed'
		cd -
	fi

	if [ ! -z "${_GIT_TAG}" ]
	then
		cd $MYMKR_PREFIX/src/$1
		git checkout -b ${_GIT_TAG} ${_GIT_TAG} || die "git checkout -b ${_GIT_TAG} ${_GIT_TAG}"
		cd -
	fi
}
