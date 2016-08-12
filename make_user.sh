user=bradleybossard

sudo userdel $user
sudo rm -rf /home/$user

useradd $user
mkdir /home/$user
mkdir /home/$user/.ssh
chmod 700 /home/$user/.ssh
usermod -s /bin/bash $user
cp /root/.ssh/authorized_keys /home/$user/.ssh/
chmod 400 /home/$user/.ssh/authorized_keys
chown $user:$user /home/$user -R
echo "Add password for $user"
passwd $user
usermod -aG sudo $user

echo "TODO: Write script for setting up ssh key"
echo "Currently, I must seem to do the following:"
echo "1.  From root, su bradleybossard"
echo "2.  Copy /root/.ssh/authorized_keys to /home/bradleybossard/.ssh/authorized_keys"
