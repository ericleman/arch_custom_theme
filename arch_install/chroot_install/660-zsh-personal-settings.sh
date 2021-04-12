#!/bin/bash
echo "################################################################"
echo "############### 660-zsh-personal-settings.sh #################"
echo "################################################################"


su eric -c "curl -k -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
su eric -c "yes | sh install.sh"
su eric -c "rm install.sh"

su eric -c "cp /chroot_install/personal/.zshrc /home/eric/.zshrc"
