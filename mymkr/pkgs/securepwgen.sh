# little helper script for making uber-secure passwords, from guruvan
bin=$MYMKR_PREFIX/bin/$1
echo "SALT=\`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1\`" > $bin
echo "echo \"\$1 \`mkpasswd -m sha-256 -S \$SALT -s < /dev/urandom | awk -F\\\$ '{print \$4}'\`\"" >> $bin
#SALT=`cat /dev/urandom| tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?='|fold -w 12| head -n 1| grep -i '[!@#$%^&*()_+{}|:<>?=]'`
###echo "$1 `mkpasswd -m sha-256 -S $SALT -s < /dev/urandom | awk -F\$ '{print $4}'`"  >> /media/truecrypt2/Important_Stuffs/passwds.txt
###gpg --armor -r me@somewhere.net --output /media/truecrypt2/xyz/passwd.gpg --encrypt /media/truecrypt2/xyz/passwds.txt  && cp /media/truecrypt2/xyz/passwd.gpg /home/me/.gnupg/
chmod 700 $bin
