#!/usr/bin/env bash
for file in $@; do
  rsync -aP --no-perms -e ssh jduc@frt.el.vital-it.ch:"$file" .
done
