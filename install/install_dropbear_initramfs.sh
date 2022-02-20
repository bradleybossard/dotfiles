#!/bin/bash
# sudo apt update --fix-missing
# sudo apt install --yes dropbear-initramfs


#TODO: change port to 22

sudo sh -c 'echo DROPBEAR_OPTIONS="-p 2222 -s -j -k -I 60" >> /etc/dropbear-initramfs/config'

sudo sh -c 'echo <path_to_public_key> >  /etc/dropbear-initramfs/authorized_keys'

sudo update-initramfs -u

# Add the following to /etc/default/grub
# TODO: write script to do this
# 'ip=ip::gateway:mask:hostname:interface:none:'
# GRUB_CMDLINE_LINUX_DEFAULT="quiet ip=192.168.5.45::192.168.5.1:255.255.255.0:hostname:enp5s0:none:"

sudo update-grub

exit

# to unlock
# ssh -p2222 -i <path_to_private_key> hostname "echo -ne \"password\" > /lib/cryptsetup/passfifo"
ssh -p2222 -i <path_to_private_key> root@hostname
cryptroot-unlock

