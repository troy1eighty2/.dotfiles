#
# ~/.bash_profile
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
