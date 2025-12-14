#!/bin/bash

printf "\n\t Starting install script\n"
printf "\n\t Installing packages\n"
printf "\n"

#packages
sudo pacman --noconfirm --needed \
nvim \
git \
fastfetch \
wofi \
cava \
dunst \
nwg-look \
starship \
firefox \
waybar \
obsidian \
wine \
imagemagick \
tailscale \
yubikey-manager \
wl-clipboard \
unzip \
bluetui \
pavucontrol \
tailscale \

hyprlock \
hyprpaper

printf "\n\t Package installation complete\n"
# printf "\n\t Configuring jellyfin\n"
# printf "\n"

##jellyfin media player
# sudo pacman -S mpv --noconfirm --needed \
# libcec \
# p8-platform \
# protobuf \
# qt5-quickcontrols \
# qt5-x11extras
# mkdir ~/builds
# cd ~/builds
# git clone https://aur.archlinux.org/qt5-webengine.git
# makepkg -si
# sudo pacman -S jellyfin-media-player --noconfirm

# printf "\n\t Jellyfin installation complete\n"
printf "\n\t Installing flatpak\n"
printf "\n"

#flatpak
sudo pacman -S flatpak --noconfirm --needed
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client

printf "\n\t Flatpak installation complete\n"
# printf "\n\t Installing builds\n"
# printf "\n"
#
# #builds
# mkdir ~/builds
# cd ~/builds
# git clone https://aur.archlinux.org/jellyfin-media-player.git
# cd jellyfin-media-player
# makepkg -si
#
# printf "\n\t Build installation complete\n"
# printf "\n\t Configuring systemd\n"
# printf "\n"
#
# #systemd
# sudo systemctl enable --now pcscd.service
#
# printf "\n\t Systemd configuration complete\n"
printf "\n\t Configuring fonts\n"
printf "\n"

#fonts
# sudo mkdir -p /usr/local/share/fonts/
# sudo wget -P /usr/local/share/fonts -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
sudo pacman -S fontconfig --noconfirm --needed
#sudo unzip /usr/local/share/fonts/font.zip -d /usr/local/share/fonts


printf "\n\t Jellyfin configuration complete\n"
printf "\n\t Installation done.\n"
