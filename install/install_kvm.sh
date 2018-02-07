sudo apt-get install --yes libvirt-clients
sudo apt-get install --yes qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker

# Validates kvm can be used on this machine
kvm-ok

# Validates libvirt can be used on this machine
virt-host-validate

# Get info about the current node
virsh nodeinfo

# Starts virt-manager GUI
sudo apt-get install --yes virt-manager
sudo virt-manager