# :NOTE: need to update auroracoin/src/makefile.unix line 130 to add $(xCXXFLAGS)
# obj/scrypt.o: scrypt.c
# 	gcc -c $(xCXXFLAGS) -o $@ $^

SRC=https://github.com/baldurodinsson/auroracoin-project.git
_COMMON_COIND_BIN_NAME=AuroraCoind
gitsrc $1 $SRC
common_coind $1
