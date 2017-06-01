# Run this script using cmd.exe in administrator mode

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# Turn off install confirmation
choco feature enable -n allowGlobalConfirmation

choco install 7zip
choco install androidstudio 
choco install arduino
choco install atom
choco install audacity
choco install autohotkey.portable
choco install blender
choco install cdburnerxp
choco install clover
choco install cmder
choco install curl
choco install dolphin
choco install fritzing
choco install git
choco install googlechrome
choco install hdhomerun-view
choco install inkscape
choco install instanteyedropper
choco install irfanview
choco install krita
choco install licecap
choco install nodejs
choco install notepadplusplus
choco install openscad
choco install openshot
choco install picard
choco install python
choco install rufus
choco install sendtokindle
choco install soulseek
choco install steam
choco install sysinternals
choco install teracopy
choco install tor-browser
choco install transmission
choco install unity
choco install vagrant
choco install virtualbox
choco install vlc
choco install wget
choco install wireshark
choco install xming
choco install youtube-dl
