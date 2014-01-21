# $1: package name
# $2: hg url
# $3: (optional) hg changeset to update to after initial clone
hgsrc() {
	if [ ! -d $MYMKR_PREFIX/src/$1 ]
	then
		echo "$1 source dir does not exist, hg clone'ing..."

		cd $MYMKR_PREFIX/src/ || exit 1
		hg -v clone $2 || exit 1
		# enable progress bars when updating
		echo -e "\n[extensions]\nprogress =\n" >> $1/.hg/hgrc
		cd -

		cd $MYMKR_PREFIX/src/$1
		test ! -z "$3" && hg update $3
		cd -
	else
		echo "$1 source dir exists, hg pull'ing..."
		cd $MYMKR_PREFIX/src/$1
		hg -v pull --update
		cd -
	fi
}
