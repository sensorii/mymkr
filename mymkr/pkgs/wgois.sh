# OIS v1-3 (fails to compile with gcc 4.7 on Xubuntu 12.10)
##ois)
##	V=v1-3
##	SRC=http://downloads.sourceforge.net/project/wgois/Source%20Release/1.3/ois_$V.tar.gz
##	if [ ! -d $MYMKR_PREFIX/src/$1-$V ]
##	then
##		cd $MYMKR_PREFIX/src
##		test ! -f $1_$V.tar.gz && (wget $SRC || exit 1)
##		tar -xzf $1_$V.tar.gz || exit 1
##		cd $MYMKR_PREFIX/src/$1-$V && sh ./bootstrap
##	fi
##	common_autotools $1-$V
##	;;


# OIS, trunk version
# :NOTE: 2013-05-18 18:56:46  To compile on Xubuntu 13.04, I had to add
# "-lX11" to trunk/demos/Makefile.in *_LDADD
svnsrc wgois svn://svn.code.sf.net/p/wgois/code/
#cd $MYMKR_PREFIX/src/$1/ois/trunk || exit 1
#sh ./bootstrap || exit 1
#common_autotools $1/ois/trunk LIBS='X11'

#export LIBS='X11'
export LDFLAGS='-lX11'
common_autotools $1/ois/trunk
