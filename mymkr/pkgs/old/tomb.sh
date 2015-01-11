_MAKE_INSTALL=0
gitsrc $1 https://github.com/dyne/Tomb.git
common_autotools $1 || die "error"
cd $MYMKR_PREFIX/src/$1
cp -a tomb $MYMKR_PREFIX/bin/tomb
M=$MYMKR_PREFIX/share/man/man1
test ! -d $M && mkdir -p $M
cat doc/tomb.1 | gzip > $M/tomb.1.gz
