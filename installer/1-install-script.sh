#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

pacman -S docker docker-compose grub mtools dosfstools reflector base-devel linux-headers xdg-user-dirs xdg-utils gvfs bash-completion rsync acpi acpi_call acpid upower openbsd-netcat iptables-nft ipset firewalld flatpak os-prober ntfs-3g

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable fstrim.timer
systemctl enable firewalld

systemctl start docker.service
systemctl enable docker.service 

# change permissions for wheel group
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
# fan permissions with MSI computer
echo "ALL ALL=(ALL) NOPASSWD: /bin/isw" >> /etc/sudoers
echo "ALL ALL=(ALL) NOPASSWD: /usr/bin/isw" >> /etc/sudoers
echo "ALL ALL=(ALL) NOPASSWD: /bin/silence-fan" >> /etc/sudoers

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
