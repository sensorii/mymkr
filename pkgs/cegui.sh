########################################################################
# Crazy Eddy's GUI, editor and deps
########################################################################
#hgsrc $1 http://bitbucket.org/cegui/cegui/ v0-7
#cd $MYMKR_PREFIX/src/$1 && sh ./bootstrap
#common_autotools $1

hgsrc $1 http://bitbucket.org/cegui/cegui/ v0-8-2
common_cmake $1
