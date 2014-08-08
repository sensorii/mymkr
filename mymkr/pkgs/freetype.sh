gitsrc $1 git://git.sv.gnu.org/freetype/freetype2.git
_GIT_TAG='VER-2-4-12'
common_autotools $1 || die "build failed"

# ogre 1.8.1 does not find freetype without this
cd $MYMKR_PREFIX/include
test ! -d freetype && ln -s freetype2 freetype
