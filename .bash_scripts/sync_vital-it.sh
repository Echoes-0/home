#!/usr/bin/env bash

rsync -aP --no-perms -e ssh jduc@frt.el.vital-it.ch:monthly/transit/* .
