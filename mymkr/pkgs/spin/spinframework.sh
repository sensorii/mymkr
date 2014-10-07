# use "-j1" if enable-editor
JOBS='-j1'
#gitsrc $1 https://code.sat.qc.ca/redmine/spinframework.git
common_autotools $1 --enable-editor
#common_autotools $1
