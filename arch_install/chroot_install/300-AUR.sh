#!/bin/bash
echo "################################################################"
echo "########################### 300-AUR.sh #########################"
echo "################################################################"

DESKTOP=$1

if [ "$DESKTOP" == "gnome" ]
then
    su eric -c "trizen -Syu --noconfirm gnome-shell-extension-dash-to-dock"

    pacman -R --noconfirm gnome-terminal
    su eric -c "trizen -Syu --noconfirm gnome-terminal-transparency"

    su eric -c "trizen -Syu --noconfirm conky-lua"
    /chroot_install/630-conky-personal-settings.sh
fi

if [ "$DESKTOP" == "kde" ]
then
#    su eric -c "trizen -Syu --noconfirm octopi"
#    /chroot_install/650-octopi-personal-settings.sh

    su eric -c "trizen -Syu --noconfirm plasma5-applets-window-appmenu"
    su eric -c "trizen -Syu --noconfirm plasma5-applets-window-buttons"
    su eric -c "trizen -Syu --noconfirm plasma5-applets-window-title"
    
    su eric -c "trizen -Syu --noconfirm plasma5-applets-virtual-desktop-bar-git"
    #su - eric -c "cd /home/eric && git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git && cd virtual-desktop-bar && mkdir build && cd build && cmake .. && make && sudo make install & cd .. & cd .."
    #rm -rf /home/eric/virtual-desktop-bar

    
    
fi

echo "################################################################"
echo "########################### 302-AUR.sh #########################"
echo "################################################################"

su eric -c "trizen -Syu --noconfirm pamac-aur pamac-tray-appindicator"
/chroot_install/620-pamac-settings.sh

su eric -c "trizen -Syu --noconfirm capitaine-cursors"

echo "################################################################"
echo "########################### 303-AUR.sh #########################"
echo "################################################################"

su eric -c "trizen -Syu --noconfirm google-chrome"

echo "################################################################"
echo "########################### 304-AUR.sh #########################"
echo "################################################################"

su eric -c "trizen -Syu --noconfirm vscodium-bin"
/chroot_install/610-vscodium-personal-settings.sh

su eric -c "trizen -Syu --noconfirm breeze-blurred-git"


