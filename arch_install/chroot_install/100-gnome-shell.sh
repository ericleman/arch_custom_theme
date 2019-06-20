#!/bin/bash
echo "################################################################"
echo "##################  100-gnome-shell.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S gnome dconf dconf-editor gnome-weather gnome-tweaks --noconfirm --needed
# I choose not to install gnome-extra but just: dconf dconf-editor gnome-weather gnome-tweaks

systemctl enable gdm.service

