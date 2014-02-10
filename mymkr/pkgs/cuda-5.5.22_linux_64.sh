# Reference: http://askubuntu.com/a/387335
_EXTRACT_ARCHIVE=0
URL='http://developer.download.nvidia.com/compute/cuda/5_5/rel/installers/cuda_5.5.22_linux_64.run'
E=$(basename $URL)
fetch_wget $E $URL

# cuda installer needs gcc <= 4.7.2
# temporarily hack gcc/g++ for this compile
ln -s $(which gcc-4.6) $MYMKR_PREFIX/bin/gcc || die "Unable to link gcc. version 4.6 not found?"
ln -s $(which g++-4.6) $MYMKR_PREFIX/bin/g++ || die "Unable to link g++. version 4.6 not found?"
# shell alias does not work?:
#alias gcc='/usr/bin/gcc-4.6'
#alias g++='/usr/bin/g++-4.6'

DESTDIR="${MYMKR_PREFIX}/opt/cuda"
EXE=$(basename $URL)
msg_info "running ${MYMKR_PREFIX}/src/${EXE} ..... ... .. . ."
sh $MYMKR_PREFIX/src/$EXE \
 -silent \
 -toolkit \
 -toolkitpath=$DESTDIR || die 'INSTALL FAILED'
msg_info ". . .. ... ..... finished"

# remove gcc/g++ hack
rm $MYMKR_PREFIX/bin/gcc $MYMKR_PREFIX/bin/g++

# add to environment
ENV="$MYMKR_PREFIX/mymkr/env.d/cuda.sh"
touch "$ENV" || die "failed to access MYMKR environment file: $ENV"
echo "# $1" > $ENV
echo "export LD_LIBRARY_PATH=\$MYMKR_PREFIX/opt/cuda/lib64:\$MYMKR_PREFIX/opt/cuda/lib:\$LD_LIBRARY_PATH" >> $ENV
echo "export PATH=\$MYMKR_PREFIX/opt/cuda/bin:\$PATH" >> $ENV


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
