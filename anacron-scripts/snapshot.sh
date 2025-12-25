#!/bin/bash
# set -euo pipefail

# sudo vim /etc/anacrontab

STATES=(IDLE CHECK_CONNECTION MAKE_SNAPSHOT SEND_SNAPSHOT CLEAN_UP)
STATEFILE_PATH='/var/lib/btrfs-backup-meta/STATEFILE'
SNAP_META_PATH='/var/lib/btrfs-backup-meta/SNAP_META'

function checkPrereq(){
  if [[ ! -d "/mnt/ssd-backups" ]]; then
    return 1
  fi
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
    echo 'IDLE' > "$STATEFILE_PATH"
    beginIdleLogic
  fi
}
function beginIdleLogic(){
  checkConnection
  makeSnapshot
  sendSnapshot
  cleanup
}
function beginMakeSnapshotLogic(){
  checkConnection
  cleanup
  makeSnapshot
  sendSnapshot
  cleanup
}
function beginSendSnapshotLogic(){
  checkConnection
  cleanup
  sendSnapshot
  cleanup
}
function checkConnection(){
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
  echo "$root_snap $home_snap" > $SNAP_META_PATH
}

function sendSnapshot(){
  echo 'SEND_SNAPSHOT' > $STATEFILE_PATH
  read root_snap home_snap <<< "$(cat $SNAP_META_PATH)"

  if [[ -d "/mnt/ssd-backups/root/$root_snap" ]] || [[ -d "/mnt/ssd-backups/home/$home_snap" ]];then
    btrfs subvolume delete "/mnt/ssd-backups/root/$root_snap"
    btrfs subvolume delete "/mnt/ssd-backups/home/$home_snap"
    rm -rf  "/mnt/ssd-backups/root/$root_snap"
    rm -rf  "/mnt/ssd-backups/home/$home_snap"
  fi

  mkdir -p "/mnt/ssd-backups/root/$root_snap"
  mkdir -p "/mnt/ssd-backups/home/$home_snap"

  btrfs send "/.snapshots/$root_snap/snapshot" | btrfs receive "/mnt/ssd-backups/root/$root_snap"
  btrfs send "/home/.snapshots/$home_snap/snapshot" | btrfs receive "/mnt/ssd-backups/home/$home_snap"

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
