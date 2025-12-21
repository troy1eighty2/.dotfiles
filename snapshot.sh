#!/bin/bash
set -euo pipefail

# crontab -e
# 0 6,18 * * * /home/$USER/.dotfiles/snapshot.sh

function checkConnection(){
  ping -c 1 google.com > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

function makeSnapshot(){
  echo 'make snapshot'
  return 0
}

function main(){
  while :; do
    if checkConnection; then
      makeSnapshot
      break
    fi
    echo 'nothing detected'
    sleep 120
  done
}

main
