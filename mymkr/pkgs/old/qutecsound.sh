#gitsrc $1 git://qutecsound.git.sourceforge.net/gitroot/qutecsound/qutecsound
#svnsrc $1 https://qutecsound.svn.sourceforge.net/svnroot/qutecsound
cd $MYMKR_PREFIX/src/$1/trunk/$1
qmake-qt4 qcs.pro CONFIG+=buildDoubles LIBSNDFILE_LIBRARY_DIR="/usr/lib/x86_64-linux-gnu"
#qmake-qt4 qcs.pro \
#	CONFIG+=buildDoubles \
#	CONFIG+=pythonqt \
#	LIBSNDFILE_LIBRARY_DIR="/usr/lib/x86_64-linux-gnu" \
#	PYTHONQT_TREE_DIR="/usr/include/PythonQt"
#	# CONFIG+=rtmidi \
#	# RTMIDI_DIR="/usr/include"
(make $JOBS && make PREFIX=$MYMKR_PREFIX install) || exit 1
cp bin/CsoundQt-d $MYMKR_PREFIX/bin/CsoundQt
