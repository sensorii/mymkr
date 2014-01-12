# scenic2 dependency, requires version <= 0.10.15
# following guide at: http://code.sat.qc.ca/redmine/projects/scenic2/wiki/Scenic2
TAG=v0.10.15
gitsrc $1 https://github.com/joyent/node.git $TAG
common_autotools $1
npm install -g node-gyp
