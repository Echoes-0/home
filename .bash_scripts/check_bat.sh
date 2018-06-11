#!/bin/bash

bat=$(< /sys/class/power_supply/BAT0/energy_now)
tot=$(< /sys/class/power_supply/BAT0/energy_full)

percint=$(bc -l <<< "scale=0; 100 * $bat / $tot") 
perc=$(bc -l <<< "scale=2; 100 * $bat / $tot") 

if [ $percint -lt 5 ]; then
  notify-send -u critical  "/!\\/!\\/!\\ BATTERY LOW $perc% //!\\/!\\!\\"
fi
