#!/bin/bash
echo "################################################################"
echo "########################### 300-AUR.sh #########################"
echo "################################################################"

su eric -c "yay -Syu --noconfirm gnome-shell-extension-dash-to-dock"

pacman -R --noconfirm gnome-terminal
su eric -c "yay -Syu --noconfirm gnome-terminal-transparency"

su eric -c "yay -Syu --noconfirm capitaine-cursors"

su eric -c "yay -Syu --noconfirm vscodium-bin"
/chroot_install/610-vscodium-personal-settings.sh

su eric -c "yay -Syu --noconfirm pamac-aur"
/chroot_install/620-pamac-settings.sh



