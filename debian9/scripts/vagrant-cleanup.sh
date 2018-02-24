#!/bin/bash

# Standard practices for doing vagrant boxes.
# We run this script at the end of our installation procedure,
# to make sure we use as little disk space as possible.


sudo apt-get -y autoremove
sudo apt-get clean
sudo apt-get autoclean

[ -f /home/vagrant/VBoxGuestAdditions.iso ] && rm /home/vagrant/VBoxGuestAdditions.iso
[ -f /home/vagrant/.bash_history ] && rm /home/vagrant/.bash_history 

sudo find /var/log -type f | while read f; do echo -ne '' | sudo tee $f; done

# Zero-out disk

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
