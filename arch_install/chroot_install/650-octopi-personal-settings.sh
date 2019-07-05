#!/bin/bash
echo "################################################################"
echo "############### 650-octopi-personal-settings.sh #################"
echo "################################################################"


su eric -c "mkdir -p /home/eric/.config/octopi"
su eric -c "cp /chroot_install/personal/octopi/octopi.conf /home/eric/.config/octopi/octopi.conf"

