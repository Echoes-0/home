#!/bin/bash
set -e

srv=$(df /mnt/lvg | tail -n +2 | awk '{print $1}')
if [ $srv =  "//svfas6.epfl.ch/trono-lab" ]; then
  mydate=$(date -Imin)
  cd ~/samba/projects/
  git add -A > /dev/null 2>1
  git commit -m $mydate > /dev/null 2>&1
  echo $mydate >> /var/log/samba_gitpush/logs.txt
  git push  >> /var/log/samba_gitpush/logs.txt 2>&1
  echo "===="
fi

