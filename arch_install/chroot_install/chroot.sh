#!/bin/bash
echo "################################################################"
echo "###########################  chroot.sh #########################"
echo "################################################################"

USERNAME=$1
PASSWORD=$2
DESKTOP=$3
HARDWARE=$4
LTS=$5

echo "USERNAME is: $USERNAME"
echo "PASSWORD is: $PASSWORD"
echo "DESKTOP is: $DESKTOP"
echo "HARDWARE is: $HARDWARE"
echo "LTS is: $LTS"

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '*************** Machine, Time and Local settings'
echo '************************************************'
echo '************************************************'
echo "Archlinux" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1     localhost" >> /etc/hosts
echo "127.0.0.1 Archlinux.localdomain Archlinux" >> /etc/hosts

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_DK.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo 'LC_TIME=en_DK.UTF-8' >> /etc/locale.conf
echo 'KEYMAP="fr-pc"' >> /etc/vconsole.conf
echo 'CONSOLEFONT="lat9w-16"' >> /etc/vconsole.conf

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** NetworkManager, NTP, SSH'
echo '************************************************'
echo '************************************************'
pacman -Syyu --noconfirm networkmanager ntp openssh
systemctl enable NetworkManager
systemctl enable ntpd
systemctl enable sshd

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Users (needs to be after vboxsf creation if we use vbox)'
echo '************************************************'
echo '************************************************'
useradd -m -s /bin/bash -G adm,systemd-journal,wheel,games,network,video,audio,optical,floppy,storage,scanner,power,input -c "Eric" eric
echo -en "$PASSWORD\n$PASSWORD" | passwd "eric"
chmod -R 777 /chroot_install/

echo -en "$PASSWORD\n$PASSWORD" | passwd
sed -i 's!# %wheel ALL=(ALL) NOPASSWD: ALL!%wheel ALL=(ALL) NOPASSWD: ALL!g' /etc/sudoers

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Configure Pacman'
echo '************************************************'
echo '************************************************'
sed -i 's%#TotalDownload%TotalDownload\nILoveCandy%g' /etc/pacman.conf
sed -i 's%#Color%Color%g' /etc/pacman.conf
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
echo '' >> /etc/pacman.conf

#echo '[arcolinux_repo]' >> /etc/pacman.conf
#echo 'SigLevel = Required DatabaseOptional TrustAll' >> /etc/pacman.conf
#echo 'Server = https://arcolinux.github.io/arcolinux_repo/$arch' >> /etc/pacman.conf

sed -i 's%#IgnorePkg   =%IgnorePkg = postgresql postgresql-libs %g' /etc/pacman.conf

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** YAY (need to be after eric creation)'
echo '************************************************'
echo '************************************************'
pacman -Syyu --noconfirm git
su - eric -c "cd /home/eric && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -csi --noconfirm --skippgpcheck && cd .."
rm -rf /home/eric/yay



echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Boot configuration'
echo '************************************************'
echo '************************************************'
if [ "$LTS" == "lts" ]
then
    mkinitcpio -p linux-lts
else
    mkinitcpio -p linux
fi
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Package installations'
echo '************************************************'
echo '************************************************'
if [ "$DESKTOP" == "gnome" ]; then /chroot_install/100-gnome-shell.sh; fi
if [ "$DESKTOP" == "kde" ]; then /chroot_install/100-plasma.sh; fi
if [ "$HARDWARE" == "vbox" ]; then /chroot_install/130-virtualbox.sh $LTS; fi
if [ "$HARDWARE" == "vmware" ]; then /chroot_install/130-vmware.sh; fi
/chroot_install/200-software.sh
/chroot_install/300-AUR.sh

if [ "$DESKTOP" == "gnome" ]; then /chroot_install/500-gnome-settings.sh; fi
/chroot_install/600-other-personal-settings.sh

