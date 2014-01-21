gitsrc $1 https://github.com/Bitmessage/PyBitmessage.git
#common_python $1
BIN=$MYMKR_PREFIX/bin/$1
echo "$MYMKR_PREFIX/src/$1/src/bitmessagemain.py" > $BIN
chmod 755 $BIN
