#!/bin/bash
echo "################################################################"
echo "##################### 500-gnome-settings.sh ####################"
echo "################################################################"

su eric -c "dconf load / < /chroot_install/personal/gnome-settings.dconf"
su eric -c "cp /chroot_install/personal/gtk-3.0/settings.ini /home/eric/.config/gtk-3.0/settings.ini"
su eric -c "cp /chroot_install/personal/gtk-2.0/.gtkrc-2.0 /home/eric/.gtkrc-2.0"

