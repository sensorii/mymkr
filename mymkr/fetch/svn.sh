# $1: package name
# $2: svn url
svnsrc() {
	if [ ! -d $MYMKR_PREFIX/src/$1 ]
	then
		echo "$1 source dir does not exist, svn co'ing..."
		svn co $2 $MYMKR_PREFIX/src/$1
	else
		echo "$1 source dir exists, svn update'ing..."
		cd $MYMKR_PREFIX/src/$1
		svn update
		cd -
	fi
}
