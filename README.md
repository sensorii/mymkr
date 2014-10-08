mymkr
=====

"My Maker" -- Simple source compiler assistant written in BASH


mymkr is a set of bash scripts for UNIX systems that create and managage a
custom development environment and package installation location for compiled
sources.  mymkr can make it easier to install specific versions of software with
specific features configured and using custom dependencies. Packages are
installed into a configured "mymkr" directory enabling a developer to more
cleanly install and use multiple versions of the same software in their own user
space without polluting the host system.

To use mymkr to compile a package, a shell script is made for that package with
the commands to download, compile, and install the package.  mymkr includes
helper functions for common operations for fetching, building, installing and
other abstractions so that in many cases a package's mymkr script may be as
short as two lines.

### Example:
use mymkr to install the latest liblo library from source:
```
mymkr liblo
```

The liblo mymkr script:
```
gitsrc $1 git://git.code.sf.net/p/liblo/git
common_autotools $1
```

### Disclaimer
Orginally developed for use on ubuntu (debian-based) systems, so there may be
some things related to that but is not restricted to any OS flavor.

mymkr and the included package scripts have been made over the course of several
years (and host OS versions) on a very specific as-needed basis to do exactly
what I wanted them to do and they may be outdated and not work exactly as you
want them to, so you may want to write your own package files and use the
included ones as examples.

### How it works
The magick is done by installing packages into a "prefix" directory and using
standard environment variables, such as PATH and LD_LIBRARY_PATH, set in your
bash environment to understand this location.  It could be thought of as a
"/usr/local/" type of installation directory in your homedir (or wherever you
want it).


### Installation:
1. git clone https://github.com/sensorii/mymkr

2. move the mymkr directory where you want it.  Example: `mv mymkr ~/.mymkr`

3. use mymkr to install mymkr.  Example: `~/.mymkr/mymkr/mymkr mymkr`

4. either restart your bash shell, or source ~/.bashrc to get the MYMKR environment in your current shell

5. install stuff. Example: `mymkr cgminer`

6. if any binaries were installed, they are now included in your $PATH, so run them as you would any other command. Example: `cgminer`
