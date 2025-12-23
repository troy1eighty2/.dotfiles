#!/bin/bash
# set -euo pipefail

# sudo vim /etc/anacrontab

STATES=(IDLE CHECK_CONNECTION MAKE_SNAPSHOT SEND_SNAPSHOT CLEAN_UP)
STATEFILE_PATH='/home/troy_chan55/.dotfiles/STATEFILE'

function checkPrereq(){
  echo "checking preq"
}
function logicController(){
  state=$(cat $STATEFILE_PATH)
  if [[ $state = "IDLE" ]];then
    beginIdleLogic
  elif [[ $state = "CHECK_CONNECTION" ]]; then
    beginIdleLogic
  elif [[ $state = "MAKE_SNAPSHOT" ]]; then
    beginMakeSnapshotLogic
  elif [[ $state = "SEND_SNAPSHOT" ]]; then
    beginSendSnapshotLogic
  elif [[ $state = "CLEAN_UP" ]]; then
    cleanup
  else
    echo 'IDLE' > $STATEFILE_PATH
    beginIdleLogic
  fi
}
function beginIdleLogic(){
  checkConnection
  read root_snap home_snap <<< $(makeSnapshot)
  sendSnapshot $root_snap $home_snap
  cleanup
}
function beginMakeSnapshotLogic(){
  #delete make
  echo "making snap"
}
function beginSendSnapshotLogic(){
  #delete send
  echo "sending snap"
}
function checkConnection(){
  echo "checking con"
  echo 'CHECK_CONNECTION' > $STATEFILE_PATH

  while :; do
    if [[ -d '/mnt/ssd-backups' ]] && ping -c 1 100.122.153.97 > /dev/null 2>&1; then
      break
    else
      echo sleeping
      sleep 1
    fi
  done
}

function makeSnapshot(){
  echo 'MAKE_SNAPSHOT' > $STATEFILE_PATH
  root_snap=$(snapper -c root create -c number --print-number)
  home_snap=$(snapper -c home create -c number --print-number)
  echo "$root_snap $home_snap"
}

function sendSnapshot(){
  echo 'SEND_SNAPSHOT' > $STATEFILE_PATH

  mkdir -p "/mnt/ssd-backups/root/$1"
  mkdir -p "/mnt/ssd-backups/home/$2"

  btrfs send "/.snapshots/$1/snapshot" | btrfs receive "/mnt/ssd-backups/root/$1"
  btrfs send "/home/.snapshots/$2/snapshot" | btrfs receive "/mnt/ssd-backups/home/$2"

  #send to remote
  # btrfs send "/.snapshots/$1/snapshot" | btrfs receive "/mnt/ssd-backups/root/$1"
  # btrfs send "/home/.snapshots/$2/snapshot" | btrfs receive "/mnt/ssd-backups/home/$2"
}

function cleanup(){
  echo 'CLEAN_UP' > $STATEFILE_PATH
  snapper -c root cleanup number
  snapper -c home cleanup number
  echo 'IDLE' > $STATEFILE_PATH
}

function main(){
  checkPrereq
  logicController
}

main
