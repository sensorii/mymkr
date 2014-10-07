V='0.6.2'
SRC="http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/$V/dfu-programmer-$V.tar.gz"
fetch_wget $SRC
common_autotools "$1-$V"
