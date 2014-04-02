# $1: URL
# $2: archive type - detected by default, argument enforces archive type to extract
fetch_wget() {
	test -z "${_EXTRACT_ARCHIVE}" && _EXTRACT_ARCHIVE=1
	_URL=$1
	_PKG=$(basename $_URL)

	if [ -f $MYMKR_PREFIX/src/$_PKG ]
	then
		msg_warning 'source exists, considering fetched'
	else
		cd $MYMKR_PREFIX/src
		$WGET "$_URL" || die "wget failed: $_URL"
	fi

	if [ $_EXTRACT_ARCHIVE -eq 0 ]
	then
		msg_warning "skipping extract"
	else
		cd $MYMKR_PREFIX/src
		if [ -z "$2" ]
		then
			# Reference: http://stackoverflow.com/a/965072
			extension="${_PKG##*.}"
			(echo $_PKG | egrep -q "\.tar\.gz\$") && extension='tgz'
			(echo $_PKG | egrep -q "\.tar\.bz2\$") && extension='tbz2'
		else
			extension="$2"
		fi

		case ${extension} in
			tgz|tar.gz)
				tar -xzf $_PKG || die "xtract archive failed"
				;;

			tbz2|tar.bz2)
				tar -xjf $_PKG || die "xtract archive failed"
				;;

			zip)
				unzip $_PKG || die "unzip failed"
				;;

			*)
				die "unknown archive type: $extension"
				;;
		esac
	fi
}
