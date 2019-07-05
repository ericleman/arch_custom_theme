#!/bin/bash
echo "################################################################"
echo "############ 600-other-personal-settings.sh ####################"
echo "################################################################"

su eric -c "cp /chroot_install/personal/.bashrc /home/eric/.bashrc"
su eric -c "cp /chroot_install/personal/mimeapps.list /home/eric/.config/mimeapps.list"

su eric -c "mkdir -p /home/eric/.config/gtk-3.0"
su eric -c "cp /chroot_install/personal/gtk-3.0/settings.ini /home/eric/.config/gtk-3.0/settings.ini"

su eric -c "cp /chroot_install/personal/gtk-2.0/.gtkrc-2.0 /home/eric/.gtkrc-2.0"

su eric -c "mkdir -p /home/eric/.config/Kvantum"
su eric -c "cp -rT /chroot_install/personal/Kvantum/. /home/eric/.config/Kvantum/"
