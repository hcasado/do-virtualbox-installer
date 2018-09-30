apt-get update
apt-get install apache -y
apt-get install php -y

apt-get install virtualbox -y
curl -O https://download.virtualbox.org/virtualbox/5.2.10/Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack
echo y | VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack
rm -f Oracle_VM_VirtualBox_Extension_Pack-5.2.10.vbox-extpack

useradd -d /home/vbox -m -g vboxusers -s /bin/bash vbox
echo -e "vbox\nvbox" | passwd vbox


