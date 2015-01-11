# :NOTE:
# add this in src/makefile.unix:
# obj/scrypt.o: scrypt.c
# gcc -c $(xCXXFLAGS) -o $@ $^ $(xLDFLAGS) $(LIBS)
#gitsrc $1 https://github.com/blitzcoin/BlitzCoin.git
export CFLAGS="-I$MYMKR_PREFIX/include"
export LIBPATHS="-L${MYMKR_PREFIX}/lib"
_COMMON_COIND_BIN_NAME=BlitzCoind
common_coind $1
