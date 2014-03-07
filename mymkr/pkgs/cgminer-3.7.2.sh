# https://sites.google.com/site/rmdavidson/cgminer-3-7-2-patch-build-guide
#_GIT_TAG='v3.7.2'
#gitsrc $1 https://github.com/ckolivas/cgminer.git
fetch_wget http://ck.kolivas.org/apps/cgminer/3.7/cgminer-3.7.2.tar.bz2

# fetch patches
_EXTRACT_ARCHIVE=0
fetch_wget "https://sites.google.com/site/rmdavidson/cgminer-3.7.2-mp-0.04.patch.gz"
fetch_wget "https://sites.google.com/site/rmdavidson/cgminer-3.7.2-sj-0.02.patch.gz"
fetch_wget "https://sites.google.com/site/rmdavidson/cgminer-3.7.2-ut-0.02.patch.gz"
fetch_wget "https://sites.google.com/site/rmdavidson/cgminer-3.7.2-int-0.01.patch.gz"

# apply patches
cd $MYMKR_PREFIX/src/$1 || die "cd dir failed: $MYMKR_PREFIX/src/$1"
zcat ../cgminer-3.7.2-*.patch.gz | patch -p1

# compile and install
_MAKE_ENV_OVERRIDE=1
export NOCONFIGURE='1'
export CFLAGS='-O3 -Wall -march=native -I /opt/AMDAPP/include/'
export LDFLAGS="-L/opt/AMDAPP/lib/x86"
common_autotools $1 --enable-scrypt --enable-opencl
