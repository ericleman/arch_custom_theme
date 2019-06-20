#!/bin/bash
echo "################################################################"
echo "############ 610-vscodium-personal-settings.sh #################"
echo "################################################################"

su eric -c "cp /chroot_install/personal/VSCodium/settings.json /home/eric/.config/VSCodium/User/settings.json"
