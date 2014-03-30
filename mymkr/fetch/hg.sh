# $1: package name
# $2: hg url
# $3: (optional) hg changeset to update to after initial clone
hgsrc() {
	test ! -z "${3}" && _HG_TAG="${3}"

	if [ ! -d $MYMKR_PREFIX/src/$1 ]
	then
		echo "$1 source dir does not exist, hg clone'ing..."
		hg -v clone $2 $MYMKR_PREFIX/src/$1 || die 'hg clone failed'
		# enable progress bars when updating
		# echo -e "\n[extensions]\nprogress =\n" >> $1/.hg/hgrc
		if [ ! -z "${_HG_TAG}" ]
		then
			cd $MYMKR_PREFIX/src/$1
			msg_info "using tag: ${_HG_TAG}";
			hg update ${_HG_TAG} || die "hg update ${_HG_TAG}"
			cd -
		fi
	else
		echo "$1 source dir exists, hg pull'ing..."
		cd $MYMKR_PREFIX/src/$1

		if [ ! -z "${_HG_TAG}" ]
		then
			msg_info "using tag: ${_HG_TAG}";
			hg update ${_HG_TAG} || die "hg update ${_HG_TAG}"
		fi

		hg -v pull --update || die 'hg pull failed'
		cd -
	fi
}
