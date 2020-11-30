#!/bin/bash
# Post Installation script
yay(){
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

basic(){
    sudo pacman -Sy --noconfirm xorg xorg-xrandr ntfs-3g alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol bluez bluez-utils networkmanager network-manager-applet networkmanager-qt ttf-dejavu zip unzip unrar xarchiver 
}

basicApps(){
    sudo pacman -Sy --noconfirm flashplugin firefox vlc nautilus gimp inkscape libreoffice
}

# TODO: Fix graphicsDriver function and nvidia setting
graphicsDriver(){
    sudo pacman -Sy --noconfirm nvidia nvidia-utils lib32-nvidia-utils xfce4 xfce4-goodies
}

programming(){
    sudo pacman -Sy --noconfirm code leafpad android-file-transfer android-tools android-udev
}

devOs(){
    sudo pacman -Sy --noconfirm git docker
}

hack(){
    sudo pacman -Sy --noconfirm proxychains-ng proxytunnel tor polipo
}

#yay
basic
#basicApps
graphicsDriver
#programming
#devOs
#hack
