#!/bin/bash
echo "################################################################"
echo "############### 630-conky-personal-settings.sh #################"
echo "################################################################"


su eric -c "mkdir -p /home/eric/.conky"
su eric -c "cp /chroot_install/personal/conky/.conky/rings-v1.3.1.lua /home/eric/.conky/rings-v1.3.1.lua"
su eric -c "cp /chroot_install/personal/conky/.conkyrc /home/eric/.conkyrc"

su eric -c "mkdir -p /home/eric/.config/autostart"
su eric -c "cp /chroot_install/personal/conky/conky.desktop /home/eric/.config/autostart/conky.desktop"

su eric -c "mkdir -p /home/eric/.fonts"
su eric -c "cp /chroot_install/personal/conky/font/Michroma.ttf /home/eric/.fonts/Michroma.ttf"
su eric -c "cp /chroot_install/personal/conky/font/Play-Bold.ttf /home/eric/.fonts/Play-Bold.ttf"
su eric -c "cp /chroot_install/personal/conky/font/Play-Regular.ttf /home/eric/.fonts/Play-Regular.ttf"
