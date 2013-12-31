# :NOTE: DO NOT use symlinks anywhere to the source, build will fail with:
#	 Current working directory not under $PROJECT_BASE.
V=1.4.6
SRC=http://pocoproject.org/releases/poco-$V/poco-$V.tar.gz
wgetsrc poco $V $SRC
common_autotools poco-$V --omit=Data/ODBC,Data/MySQL --no-tests --no-samples
