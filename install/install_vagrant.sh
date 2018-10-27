sudo apt-get install --yes vagrant

# For Ubuntu 18.04, install vagrant from .deb for v2.0.3, otherwise vagrant-mutate plugin has install issue
#wget -c https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb
#sudo dpkg -i vagrant_2.0.3_x86_64.deb

sudo apt-get install libvirt-dev

vagrant plugin install vagrant-libvirt

# Old plugin, don't think it's maintained or needed.
# vagrant plugin install vagrant-mutate

# Cannot use a standard box for libvirt
vagrant init generic/ubuntu1604

# Must specify libvirt as provider
vagrant up --provider=libvirt
