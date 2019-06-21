#!/bin/bash
echo "################################################################"
echo "########################### 200-software.sh ####################"
echo "################################################################"

pacman -Syyu --noconfirm

pacman -S screenfetch --noconfirm --needed
pacman -S arc-gtk-theme materia-gtk-theme papirus-icon-theme --noconfirm --needed
pacman -S bash-completion --noconfirm --needed
pacman -S ttf-font-awesome ttf-dejavu ttf-roboto --noconfirm --needed
pacman -S vlc --noconfirm --needed
pacman -S simplescreenrecorder --noconfirm --needed
pacman -S icedtea-web --noconfirm --needed
pacman -S jre8-openjdk --noconfirm --needed
pacman -S libreoffice-fresh --noconfirm --needed
pacman -S chromium --noconfirm --needed
pacman -S bleachbit --noconfirm --needed
#pacman -S conky conky-manager --noconfirm --needed
#pacman -S arcolinux-conky-collection-git --noconfirm --needed