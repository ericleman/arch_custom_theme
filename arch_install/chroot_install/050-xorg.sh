#!/bin/bash
echo "################################################################"
echo "########################### 050-xorg.sh ########################"
echo "################################################################"

pacman -Syyu --noconfirm

pacman -S xorg-server xorg-xinit xorg-apps xf86-input-mouse xf86-input-keyboard xf86-input-libinput xdg-user-dirs mesa --noconfirm --needed

