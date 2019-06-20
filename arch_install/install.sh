#!/bin/bash
echo "################################################################"
echo "###########################  install.sh ########################"
echo "################################################################"

##################################################################################################################
#
#   DEFINE SOME VARIABLES BELOW:
#
##################################################################################################################

USERNAME=eric
PASSWORD=$1
DESKTOP=gnome
HARDWARE=vmware
SWAP_SIZE=12

echo "USERNAME is: $USERNAME"
echo "PASSWORD is: $PASSWORD"
echo "DESKTOP is: $DESKTOP"
echo "HARDWARE is: $HARDWARE"
echo "SWAP_SIZE is: $SWAP_SIZE"

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Partition and Mount Drives'
echo '************************************************'
echo '************************************************'
if [ "$HARDWARE" == "vbox" ]
then
    parted -s /dev/sda mklabel gpt \
      mkpart ESP fat32 1 512M \
      mkpart primary linux-swap 512M "$SWAP_SIZE"G \
      mkpart primary ext3 "$SWAP_SIZE"G 100% \
      set 1 boot on
fi

if [ "$HARDWARE" == "vmware" ]
then
    parted -s /dev/sda mklabel gpt \
      mkpart ESP fat32 1 512M \
      mkpart primary linux-swap 512M "$SWAP_SIZE"G \
      mkpart primary ext3 "$SWAP_SIZE"G 100% \
      set 1 boot on
fi

mkfs.vfat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** Configure French Repository'
echo '************************************************'
echo '************************************************'
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's%Server%#Server%g' /etc/pacman.d/mirrorlist
sed -i 's%#Server = http://mir.archlinux.fr/$repo/os/$arch%Server = http://mir.archlinux.fr/$repo/os/$arch%g' /etc/pacman.d/mirrorlist

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** PacStrapping Package'
echo '************************************************'
echo '************************************************'
#si pas LTS:
pacstrap /mnt base base-devel mc mtools dosfstools lsb-release ntfs-3g exfat-utils syslog-ng grub os-prober sudo wget openssh efibootmgr
#si LTS:
#pacstrap /mnt base base-devel mc mtools dosfstools lsb-release ntfs-3g exfat-utils syslog-ng  grub os-prober sudo wget openssh efibootmgr linux-lts
#if [ "$1" == "vbox" ]; then pacstrap /mnt efibootmgr; fi

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** genfstab'
echo '************************************************'
echo '************************************************'
genfstab -U -p /mnt >> /mnt/etc/fstab


echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** timedatectl'
echo '************************************************'
echo '************************************************'
timedatectl set-ntp true

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** CHROOTing'
echo '************************************************'
echo '************************************************'
cp -R ./chroot_install /mnt
arch-chroot /mnt ./chroot_install/chroot.sh "$USERNAME" "$PASSWORD" "$DESKTOP" "$HARDWARE" |& tee /mnt/chroot_install/install.log

echo '' && echo ''
echo '************************************************'
echo '************************************************'
echo '**************** end of CHROOT, rebooting'
echo '************************************************'
echo '************************************************'
umount -R /mnt
echo "Type: systemctl reboot"
