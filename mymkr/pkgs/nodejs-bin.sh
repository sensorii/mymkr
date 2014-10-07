# nodejs binaries

V='v0.10.26'

PKG="node-${V}-linux-x86"
#PKG=node-${V}-linux-x64
SRC="http://nodejs.org/dist/${V}/${PKG}.tar.gz"

fetch_wget ${SRC} || die 'failed to fetch source'

rsync -av \
 --exclude='ChangeLog' \
 --exclude='README.md' \
 --exclude='LICENSE' \
 ${MYMKR_PREFIX}/src/${PKG}/ ${MYMKR_PREFIX}/ || die 'install failed'

rm -rf ${MYMKR_PREFIX}/src/${PKG}
