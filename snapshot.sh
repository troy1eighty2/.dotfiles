#!/bin/bash
set -euo pipefail

# sudo vim /etc/anacrontab

function checkConnection(){
  ping -c 1 google.com > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

function makeAndSendSnapshot(){
  home_snap=$(snapper -c home create -c number --print-number)
  root_snap=$(snapper -c root create -c number --print-number)
  echo $home_snap
  echo $root_snap
  snapper -c root send $root_snap | btrfs receive /mnt/ssd-backups/root
  snapper -c home send $home_snap | btrfs receive /mnt/ssd-backups/home


  return 0
}

function main(){
  if checkConnection; then
    makeAndSendSnapshot
    return 0
  else
    echo 'nothing detected'
    return 1
  fi
}

main
