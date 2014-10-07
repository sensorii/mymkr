########################################################################
# Distributed Time Tracker "git timetrack"
# http://wadobo.com/trac/dtt
########################################################################
gitsrc $1 http://wadobo.com/repos/gtt.git
cd /x/src/$1
PREFIX=$MYMKR_PREFIX make install
