# Installs latest stable upstream of bcc-tools
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/iovisor.list
sudo apt-get update
sudo apt-get install --yes bcc-tools libbcc-examples linux-headers-$(uname -r)

# Tools are located in /usr/share/bcc/tools


# Further reading
# [Virtual filesystems: Why we need them and how they work](https://opensource.com/article/19/3/virtual-filesystems-linux?utm_campaign=intrel)
# [bcc/tutorial.md](https://github.com/iovisor/bcc/blob/master/docs/tutorial.md)
# [ChaikenSCALE2019.pdf](http://she-devel.com/ChaikenSCALE2019.pdf)
# [Alison Chaiken's Embedded Linux Resources](http://she-devel.com/)
