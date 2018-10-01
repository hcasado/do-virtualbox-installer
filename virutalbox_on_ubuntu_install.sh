apt-get update
apt-get install apache -y
apt-get install php -y
apt-get install php-xml -y
apt-get install php-soap -y
apt-get install bsdtar -y

apt-get install virtualbox -y
curl -O https://download.virtualbox.org/virtualbox/5.2.10/Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack
echo y | VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack
rm -f Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack

useradd -d /home/vbox -m -g vboxusers -s /bin/bash vbox
echo -e "pass\pass" | passwd vbox

touch /etc/init.d/vboxweb
echo "#!/bin/bash" > /etc/init.d/vboxweb
echo "sudo -u vbox  vboxwebsrv &" >> /etc/init.d/vboxweb
chmod +x /etc/init.d/vboxweb
update-rc.d vboxweb defaults

wget http://sourceforge.net/projects/phpvirtualbox/files/latest/download -O phpvirtualbox.zip
bsdtar -xf phpvirtualbox.zip -s'|[^/]*/||' -C /var/www/html
rm -rf phpvirtualbox.zip
mv /var/www/html/config.php-example /var/www/html/config.php

