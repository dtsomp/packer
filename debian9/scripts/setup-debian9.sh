#!/bin/bash

# Set passwordless sudo
echo "vagrant" |sudo -S  bash -c 'echo "vagrant ALL=NOPASSWD:ALL" >> /etc/sudoers.d/vagrant'

sudo apt-get update
sudo apt-get install -y -q openssh-server curl 

# Add the default Vagrant key
mkdir ~/.ssh
curl -o ~/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub

# Install vbox guest additions

VBOXVER="5.0.40"

sudo apt-get -y -q install linux-headers-$(uname -r) dkms build-essential
wget http://download.virtualbox.org/virtualbox/${VBOXVER}/VBoxGuestAdditions_${VBOXVER}.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_${VBOXVER}.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_${VBOXVER}.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions

# Remove unneeded tools
sudo apt remove -yq busybox crda task-laptop wireless-regdb wireless-tools build-essential 

