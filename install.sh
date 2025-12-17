#!/bin/bash
set -euo pipefail
if [[ $EUID -ne 0 ]]; then
  echo "Run this script as root (sudo)"
  exit 1
fi

BACKUP_DEVICE_PATH="/dev/sda1"
UUID=$(blkid -s UUID -o value "$BACKUP_DEVICE_PATH")


printf "\n\t Starting install script\n"
printf "\n\t Installing packages\n"
printf "\n"

#packages
pacman -S --noconfirm --needed \
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
yubikey-manager \
wl-clipboard \
unzip \
pavucontrol \
tailscale \
pipewire \
pipewire-alsa \
pipewire-pulse \
wireplumber \
bluez \
bluez-utils \
bluetui \
base-devel \
fontconfig \
hyprshot \
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

pacman -S flatpak --noconfirm --needed
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client

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
# sudo systemctl enable --now bluetooth.service
#
# printf "\n\t Systemd configuration complete\n"
printf "\n\t Configuring fonts\n"
printf "\n"

#fonts
mkdir -p /usr/local/share/fonts/

printf "\n\t Font configuration complete\n"
printf "\n\t Configuring Internal SSD\n"

mkdir -p "/mnt/ssd-backups"

if ! grep -q "UUID=$UUID" /etc/fstab; then
  echo "UUID=$UUID  /mnt/ssd-backups auto  defaults,nofail  0  2" >> /etc/fstab
fi

printf "\n\t Internal SSD Configuration Complete\n"
printf "\n\t Installation done.\n"
