#!/bin/bash
set -euo pipefail
if [[ $EUID -ne 0 ]]; then
  echo "Run this script as root (sudo)"
  exit 1
fi

USER="troy_chan55"
BACKUP_DEVICE_PATH="/dev/sda1"
BOOT_DEVICE_ROOT_PATH="/dev/nvme0n1p2"

BACKUP_DEVICE_UUID=$(blkid -s UUID -o value "$BACKUP_DEVICE_PATH")
BOOT_DEVICE_ROOT_UUID=$(blkid -s UUID -o value "$BOOT_DEVICE_ROOT_PATH")


printf "\n\t Starting install script\n"
printf "\n\t Installing packages\n"
printf "\n"

#packages
pacman -S --noconfirm --needed \
nvim \
git \
npm \
python-psutil \
fastfetch \
wofi \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
cava \
dunst \
nwg-look \
gcc \
less \
starship \
firefox \
waybar \
fd \
obsidian \
wine \
python3 \
psutil \
bashtop \
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
tmux \
keyd \
snapper \
otf-font-awesome \
ttf-space-mono-nerd \
hyprpaper \
shellcheck \
vi \
vlc \
brightnessctl \
gtk3 \
chafa \
cronie

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
systemctl enable --now pcscd.service
systemctl enable --now bluetooth.service
systemctl enable --now keyd 
systemctl enable --now cronie.service
systemctl disable snapper-timeline.timer

# printf "\n\t Systemd configuration complete\n"
printf "\n\t Configuring fonts\n"
printf "\n"

#fonts
fc-cache
mkdir -p /usr/local/share/fonts/

printf "\n\t Font configuration complete\n"
printf "\n\t Configuring Mounts\n"

mkdir -p /mnt/ssd-backups/home
mkdir -p /mnt/ssd-backups/root
mkdir -p /pkg
mkdir -p /log



if ! grep -q "UUID=$BOOT_DEVICE_ROOT_UUID.*subvol=@," /etc/fstab
then
  echo "UUID=$BOOT_DEVICE_ROOT_UUID / btrfs subvol=@,defaults,nofail 0 1" >> /etc/fstab
fi
if ! grep -q "UUID=$BOOT_DEVICE_ROOT_UUID.*subvol=.snapshots," /etc/fstab
then
  echo "UUID=$BOOT_DEVICE_ROOT_UUID /.snapshots btrfs subvol=.snapshots,defaults,nofail 0 2" >> /etc/fstab
fi
if ! grep -q "UUID=$BOOT_DEVICE_ROOT_UUID.*subvol=@home," /etc/fstab
then
  echo "UUID=$BOOT_DEVICE_ROOT_UUID /home btrfs subvol=@home,defaults,nofail 0 2" >> /etc/fstab
fi
if ! grep -q "UUID=$BOOT_DEVICE_ROOT_UUID.*subvol=@log," /etc/fstab
then
  echo "UUID=$BOOT_DEVICE_ROOT_UUID /log btrfs subvol=@log,defaults,nofail 0 2" >> /etc/fstab
fi
if ! grep -q "UUID=$BOOT_DEVICE_ROOT_UUID.*subvol=@pkg," /etc/fstab
then
  echo "UUID=$BOOT_DEVICE_ROOT_UUID /pkg btrfs subvol=@pkg,defaults,nofail 0 2" >> /etc/fstab
fi
if ! grep -q "UUID=$BACKUP_DEVICE_UUID" /etc/fstab; then
  echo "UUID=$BACKUP_DEVICE_UUID /mnt/ssd-backups auto defaults,nofail 0 2" >> /etc/fstab
fi
if ! mountpoint /mnt/ssd-backups
then
  mount $BACKUP_DEVICE_PATH /mnt/ssd-backups
fi


printf "\n\t Mount Configuration Complete\n"
printf "\n\t Configuring remaps\n"
printf "\n"
if [[ ! -f /etc/keyd/default.conf ]]; then
  cat << EOF > /etc/keyd/default.conf
[ids]

*

[main]

#capslock = overload(control, esc)
capslock = esc
EOF
fi
keyd reload
printf "\n\t Remap configuration complete\n"
printf "\n\t Configuring snapper\n"
printf "\n"

if ! snapper list-configs | grep -q '^root'; then
  snapper -c root create-config / 
fi
if ! snapper list-configs | grep -q '^home'; then
  snapper -c home create-config /home
fi

printf "\n\t Snapper configuration complete\n"

git config --global user.email "troytran000@gmail.com"
git config --global user.name "Troy"
printf "\n\t Installation done. Reboot to finish.\n"
