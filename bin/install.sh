#!/bin/bash
# Install ArchLinux script

# TODO: Add function to create /, home, swap, ...

BasePackage(){
	echo "
	Let's have fun with ArchLinux!
	"
	pacstrap -i /mnt base base-devel linux linux-headers linux-firmware linux-lts linux-lts-headers
}

ConfigureTheSystem(){
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab
}

ChrootConfig(){
	arch-chroot /mnt ./archlinux-install-script/bin/chrootConfig.sh
}


BasePackage
ConfigureTheSystem
ChrootConfig

