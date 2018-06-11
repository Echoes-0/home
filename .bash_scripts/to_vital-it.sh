#!/bin/bash
rsync -aP -e ssh $@ jduc@frt.el.vital-it.ch:/scratch/cluster/monthly/jduc/transit && exit 0
