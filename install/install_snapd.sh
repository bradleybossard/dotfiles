# For Kali Linux, which doesn't have snap pre-installed

# Install snapd
sudo apt install --yes snapd
# Verify status (usually not running)
systemctl status snapd
# Start service
service snapd start
# Verfiy status (should now be running)
systemctl status snapd
