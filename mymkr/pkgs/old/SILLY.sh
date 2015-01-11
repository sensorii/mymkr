V=0.1.0
SRC=http://downloads.sourceforge.net/project/crayzedsgui/$1/$V/$1-$V.tar.gz
wgetsrc $1 $V $SRC
common_autotools $1-$V
