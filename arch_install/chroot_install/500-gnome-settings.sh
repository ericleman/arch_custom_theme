#!/bin/bash
echo "################################################################"
echo "##################### 500-gnome-settings.sh ####################"
echo "################################################################"

sudo -u eric dbus-launch dconf load / < /chroot_install/personal/gnome-settings.dconf


