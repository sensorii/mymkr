echo ':NOTE: clean not implemented'

# :TODO: case should be for build type, and not package-aware
#for x in $PKGS
#do
#	case $x in
#		mididings)
#			;;
#
#		# these use waf
#		non|gmidimonitor)
#			D=$MYMKR_PREFIX/src/$x
#			test -d $D && cd $D && ./waf clean
#			;;
#
#		# these use cmake
#		petri-foo|ogre|ctrl|3DII)
#			rm -rf $MYMKR_PREFIX/src/$x.build
#			;;
#
#		# nothing to "clean", its a binary package installed in opt/
#		IanniX)
#			;;
#			
#		*)
#			D=$MYMKR_PREFIX/src/$x
#			test -d $D && cd $D && make clean
#			;;
#	esac
#done
