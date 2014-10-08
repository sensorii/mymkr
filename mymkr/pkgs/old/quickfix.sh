gitsrc $1 https://github.com/quickfix/quickfix.git

_MAKE_ENV_OVERRIDE=1
export PYTHON_SITE_PACKAGES="$MYMKR_PREFIX/lib/python2.7/site-packages"
export LDFLAGS="-L${MYMKR_PREFIX}/lib -lunittest++"
common_autotools $1 --with-python
# common_autotools $1 --with-mysql --with-python
