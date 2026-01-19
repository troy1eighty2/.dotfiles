#
# ~/.bash_profile
#
# jellyfin-rpc-x86_64-linux &

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec start-hyprland
fi

