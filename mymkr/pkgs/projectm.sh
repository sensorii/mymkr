gitsrc $1 git://git.code.sf.net/p/projectm/code

# mod'd common_cmake:
cd $MYMKR_PREFIX/src
rm -rf $1.build
test -d $1.build || mkdir $1.build
cd $MYMKR_PREFIX/src/$1.build
cmake -D CMAKE_INSTALL_PREFIX=$MYMKR_PREFIX -D INCLUDE-PROJECTM-JACK=ON -D USE_CG=ON ../$1/src
make $JOBS && make install
