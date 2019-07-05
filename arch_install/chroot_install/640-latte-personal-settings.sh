#!/bin/bash
echo "################################################################"
echo "############### 640-latte-personal-settings.sh #################"
echo "################################################################"


su eric -c "mkdir -p /home/eric/.config/autostart"
su eric -c "cp /chroot_install/personal/latte/org.kde.latte-dock.desktop /home/eric/.config/autostart/org.kde.latte-dock.desktop"

su eric -c "mkdir -p /home/eric/.config/latte"
su eric -c "cp /chroot_install/personal/latte/latte/. /home/eric/.config/latte/"

