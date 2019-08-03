echo "
Host <short-name>
  HostName <host-url>
  User <username>
  IdentityFile </path/to/private-key>
  Port <port-number>
" >> ~/.ssh/config

chown $USER ~/.ssh/config
chmod 600 ~/.ssh/config
