# :NOTE: this has not been tested...
msg_warning "not tested!"

_EXTRACT_ARCHIVE=0
URL='http://developer.download.nvidia.com/compute/cuda/5_5/rel/installers/cuda_5.5.22_linux_64.run'
fetch_wget $1 $URL

# cuda installer needs gcc <= 4.7.2
alias gcc='/usr/bin/gcc-4.6'
alias g++='/usr/bin/g++-4.6'

E=$(basename $URL)
sh $MYMKR_PREFIX/src/$E \
 -silent \
 -toolkit \
 -toolkitpath=$MYMKR_PREFIX/local/$1 \


# Options:
#    -help                      : Print help message
#    -driver                    : Install NVIDIA Display Driver
#    -uninstall                 : Uninstall NVIDIA Display Driver
#    -toolkit                   : Install CUDA 5.5 Toolkit (default: /usr/local/cuda-5.5)
#    -toolkitpath=<PATH>        : Specify a custom path for CUDA location
#    -samples                   : Install CUDA 5.5 Samples (default: /usr/local/cuda-5.5/samples)
#    -samplespath=<PATH>        : Specify a custom path for Samples location
#    -silent                    : Run in silent mode. Implies acceptance of the EULA
#    -verbose                   : Run in verbose mode
#    -extract=<PATH>            : Extract individual installers from the .run file to PATH
#    -optimus                   : Install driver support for Optimus
#    -override                  : Overrides the installation checks (compiler, lib, etc)
#    -kernel-source-path=<PATH> : Points to a non-default kernel source location
#    -tmpdir <PATH>             : Use <PATH> as temporary directory - useful when /tmp is noexec

# :TODO: add to environment:
#* Please make sure your PATH includes /usr/local/cuda-5.5/bin
#* Please make sure your LD_LIBRARY_PATH
#*   for 32-bit Linux distributions includes /usr/local/cuda-5.5/lib
#*   for 64-bit Linux distributions includes /usr/local/cuda-5.5/lib64:/lib
#* OR
#*   for 32-bit Linux distributions add /usr/local/cuda-5.5/lib
#*   for 64-bit Linux distributions add /usr/local/cuda-5.5/lib64 and /lib
#* to /etc/ld.so.conf and run ldconfig as root
