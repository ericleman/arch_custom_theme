#!/bin/bash
echo "################################################################"
echo "##################  100-plasma.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S xorg-server sddm plasma-meta dolphin konsole kde-gtk-config --noconfirm --needed
# I choose not to install kde-applications but just: dolphin konsole


#for SDDM we need French keyboard:
#localectl set-x11-keymap fr
mkdir -p /etc/x11/xorg.conf.d
cp /chroot_install/personal/00-keyboard.conf /etc/x11/xorg.conf.d/00-keyboard.conf


systemctl enable sddm.service

