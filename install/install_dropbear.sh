#!/bin/bash
# sudo apt update --fix-missing
# sudo apt install --yes dropbear-initramfs

sudo sh -c 'echo DROPBEAR_OPTIONS="-p 5678 -s -j -k -I 60" >> /etc/dropbear-initramfs/config'

sudo sh -c 'echo <path_to_public_key> >  /etc/dropbear-initramfs/authorized_keys'

sudo update-initramfs -u

# Add the following to /etc/default/grub
# TODO: write script to do this
# 'ip=ip::gateway:mask:hostname:interface:none:'
# GRUB_CMDLINE_LINUX_DEFAULT="quiet ip=192.168.5.45::192.168.5.1:255.255.255.0:hostname:enp5s0:none:"

sudo update-grub

exit

ssh -p5678 -i <path_to_private_key> hostname "echo -ne \"password\" > /lib/cryptsetup/passfifo"

