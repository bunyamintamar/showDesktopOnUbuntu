#!/bin/bash

# STEP 1 - Enter your root password with 'sudo'
echo
sudo echo 'Installing the show desktop button!'
echo '-----------------------------------'
echo

# STEP 2 - Download necessary files
cd ~/Desktop/
git clone https://github.com/bunyamintamar/showDesktopOnUbuntu.git
cd showDesktopOnUbuntu/
chmod +x showDesktop.sh
sudo apt install xdotool -y
sudo apt update -y

# STEP 3 - Create application folder
sudo mkdir /opt/showDesktop
sudo cp showDesktop.sh /opt/showDesktop/
sudo cp desktop.ico    /opt/showDesktop/

# STEP 4 - Create shortcut
touch showDesktop.desktop
chmod +x showDesktop.desktop
echo '#!/usr/bin/env xdg-open'                 >  showDesktop.desktop
echo ' '                                       >> showDesktop.desktop
echo '[Desktop Entry]'                         >> showDesktop.desktop
echo "Name=Show Desktop"                       >> showDesktop.desktop
echo 'StartupNotify=true'                      >> showDesktop.desktop
echo 'Terminal=false'                          >> showDesktop.desktop
echo 'Type=Application'                        >> showDesktop.desktop
echo 'Icon=/opt/showDesktop/desktop.ico'       >> showDesktop.desktop
echo 'Exec=/opt/showDesktop/showDesktop.sh %F' >> showDesktop.desktop
sudo cp showDesktop.desktop /usr/share/applications/

# STEP 5 - Add to favorities
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'showDesktop.desktop']"

# STEP 6 - Delete unnecessary files
sudo rm -r ~/Desktop/showDesktopOnUbuntu

# ------------------------------------
echo
echo '-------------------------------'
echo 'Bunyamin TAMAR - December 2021'
echo 'linkedin.com/in/bunyamintamar'
echo '-------------------------------'
echo