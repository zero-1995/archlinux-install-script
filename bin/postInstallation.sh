#!/bin/bash
# Post Installation script

basic(){
    sudo pacman -Sy xorg xorg-xrandr ntfs-3g alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol bluez bluez-utils networkmanager network-manager-applet networkmanager-qt ttf-dejavu zip unzip unrar xarchiver 
}

basicApps(){
    sudo pacman -Sy flashplugin chromium firefox vlc nautilus gimp inkscape libreoffice
}

# TODO: Fix graphicsDriver function and nvidia setting
graphicsDriver(){
    sudo pacman -Sy nvidia nvidia-utils lib32-nvidia-utils xfce4 xfce4-goodies
}

programming(){
	sudo pacman -Sy go python netbeans code atom gedit mousepad leafpad android-file-transfer android-tools android-udev
}

devOs(){
        sudo pacman -Sy git docker
}

hack(){
        sudo pacman -Sy proxychains-ng proxytunnel tor polipo
}

basic
basicApps
#graphicsDriver
#programming
#devOs
#hack
