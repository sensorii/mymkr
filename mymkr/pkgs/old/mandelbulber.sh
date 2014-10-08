svnsrc $1 http://mandelbulber.googlecode.com/svn/trunk
cd $MYMKR_PREFIX/src/$1/makefiles
make clean
make -j1 || exit 1
#(make $JOBS && make PREFIX=$MYMKR_PREFIX install) || exit 1
