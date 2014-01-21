gitsrc $1 https://github.com/ckolivas/cgminer.git
export NOCONFIGURE='1'
export CFLAGS='-O2 -Wall -march=native'
common_autotools $1 "--enable-hashfast"
