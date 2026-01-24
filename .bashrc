# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.local/bin:$PATH"
export CLASS_ATTACHMENTS="$HOME/MyStuff/daily/Class/class-attachments"
export HYPRSHOT_DIR="$HOME/Wallpapers"
HOMEPATH='/home/troy_chan55'
MYSTUFF="$HOMEPATH/MyStuff"
CURR_PROJ='two-target-resolution'

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias snap='sudo snapper -c root create -c number && sudo snapper -c home create -c number && sudo /etc/grub.d/41_snapshots-btrfs && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vim='nvim'
alias lock='hyprlock'
alias ms="cd $HOMEPATH/MyStuff"
alias shutdown="shutdown now"
alias editbash="vim $HOMEPATH/.bashrc"
alias editinstall="vim $HOMEPATH/.dotfiles/install.sh"
alias sobash="source $HOMEPATH/.bashrc"
alias soenv="source $MYSTUFF/$CURR_PROJ/venv/bin/activate" 
alias edots="vim $HOMEPATH/.dotfiles"
# alias ts="ssh -i $HOMEPATH/.ssh/rhel_server.pem ec2-user@ec2-3-16-135-160.us-east-2.compute.amazonaws.com"
alias tts="kitty +kitten ssh troy_chan55@100.122.153.97"
alias q='cd ~/MyStuff/$CURR_PROJ'
alias v="nvim"
alias s="hyprshot -m region"
alias 6200container='sudo docker run -it -v "$HOME/MyStuff/6200-shared:/home/user" gtomscs6200/sum24-environment'
alias macsequoia='quickemu --vm $HOME/macos-sonoma.conf'
alias sharedmusic="cd /mnt/nfs_shared/Media/Music"
alias spotiFLAC="wine /builds/SpotiFLAC.AppImage"
alias mvproj='rsync -aP --delete "$MYSTUFF/$CURR_PROJ" troy_chan55@100.122.153.97:~/MyStuff/'

alias yubikey="$HOMEPATH/builds/yubico-authenticator-7.2.3-linux/authenticator"

alias r90="hyprctl keyword monitor eDP-1,preferred,auto,1,transform,1"
alias r0="hyprctl keyword monitor eDP-1,preferred,auto,1,transform,0"

PS1='[\u@\h \W]\$ '

alias ff='fastfetch --config /home/troy_chan55/.dotfiles/.config/fastfetch/config.jsonc'
alias ffs='fastfetch --config /home/troy_chan55/.dotfiles/.config/fastfetch/configshort.jsonc'


alias vysor='./home/troy_chan55/builds/vysor-bin/usr/bin/vysorapp'

eval "$(starship init bash)"

ffs
