# Reference: http://codelite.org/Developers/Linux
gitsrc $1 git://git.code.sf.net/p/codelite/codelitegit
common_cmake $1 \
-DPREFIX=$MYMKR_PREFIX \
-DCMAKE_BUILD_TYPE=Release \
-DENABLE_CLANG=1 \
-DWITH_PCH=1 \
-DWITH_MYSQL=1 \
-DGTK_USE_AUIBOOK=0
