apt-get update
apt-get install apache2 -y
apt-get install php -y
apt-get install php-xml -y
apt-get install php-soap -y
apt-get install bsdtar -y
apt-get install gdebi -y
apt-get install -y gcc make perl
apt-get install -y libapache2-mod-php
apt-get install -y curl
apt-get install -y linux-headers-amd64
apt-get install -y linux-headers-4.9.0-7-amd64

curl -O https://download.virtualbox.org/virtualbox/5.2.6/virtualbox-5.2_5.2.6-120293~Debian~stretch_amd64.deb
echo y | gdebi *.deb
rm -rf *.deb

curl -O https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6.vbox-extpack
echo y | VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-5.2.6.vbox-extpack
rm -f *.vbox-extpack

VBoxManage setproperty websrvauthlibrary null

useradd -d /home/vbox -m -g vboxusers -s /bin/bash vbox
echo -e "pass\npass" | passwd vbox

#touch /etc/init.d/vboxweb
#echo "#!/bin/bash" > /etc/init.d/vboxweb
#echo "sudo -H -u vbox  vboxwebsrv &" >> /etc/init.d/vboxweb
#chmod +x /etc/init.d/vboxweb
#update-rc.d vboxweb defaults

wget http://sourceforge.net/projects/phpvirtualbox/files/latest/download -O phpvirtualbox.zip
bsdtar -xf phpvirtualbox.zip -s'|[^/]*/||' -C /var/www/html
rm -rf phpvirtualbox.zip
cp ./config.php /var/www/html/config.php 

service apache2 restart




