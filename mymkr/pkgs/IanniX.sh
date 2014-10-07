#gitsrc $1 https://github.com/iannix/IanniX.git
# the source looks like it requires qtcreator and lots of deps to build.... so:
# install binary package in MYMKR_PREFIX/opt/
F=iannix_linux__0_8_43.tar.gz
D=$MYMKR_PREFIX/opt/$1

test -f /tmp/$F || (wget -O /tmp/$F http://www.iannix.org/en/download/$F || exit 1)

rm -rf $D
test -d $D || mkdir -p $D || exit 1
cd $MYMKR_PREFIX/opt/
tar -xzf /tmp/$F || exit 1

# create a little starter script in MYMKR_PREFIX/bin
S=$MYMKR_PREFIX/bin/$1
echo -e "#!/bin/bash\ncd $D\n./IanniX.sh" > $S
chmod 0755 $S
