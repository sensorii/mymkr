TAG=poco-1.5.2-rc3
gitsrc $1 https://github.com/pocoproject/poco.git $TAG
common_autotools poco --omit=Data/ODBC,Data/MySQL --no-tests --no-samples
