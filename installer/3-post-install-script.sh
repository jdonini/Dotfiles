#!/bin/sh

mkdir .local/bin
mkdir .config/fontconfig

cp -r ~/Dotfiles/home/.local/bin/* ~/.local/bin/
cp -r ~/Dotfiles/home/.config/autostart ~/.config/
cp -r ~/Dotfiles/home/.config/dunst ~/.config/
cp -r ~/Dotfiles/home/.config/kitty ~/.config/
cp -r ~/Dotfiles/home/.config/qtile ~/.config/
cp -r ~/Dotfiles/home/.config/neofetch ~/.config/
cp -r ~/Dotfiles/home/.config/nvim ~/.config/
cp -r ~/Dotfiles/home/.config/nwg-launchers ~/.config/
cp -r ~/Dotfiles/home/.config/picom ~/.config/
cp -r ~/Dotfiles/home/.config/ranger ~/.config/
cp -r ~/Dotfiles/home/.config/volumeicon ~/.config/
cp -r ~/Dotfiles/home/.config/rofi ~/.config/
cp -r ~/Dotfiles/home/.config/redshift ~/.config/
cp -r ~/Dotfiles/home/.bashrc ~/
cp -r ~/Dotfiles/home/.xprofile ~/
cp -r ~/Dotfiles/home/wallpapers ~/Pictures/
cp -r ~/Dotfiles/home/.config/nitrogen ~/.config/

cp -r ~/Dotfiles/root/bin/* /bin/
cp -r ~/Dotfiles/root/etc/environment /etc/
cp -r ~/Dotfiles/root/etc/isw.conf /etc/
#cp -r ~/Dotfiles/root/etc/default/zramd /etc/default/zramd
cp -r ~/Dotfiles/root/etc/systemd/system/* /etc/systemd/system/
cp -r ~/Dotfiles/root/usr/share/themes/Vault /usr/share/themes/
cp -r ~/Dotfiles/root/etc/xdg/reflector/reflector.conf /etc/xdg/reflector/

#chmod +x /bin/silence-fan

chmod +x ~/.local/bin/list-keybindings
chmod +x ~/.xprofile
chmod +x ~/.config/qtile/autostart.sh
chmod +x ~/.config/rofi/powermenu/powermenu.sh
chmod +x ~/.config/rofi/launchers/misc/launcher.sh
chmod +x ~/.config/rofi/launchers/colorful/launcher.sh

systemctl enable --now auto-cpufreq
#systemctl enable optimus-manager
systemctl enable lightdm
#systemctl enable --now zramd
systemctl enable --now thermald
#systemctl enable slock@annie.service
#systemctl enable resume-fan.service
systemctl enable reflector.service

systemctl --user enable pipewire
systemctl --user enable pipewire-pulse
systemctl --user enable wireplumber
systemctl --user enable redshift

echo -e 
'<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <alias>
        <family>serif</family>
        <prefer>
        <family>Noto Serif</family>
        <family>emoji</family>
        <family>Liberation Serif</family>
        <family>Nimbus Roman</family>
        <family>DejaVu Serif</family>
        </prefer>
        </alias>
        <alias>
        <family>sans-serif</family>
        <prefer>
        <family>Noto Sans</family>
        <family>emoji</family>
        <family>Liberation Sans</family>
        <family>Nimbus Sans</family>
        <family>DejaVu Sans</family>
        </prefer>
    </alias>
</fontconfig>'
> /home/$USER/.config/fontconfig/fonts.conf
fc-cache -f