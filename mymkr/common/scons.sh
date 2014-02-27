common_scons() {
	cd $MYMKR_PREFIX/src/$1 || die "cd src dir failed"
	scons $JOBS all || die "make failed"
	scons --prefix=$MYMKR_PREFIX install || die "make install failed"
}
