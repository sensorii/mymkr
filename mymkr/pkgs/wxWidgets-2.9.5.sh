# wxWidgets >= 2.9.0, spinframework editor dependency
V=2.9.5
SRC=http://downloads.sourceforge.net/project/wxwindows/$V/$1-$V.tar.bz2
wgetsrc $1 $V $SRC tar.bz2
common_autotools $1-$V \
	--enable-unicode \
	--enable-propgrid \
	--enable-grid \
	--enable-stl \
	--enable-threads \
	--enable-mediactrl \
	--enable-animatectrl \
	--with-libpng \
	--with-libjpeg \
	--with-zlib \
	--with-libnotify \
	--with-opengl
