gitsrc $1 https://github.com/ckolivas/cgminer.git
export NOCONFIGURE='1'
common_autotools $1 "--enable-hashfast"
