#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

pacman -S docker docker-compose grub mtools dosfstools reflector base-devel \n
linux-headers xdg-user-dirs xdg-utils gvfs bash-completion \n
acpi acpi_call acpid upower openbsd-netcat iptables-nft ipset firewalld \n
ntfs-3g gnome-keyring libgnome-keyring blueman cudnn alsa-firmware alsa-plugins \n
alsa-tools alsa-utils arch-audit bluez bluez-utils dmenu dunst efibootmgr exfat-utils \n
gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-base \n
gst-plugins-good gst-plugins-ugly gtk-engine-murrine gtk-engines \n
htop intel-ucode kitty libreoffice-still ttf-hack-nerd flameshot \n
libreoffice-still-pt-br libxss lightdm lightdm-gtk-greeter \n
lightdm-gtk-greeter-settings lxappearance-gtk3 lxsession-gtk3 gpicview \n
lxtask-gtk3 mediainfo mesa-utils neofetch neovim network-manager-applet \n
networkmanager nitrogen nss-mdns nvidia thermald slock \n
nvidia-settings nvidia-utils pavucontrol pcmanfm-gtk3 picom \n
pipewire pipewire-alsa pipewire-jack pipewire-pulse qt5ct qtile \n
imagemagick ranger rebuild-detector redshift rofi tk tlp ttf-fira-code \n
unrar volumeicon wget wpa_supplicant xarchiver xclip xdotool \n
xf86-video-intel xorg zip unzip rustup capitaine-cursors qgis steam \n
deluge-gtk discord gnome-disk-utility gnome-calculator xfce4-power-manager \n
noto-fonts-emoji okular  linux-firmware-qlogic celluloid tumbler \n

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
mv yay ~/.config
cd ~/.config/yay
makepkg -si
