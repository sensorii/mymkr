# bullet 3D physics library 2.x
# spinframework needs 2.78 (as of 2013-08-29)
#svnsrc $1 http://bullet.googlecode.com/svn/trunk/ 
#svnsrc $1 http://bullet.googlecode.com/svn/tags/bullet-2.81
svnsrc $1 http://bullet.googlecode.com/svn/tags/bullet-2.78
#common_autotools $1 --enable-multithreaded
common_autotools $1
