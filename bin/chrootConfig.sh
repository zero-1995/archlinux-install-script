#!/bin/bash
# Chroot config script

ClockConfig(){
	cd 
	ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
	hwclock --systohc
}

# TODO: edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 ...
LanguageConfig(){	
	locale-gen
	echo LANG=en_US.UTF-8 > /etc/locale.conf
}

HostConfig(){
	echo archLinux > /etc/hostname
}

Initramfs(){
	mkinitcpio -P
}

SetRootPassword(){
	passwd
}

InternetConfig(){
        sudo pacman -Sy dhcpcd networkmanager-pptp networkmanager-vpnc networkmanager-openvpn networkmanager-openconnect netctl dialog
        systemctl enable NetworkManager.service
        systemctl start dhcpcd.service
}


# TODO: edit /etc/sudoers file
# TODO: make AddUser() more dynamic
AddUser(){
        sudo pacman -Sy zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting grml-zsh-config
        useradd -m -G wheel,power,storage,tty -s /bin/zsh shervin
        passwd shervin
}

BootLoader(){
	pacman -Sy grub os-prober
	grub-install /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg
}

ClockConfig
LanguageConfig
HostConfig
Initramfs
SetRootPassword
InternetConfig
AddUser
BootLoader
