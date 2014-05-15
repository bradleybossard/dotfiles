 #!/bin/bash

#TODO
#  http://www.howtoforge.com/useful_linux_commands
#  http://www.danielmiessler.com/blog/collection-of-less-commonly-used-unix-commands
#  http://linoxide.com/guide/linux-command-shelf.html
#  http://www.pixelbeat.org/docs/linux_commands.html
#  http://www.pixelbeat.org/cmdline.html
#

function print_system_commands {
  echo '**  SYSTEM COMMANDS **'
  echo 'uname -a       -- Display Linux system information'
  echo 'uname -r       -- Display Linux system information'
  echo 'uptime         -- Show how long the system has been running'
  echo 'hostname       -- Show system host name'
  echo 'hostname i-    -- Show ip address'
  echo 'last reboot    -- Show system reboot history'
  echo 'date           -- Show current date and time'
  echo 'cal            -- Show ascii calendar for current month'
  echo '  cal -y       -- Show calendar for entire year'
  echo 'w              -- Displays who is online'
  echo 'whoami         -- Displays current username'
  echo 'finger <user>  -- Displays info about <user>'
  echo ''
}

function print_inet_commands {
  echo '**  INTERNET COMMANDS **'
  echo 'nmap                     -- Network exploration tool'
  echo '  nmap -sP 192.168.1.*   -- List all active IPs on local network subdomain 192.168.1.*'
  echo ''
}

function print_encryption_commands {
  echo 'gpg -c file   -- Encrypt file'
  echo 'gpg file.gpg  -- Decrypt file'
  echo ''
}

function print_text_commands {
  echo '**  TEXT COMMANDS **'
  echo 'jot            --- Generation list of numbers or characters'
  echo '  jot 10       -- List numbers 1 to 10'
  echo '  jot -r 10    -- List 10 random numbers' 
  echo ''
}

function print_hardware_commands {
  echo '**  HARDWARE COMMANDS **'
  echo '' 
}

function print_disk_commands {
  echo '**  DISK COMMANDS **'
  echo 'df        -- Print disk space used and available on filesystems'
  echo 'du        -- Print disk usage'
  echo '  du -h   -- Human readable disk usage'
  echo ''
}

function cool {
  print_system_commands 
  print_hardware_commands 
  print_disk_commands 
  print_inet_commands
  print_encryption_commands 
  print_text_commands
}
