#!/bin/bash
echo "################################################################"
echo "############ 600-other-personal-settings.sh ####################"
echo "################################################################"

su eric -c "cp /chroot_install/personal/.bashrc /home/eric/.bashrc"
su eric -c "cp /chroot_install/personal/mimeapps.list /home/eric/.config/mimeapps.list"
