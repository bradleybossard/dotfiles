sudo apt install --yes qemu qemu-kvm

# Command for creating new qemu disk image in qcow2 format (thin provisioning)
# qemu-img create -f qcow2 <filnamebase>.qcow2 60G

# Install OS from iso onto disk image
# qemu defaults to 64M of RAM, so up to 2G
# Use -enable-kvm option to get x86 to x86 translation speedup b/c we're using same architecture
# sudo qemu-system-x86_64 -cdrom <path-to-os-image>.iso <filenamebase>.qcow2 -m 2G -enable-kvm

# Restart system once OS has been installed
# sudo qemu-system-x86_64 <filenamebase>.qcow2 -m 2G -enable-kvm

# hardinfo is a Linux GUI tool for inspecting system configuration
# sudo apt install --yes hardinfo



sudo apt install --yes libvirt-clients
sudo apt install --yes libvirt-bin virtinst bridge-utils cpu-checker

sudo apt install --yes virt-manager

# Validates kvm can be used on this machine
kvm-ok

# Validates libvirt can be used on this machine
sudo virt-host-validate

# Get info about the current node
virsh nodeinfo

# Starts virt-manager GUI
# sudo virt-manager

