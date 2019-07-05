#!/bin/bash
echo "################################################################"
echo "########################### 200-software.sh ####################"
echo "################################################################"

pacman -Syyu --noconfirm

pacman -S screenfetch --noconfirm --needed
pacman -S arc-gtk-theme materia-gtk-theme papirus-icon-theme --noconfirm --needed
pacman -S bash-completion --noconfirm --needed
pacman -S ttf-font-awesome ttf-dejavu ttf-roboto --noconfirm --needed
pacman -S simplescreenrecorder --noconfirm --needed

## Note on IcedTea: 
## Archlinux comes with several version of openjdk packages which cover the 'java-runtime-openjdk' requirement for Icedtea
## By default, Icedtea will install as dependency jre-openjdk (which is the latest java version)
## However, jre-openjdk does not work with Prorealtime. We need jre8-openjdk
## So we need to install jre8-openjdk first so the 'java-runtime-openjdk' requirement is already fulfilled when installing icedtea-web
#pacman -S jre8-openjdk --noconfirm --needed
#pacman -S icedtea-web --noconfirm --needed

#pacman -S libreoffice-fresh --noconfirm --needed
#pacman -S chromium --noconfirm --needed
#pacman -S pepper-flash --noconfirm --needed
#pacman -S vlc --noconfirm --needed
pacman -S bleachbit --noconfirm --needed

# lib32-libpulse is required to get sound in wine.
# to install Winamax, once downloaded the installer, run:
# wine wamInstall.exe 
#pacman -S wine lib32-libpulse --noconfirm --needed
