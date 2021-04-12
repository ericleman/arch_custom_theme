# arch
 Boot machine with Arch linux ISO in CDROM Drive (on VMWare: VM > Power > Power on to firmware)  
`loadkeys fr-pc` # i.e.: loqdkeys fr)pc

`curl -k -L https://github.com/ericleman/arch/raw/master/start --output start`  
`sh start [password]`

or

`curl -k -L https://git.io/fjVgK -o start`  
`sh start [password]`

# Customization before launching these scripts
On github, configure these files if need be:  
In `arch_install/install.sh`, edit the variables:  
`USERNAME=eric`  
`PASSWORD=$1`  
`DESKTOP=gnome`  
`HARDWARE=vmware`  
`SWAP_SIZE=12`  
`LTS=no`  

In `arch_install/chroot_install/chroot.sh`, edit the soft to install:  
`/chroot_install/00x-script-which-install-something.sh`  
`/chroot_install/00y-script-which-install-something-else.sh`


# TO DO ON A REGLAR BASIS WHEN THE OS IS INSTALLED
`sudo pacman -Scc`  (Emply cache)  
`sudo pacman -Syyu`  (update packages)  
`trizen -Syyu` does sudo pacman -Syyu  

remove orphans:  
`sudo pacman -Rns $(pacman -Qtdq)`  

# Otherwise, run SSH on VMWare
Not on VPN, with NAT, on latest ISO:  
`loadkeys fr-pc` # i.e.: loqdkeys fr)pc  
`passwd` # type a password for root  
`systemctl start sshd`  
`ifconfig` # note IP address  
Then on local PC, command line:  
`ssh -p 22 root@192.168.232.138` # put correct IP address  

# My VMWare config
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.37.31.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.37.45.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.37.51.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.37.53.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.37.57.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.38.02.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.38.33.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.38.40.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-18%2015.39.11.png)
![Image description](https://github.com/ericleman/arch/blob/master/pictures/2019-06-20%2012.23.18.png)



