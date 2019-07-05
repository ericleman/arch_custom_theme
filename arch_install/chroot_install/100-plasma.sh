#!/bin/bash
echo "################################################################"
echo "##################  100-plasma.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S xorg-server sddm plasma-meta dolphin konsole kde-gtk-config --noconfirm --needed
# I choose not to install kde-applications but just: dolphin konsole


#for SDDM we need French keyboard:
localectl set-x11-keymap fr

systemctl enable sddm.service

