#!/bin/bash
echo "################################################################"
echo "######################## 130-vmware.sh #########################"
echo "################################################################"

pacman -Syyu --noconfirm
pacman -S open-vm-tools xf86-video-vmware --noconfirm --needed

cat > /etc/systemd/system/share-vmware-folder.service <<EOF
[Unit]
Description=Load VMware shared folders
Requires=vmware-vmblock-fuse.service
After=vmware-vmblock-fuse.service
#ConditionPathExists=.host:/Desktop
ConditionVirtualization=vmware

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=
ExecStart=/usr/bin/vmhgfs-fuse -o allow_other -o auto_unmount .host:/Desktop /home/eric/LEMANE-10W
ExecStart=/usr/bin/chmod 777 /home/eric/LEMANE-10W

[Install]
WantedBy=multi-user.target
EOF

su eric -c "mkdir /home/eric/LEMANE-10W"


systemctl enable vmtoolsd.service
systemctl enable vmware-vmblock-fuse.service
systemctl enable share-vmware-folder.service