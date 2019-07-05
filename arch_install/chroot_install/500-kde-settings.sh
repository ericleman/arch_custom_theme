#!/bin/bash
echo "################################################################"
echo "##################### 500-kde-settings.sh ####################"
echo "################################################################"


su eric -c "cp -rT /chroot_install/personal/kde /home/eric/.config"

su eric -c "mkdir -p /home/eric/.local/share/konsole"
su eric -c "cp -rT /chroot_install/personal/konsole/. /home/eric/.local/share/konsole/"

cp /chroot_install/personal/sddm/sddm.conf /etc/sddm.conf