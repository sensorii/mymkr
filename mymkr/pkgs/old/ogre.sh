hgsrc $1 https://bitbucket.org/sinbad/ogre/ v1-8-1

_MAKE=1
_MAKE_INSTALL=1
_MAKE_CLEAN=0


# OGRE_USE_BOOST=OFF  compile fails with:
# warning: invoking macro POCO_DECLARE_EXCEPTION_CODE argument 1: empty macro arguments are undefined in ISO C90 and ISO C++98
common_cmake $1 \
-D OGRE_DEPENDENCIES_DIR=$MYMKR_PREFIX \
-D OGRE_BUILD_SAMPLES=1 \
-D OGRE_INSTALL_SAMPLES=1 \
-D OGRE_CONFIG_THREADS=2 \
-D OGRE_CONFIG_MEMTRACK_DEBUG=1

#-D OGRE_USE_BOOST=ON \
#-D OGRE_CONFIG_THREAD_PROVIDER=poco \
