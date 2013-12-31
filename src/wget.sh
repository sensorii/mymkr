# $1: package name
# $2: package version
# $3: URL to package
# $4: packaging postfix, defaults to "tar.gz"
wgetsrc() {
	if [ -z "$4" ]
	then
		PKG='tar.gz'
	else
		PKG=$4
	fi

	if [ ! -d $MYMKR_PREFIX/src/$1-$2 ]
	then
		cd $MYMKR_PREFIX/src
		test ! -f $1-$2.$PKG && (wget $3 || exit 1)

		case $PKG in
			tgz|tar.gz)
				tar -xzf $1-$2.$PKG || exit 1
				;;

			tbz2|tar.bz2)
				tar -xjf $1-$2.$PKG || exit 1
				;;
			zip)
				echo ":TODO: wgetsrc .zip" && exit 1
				;;
		esac
	fi
}
