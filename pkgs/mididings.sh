V=20120419
SRC=http://das.nasophon.de/download/$1-$V.tar.gz
wgetsrc $1 $V $SRC
#./setup.py build [--disable-jack-midi] [--disable-alsa-seq] [--enable-smf]
common_python $1-$V
