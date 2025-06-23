#
# ~/.bashrc
#

# akdwj
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias snap='sudo snapper -c root create -c number && sudo snapper -c home create -c number && sudo /etc/grub.d/41_snapshots-btrfs && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vim='nvim'
alias lock='hyprlock'
alias ms='cd /home/troy_chan55/MyStuff'
alias shutdown='shutdown now'
alias editbash='vim /home/troy_chan55/.bashrc'
alias sourcebash='source /home/troy_chan55/.bashrc'

PS1='[\u@\h \W]\$ '

alias ff='fastfetch --config /home/troy_chan55/.dotfiles/fastfetch/.config/fastfetch/config.jsonc'
alias ffs='fastfetch --config /home/troy_chan55/.dotfiles/fastfetch/.config/fastfetch/configshort.jsonc'

eval "$(starship init bash)"

ffs
