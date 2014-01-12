BRANCH=develop
gitsrc $1 https://code.sat.qc.ca/redmine/scenic2.git $BRANCH
cd $MYMKR_PREFIX/src/$1
npm install -g || die "npm install failed"

git submodule init
git submodule update
cd node_modules/node-switcher
git checkout develop
node-gyp configure build || die "you probably need to edit
	src/scenic2/node_modules/node-switcher/binding.gyp and add
	-I/x-art/include/switcher-0.2 to cflags and -L/x-art/lib to libraries"

notice "Making starter script in bin/"
S="$MYMKR_PREFIX/bin/$1"
D="$MYMKR_PREFIX/src/$1"
echo -e "#!/bin/bash\ncd $D\nNODE_PATH=$MYMKR_PREFIX/lib/node_modules/scenic2/node_modules node server.js" > $S
chmod 0755 $S
