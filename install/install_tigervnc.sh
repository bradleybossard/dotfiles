#!/bin/bash
sudo apt install --yes tigervnc-standalone-server

# set up local ssh tunnel
# ssh -L 5901:127.0.0.1:5901 -C -N -l <username> <ip_address_of_machine_with_tiger_installed> 
