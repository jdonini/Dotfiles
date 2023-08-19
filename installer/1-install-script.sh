#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtimeln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

reflector --verbose --latest 10 -c Brazil --sort rate --save /etc/pacman.d/mirrorlist

pacman -S docker docker-compose grub mtools dosfstools reflector base-devel linux-headers xdg-user-dirs xdg-utils gvfs bash-completion acpi acpi_call acpid upower openbsd-netcat iptables-nft ipset firewalld ntfs-3g gnome-keyring libgnome-keyring blueman cudnn alsa-firmware alsa-plugins alsa-tools alsa-utils arch-audit bluez bluez-utils dmenu dunst efibootmgr exfat-utils gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gtk-engine-murrine gtk-engines htop kitty libreoffice-still ttf-hack-nerd flameshot libreoffice-still-pt-br libxss lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lxappearance-gtk3 lxsession-gtk3 gpicview lxtask-gtk3 mediainfo mesa-utils neofetch neovim network-manager-applet networkmanager nitrogen nss-mdns nvidia thermald slock nvidia-settings nvidia-utils pavucontrol pcmanfm-gtk3 picom pipewire pipewire-alsa pipewire-jack pipewire-pulse qt5ct qtile imagemagick ranger rebuild-detector redshift rofi tk tlp ttf-fira-code unrar volumeicon wget wpa_supplicant xarchiver xclip xdotool xorg zip unzip rustup capitaine-cursors qgis steam deluge-gtk discord gnome-disk-utility gnome-calculator xfce4-power-manager noto-fonts-emoji okular linux-firmware-qlogic celluloid tumbler

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
