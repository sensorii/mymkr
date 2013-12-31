# NOTE: this is not compiled, source is retrieved everytime this is run
SRC='http://osc-tools.googlecode.com/files/OSC_Data_Monitor.linux.zip'
cd $MYMKR_PREFIX/src
rm -rf OSC_Data_Monitor.linux*
wget $SRC
unzip OSC_Data_Monitor.linux.zip

# create a little starter script in MYMKR_PREFIX/bin
S="$MYMKR_PREFIX/bin/$1"
D="$MYMKR_PREFIX/src/OSC_Data_Monitor.linux/application.linux64"
echo -e "#!/bin/bash\ncd $D\n./OSC_Data_Monitor" > $S
chmod 0755 $S
