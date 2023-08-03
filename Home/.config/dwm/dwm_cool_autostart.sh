#!/usr/bin/env bash

devmon &    #mount removable devices: pens etc 
xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --off &
#autorandr -c &
setxkbmap pt &
numlockx on &
slstatus &
flameshot &
#nm-applet &  # now in indication in slstatus
volumeicon & # Now with a indication in slstatus
#blueman-applet & 
#pavucontrol & 
#blueberry &
firefox &
xfce4-clipman &

