# $1: package name
# $2: URL
# $3: archive type - detected by default, argument enforces archive type to extract
fetch_wget() {
	URL=$2
	test -z "$WGET" && _WGET='wget'

	if [ -d $MYMKR_PREFIX/src/$1 ]
	then
		msg_warning "source exists, considering fetched"
	else
		cd $MYMKR_PREFIX/src
		PKG=$(basename $URL)
		if [ ! -f $PKG ]
		then
			$WGET "$URL" || die "wget failed: $URL"
		fi

		if [ -z "$3" ]
		then
			# Reference: http://stackoverflow.com/a/965072
			#filename=$(basename "$URL")
			extension="${PKG##*.}"
			#A="${filename%.*}"
		else
			extension="$3"
		fi

		case ${extension} in
			tgz|tar.gz)
				tar -xzf $PKG || die "xtract archive failed"
				;;

			tbz2|tar.bz2)
				tar -xjf $PKG || die "xtract archive failed"
				;;

			zip)
				unzip $PKG || die "unzip failed"
				;;

			*)
				die "unknown archive type: $A"
				;;
		esac
	fi
}
