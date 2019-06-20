#!/bin/bash
echo "################################################################"
echo "########################### 040-yay.sh #########################"
echo "################################################################"
su - eric -c "cd /home/eric && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -csi --noconfirm --skippgpcheck && cd .."
rm -rf /home/eric/yay


