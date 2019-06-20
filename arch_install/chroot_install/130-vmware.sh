#!/bin/bash
echo "################################################################"
echo "######################## 130-vmware.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S open-vm-tools xf86-video-vmware --noconfirm --needed

systemctl enable vmtoolsd.service
systemctl enable vmware-vmblock-fuse.service