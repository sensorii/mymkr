_MAKE_INSTALL=0
gitsrc $1 https://github.com/dyne/Tomb.git
common_autotools $1 || die "error"
cd $MYMKR_PREFIX/src/$1
cp -a tomb $MYMKR_PREFIX/bin/tomb
test ! -d $MYMKR_PREFIX/share/man && mkdir -p $MYMKR_PREFIX/share/man
cp -a doc/tomb.1 $MYMKR_PREFIX/share/man/tomb.1
