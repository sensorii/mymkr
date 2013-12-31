# puredata spinframework stuff
gitsrc $1 https://code.sat.qc.ca/redmine/pdsheefa.git
cd $MYMKR_PREFIX/src/$1 || exit 1

# for the non-lite version:
# make all || exit 1

make || exit 1
make PREFIX=$MYMKR_PREFIX install
