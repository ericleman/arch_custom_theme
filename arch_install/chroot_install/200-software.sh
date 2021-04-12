#!/bin/bash
echo "################################################################"
echo "########################### 200-software.sh ####################"
echo "################################################################"

DESKTOP=$1

pacman -Syyu --noconfirm

pacman -S screenfetch lolcat --noconfirm --needed
pacman -S gnome-icon-theme arc-gtk-theme materia-gtk-theme papirus-icon-theme materia-kde kvantum-qt5 kvantum-theme-materia --noconfirm --needed
pacman -S bash-completion --noconfirm --needed
pacman -S ttf-font-awesome ttf-dejavu ttf-roboto --noconfirm --needed
pacman -S simplescreenrecorder --noconfirm --needed
pacman -S xdg-user-dirs --noconfirm --needed
pacman -S xorg-server-xephyr xorg-server-xvfb qtile imagemagick --noconfirm --needed

## Note on IcedTea: 
## Archlinux comes with several version of openjdk packages which cover the 'java-runtime-openjdk' requirement for Icedtea
## By default, Icedtea will install as dependency jre-openjdk (which is the latest java version)
## However, jre-openjdk does not work with Prorealtime. We need jre8-openjdk
## So we need to install jre8-openjdk first so the 'java-runtime-openjdk' requirement is already fulfilled when installing icedtea-web
pacman -S jre8-openjdk --noconfirm --needed
pacman -S icedtea-web --noconfirm --needed


#pacman -S libreoffice-fresh --noconfirm --needed
pacman -S chromium --noconfirm --needed
pacman -S pepper-flash --noconfirm --needed
pacman -S vlc --noconfirm --needed
pacman -S bleachbit --noconfirm --needed

# lib32-libpulse is required to get sound in wine.
# lib32-openal seems to be required for Pokerstars
# to install Winamax, once downloaded the installer, run:
# wine wamInstall.exe 
#pacman -S wine lib32-libpulse lib32-openal --noconfirm --needed

# maybe required for Hand2Note on Wine
#pacman -S lib32-gnutls lib32-mpg123 wine-mono winetricks --noconfirm --needed
# plus tard il faudra faire à la main: winetricks dotnet472

if [ "$DESKTOP" == "kde" ]
then
    pacman -S latte-dock --noconfirm --needed
    /chroot_install/640-latte-personal-settings.sh

    #pacman -S plasma5-applets-active-window-control --noconfirm --needed
fi

pacman -S zsh zsh-completions --noconfirm --needed
/chroot_install/660-zsh-personal-settings.sh
