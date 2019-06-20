#!/bin/bash
echo "################################################################"
echo "######################  110-openssh.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S openssh --noconfirm --needed

systemctl enable sshd