# has cool xycontroller GUI
gitsrc $1 https://github.com/falkTX/Cadence.git
cd $MYMKR_PREFIX/src/$1
(make && make install DESTDIR=$MYMKR_PREFIX) || exit 1
