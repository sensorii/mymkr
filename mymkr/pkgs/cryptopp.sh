URL='http://www.cryptopp.com/cryptopp562.zip'
D=$MYMKR_PREFIX/src/$1
_EXTRACT_ARCHIVE=0
fetch_wget $URL

test -d $D || mkdir $D || die 'make source dir failed'
cd $D || die 'cd source dir failed'
A=$(basename $URL)
unzip -a -f "${MYMKR_PREFIX}/src/${A}" || die 'unzip failed'

export CXXFLAGS='-DNDEBUG -g -fPIC -O3 -march=native -msse2'
export PREFIX=$MYMKR_PREFIX
#make clean
make -e static dynamic test || die 'make failed'
make -e install || die 'make install failed'

# this doesn't run outside of the src dir
rm -f "${MYMKR_PREFIX}/bin/cryptest.exe"
