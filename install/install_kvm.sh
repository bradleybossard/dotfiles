sudo apt install --yes libvirt-clients
sudo apt install --yes qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker

# Validates kvm can be used on this machine
kvm-ok

# Validates libvirt can be used on this machine
sudo virt-host-validate

# Get info about the current node
virsh nodeinfo

# Starts virt-manager GUI
sudo apt install --yes virt-manager
sudo virt-manager
