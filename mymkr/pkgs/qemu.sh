# requires libusbx

gitsrc $1 git://git.qemu-project.org/qemu.git

cd $MYMKR_PREFIX/src/$1
git submodule update --init pixman
git submodule update --init dtc

# REF: http://xecdesign.com/compiling-qemu/
# REF: https://theintobooks.wordpress.com/2012/10/30/installing-qemu/
common_autotools $1 \
 --target-list='arm-softmmu arm-linux-user i386-softmmu arm-softmmu x86_64-softmmu' \
 --enable-sdl

# this gets left out of install for some reason... needed for booting some disk images
cp -a $MYMKR_PREFIX/src/$1/pc-bios/bios-256k.bin $MYMKR_PREFIX/share/qemu/
