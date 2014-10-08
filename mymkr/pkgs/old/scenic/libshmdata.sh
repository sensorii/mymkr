BRANCH=develop
gitsrc $1 https://code.sat.qc.ca/redmine/libshmdata.git $BRANCH
common_autotools $1
notice "This package contains puredata externals.\n
	To use them, configure pd with this path: $MYMKR_PREFIX/lib/pd/extra"
