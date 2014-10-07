gitsrc $1 https://github.com/umlaeute/v4l2loopback.git

cd $MYMKR_PREFIX/src/$1
make || die 'make mailed'
sudo make install || die 'sudo make install failed'

cd examples
make || die 'make examples failed'
cp yuv4mpeg_to_v4l2 $MYMKR_PREFIX/bin/
