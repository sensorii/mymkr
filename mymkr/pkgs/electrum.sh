# :NOTE: slowaes was not in pip for python v2.7 as of 2014-02-03, use python-slowaes system pkg
#pip install --upgrade --install-option="--prefix=$MYMKR_PREFIX" slowaes
pip install --upgrade --install-option="--prefix=$MYMKR_PREFIX" ecdsa
gitsrc $1 git://github.com/spesmilo/electrum.git
cd $MYMKR_PREFIX/src/$1 || die "source dir unaccessabile"
pyrcc4 icons.qrc -o gui/qt/icons_rc.py
python mki18n.py
common_python $1
