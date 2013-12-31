# http://das.nasophon.de/jack_oscrolloscope/
# a simple waveform viewer for JACK
# could serve as simple example for JACK audio input
V=0.7
SRC=http://das.nasophon.de/download/$1-$V.tar.gz
wgetsrc $1 $V $SRC
common_autotools $1-$V
