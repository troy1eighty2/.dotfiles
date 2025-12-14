#!/bin/bash

printf "\n\t Starting install script\n"
printf "\n\t Installing packages\n"
printf "\n"

#packages
sudo pacman -Syu --noconfirm
sudo pacman -S nvim --noconfirm
sudo pacman -S fastfetch --noconfirm
sudo pacman -S wofi --noconfirm
sudo pacman -S cava --noconfirm
sudo pacman -S dunst --noconfirm
sudo pacman -S nwg-look --noconfirm
sudo pacman -S starship --noconfirm
sudo pacman -S firefox --noconfirm
sudo pacman -S waybar --noconfirm
sudo pacman -S obsidian --noconfirm
sudo pacman -S wine --noconfirm
sudo pacman -S imagemagick --noconfirm
sudo pacman -S tailscale --noconfirm
sudo pacman -S yubikey-manager --noconfirm
sudo pacman -S wl-clipboard --noconfirm
sudo pacman -S unzip --noconfirm

sudo pacman -S hyprlock --noconfirm
sudo pacman -S hyprpaper --noconfirm


printf "\n\t Font configuration complete\n"
printf "\n\t Configuring jellyfin\n"
printf "\n"
#jellyfin media player
sudo pacman -S mpv --noconfirm
sudo pacman -S libcec --noconfirm
sudo pacman -S p8-platform --noconfirm
sudo pacman -S protobuf --noconfirm
sudo pacman -S qt5-quickcontrols --noconfirm
cd ~/builds
git clone https://aur.archlinux.org/qt5-webengine.git
makepkg -si
sudo pacman -S qt5-x11extras --noconfirm
sudo pacman -S jellyfin-media-player --noconfirm

printf "\n\t Package installation complete\n"
printf "\n\t Installing flatpak\n"
printf "\n"

#flatpak
sudo pacman -S flatpak --noconfirm
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client

printf "\n\t Flatpak installation complete\n"
printf "\n\t Installing builds\n"
printf "\n"

#builds
mkdir ~/builds
cd ~/builds
git clone https://aur.archlinux.org/jellyfin-media-player.git
cd jellyfin-media-player
makepkg -si

printf "\n\t Build installation complete\n"
printf "\n\t Configuring systemd\n"
printf "\n"

#systemd
sudo systemctl enable --now pcscd.service

printf "\n\t Systemd configuration complete\n"
printf "\n\t Configuring fonts\n"
printf "\n"

#fonts
sudo pacman -S fontconfig --noconfirm
sudo mkdir -p /usr/local/share/fonts/
sudo wget -P /usr/local/share/fonts -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
sudo unzip /usr/local/share/fonts/font.zip -d /usr/local/share/fonts


printf "\n\t Jellyfin configuration complete\n"
printf "\n\t Installation done.\n"
