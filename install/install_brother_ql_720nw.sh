# add current user to CUPS admin group
sudo usermod -a -G lpadmin $USER

echo "navigate to CUPS web admin at"
echo ""
echo "http://localhost:631/admin/"
echo ""
echo "then Go To Administration -> Add Printer "
