#
# ~/.bashrc
#

# akdwj
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.local/bin:$PATH"
HOMEPATH='/home/troy_chan55'
CURR_PROJ='fatima'

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias snap='sudo snapper -c root create -c number && sudo snapper -c home create -c number && sudo /etc/grub.d/41_snapshots-btrfs && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vim='nvim'
alias lock='hyprlock'
alias ms="cd $HOMEPATH/MyStuff"
alias shutdown="shutdown now"
alias editbash="vim $HOMEPATH/.bashrc"
alias sobash="source $HOMEPATH/.bashrc"
alias edots="vim $HOMEPATH/.dotfiles"
alias ts="ssh -i $HOMEPATH/.ssh/rhel_server.pem ec2-user@ec2-3-16-135-160.us-east-2.compute.amazonaws.com"
alias tts="kitty +kitten ssh troy_chan55@192.168.1.79"
alias q='cd ~/MyStuff/$CURR_PROJ'
alias 6200container='sudo docker run -it -v "$HOME/MyStuff/6200-shared:/home" gtomscs6200/sum24-environment'

alias mvproj='scp -i "$HOMEPATH/.ssh/rhel_server.pem" -r $CURR_PROJ ec2-user@ec2-3-16-135-160.us-east-2.compute.amazonaws.com:~/MyStuff/'
alias yubikey="$HOMEPATH/builds/yubico-authenticator-7.2.3-linux/authenticator"

PS1='[\u@\h \W]\$ '

alias ff='fastfetch --config /home/troy_chan55/.dotfiles/fastfetch/.config/fastfetch/config.jsonc'
alias ffs='fastfetch --config /home/troy_chan55/.dotfiles/fastfetch/.config/fastfetch/configshort.jsonc'

eval "$(starship init bash)"

ffs
