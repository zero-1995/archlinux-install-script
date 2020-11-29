#!/bin/bash
# Chroot config script

ClockConfig(){
	cd 
	ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
	hwclock --systohc
}

# TODO: delete cd /archlinux-install-script/bin and make it a path variable
LanguageConfig(){
	cd /archlinux-install-script/bin
	cp ./config-files/locale.gen /etc/locale.gen	
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
        sudo pacman -Sy --noconfirm dhcpcd networkmanager-pptp networkmanager-vpnc networkmanager-openvpn networkmanager-openconnect netctl dialog
        systemctl enable NetworkManager.service
        systemctl start dhcpcd.service
}

# TODO: make AddUser() more dynamic
AddUser(){
	cp ./config-files/sudoers /etc/sudoers
        sudo pacman -Sy --noconfirm zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting grml-zsh-config
        useradd -m -G wheel,power,storage,tty -s /bin/zsh shervin
        passwd shervin
}

BootLoader(){
	pacman -Sy --noconfirm grub os-prober
	grub-install /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg
}

ClockConfig
LanguageConfig
HostConfig
Initramfs
InternetConfig
BootLoader
SetRootPassword
AddUser
