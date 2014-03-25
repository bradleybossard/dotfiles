 #!/bin/bash

#TODO
#  http://www.howtoforge.com/useful_linux_commands
#  http://www.danielmiessler.com/blog/collection-of-less-commonly-used-unix-commands
#
#

function print_inet_commands {
  echo '  **  INTERNET COMMANDS **'
  echo 'nmap - Network exploration tool'
  echo 'nmap -sP 192.168.1.*   -- List all active IPs on local network subdomain 192.168.1.*'
}

function print_text_commands {
  echo '  **  TEXT COMMANDS **'
  echo 'jot - Generation list of numbers or characters'
  echo '      jot 10       -- List numbers 1 to 10'
  echo '      jot -r 10    -- List 10 random numbers' 
}

function cool {
  print_inet_commands 
  print_text_commands
}
