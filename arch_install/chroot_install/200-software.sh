#!/bin/bash
echo "################################################################"
echo "########################### 200-software.sh ####################"
echo "################################################################"

pacman -Syyu --noconfirm

pacman -S screenfetch --noconfirm --needed
