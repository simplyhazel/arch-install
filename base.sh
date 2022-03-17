#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
hwclock --systohc
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us-acentos" >> /etc/vconsole.conf
echo "archlinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archlinux.localdomain archlinux" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S refind efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers xdg-user-dirs xdg-utils inetutils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion rsync reflector virt-manager qemu qemu-arch-extra edk2-ovmf os-prober ntfs-3g terminus-font nvidia nvidia-settings nvidia-utils

systemctl enable NetworkManager

useradd -m simplyhazel
echo simplyhazel:password | chpasswd
usermod -aG wheel,audio,video,libvirt simplyhazel

echo "simplyhazel ALL=(ALL) ALL" >> /etc/sudoers.d/simplyhazel


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
