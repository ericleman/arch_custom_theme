#!/bin/bash
echo "################################################################"
echo "########################### 130-virtualbox.sh ##################"
echo "################################################################"

pacman -Syyu --noconfirm

if [ "$1" == "lts" ]
then
    pacman -S linux-lts-headers --noconfirm --needed
fi

#pacman -S virtualbox-guest-utils virtualbox-guest-modules-arch xf86-video-vesa --noconfirm --needed
pacman -S virtualbox-guest-utils xf86-video-vesa --noconfirm --needed

usermod -a -G vboxsf eric

systemctl enable vboxservice
