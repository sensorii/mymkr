# $1: package name
# $2: git url
# $3: (optional) git tag or branch to checkout
gitsrc() {
	if [ ! -d $MYMKR_PREFIX/src/$1 ]
	then
		msg_info "$1 source dir does not exist, git clone'ing..."
		git clone $2 $MYMKR_PREFIX/src/$1 || die "git clone failed"
	else
		msg_info "$1 source dir exists, git pull'ing..."
		cd $MYMKR_PREFIX/src/$1
		git pull || die "git pull failed"
		cd -
	fi

	if [ ! -z "$3" ]
	then
		cd $MYMKR_PREFIX/src/$1
		git checkout $3 || die "git checkout $3"
		cd -
	fi
}
