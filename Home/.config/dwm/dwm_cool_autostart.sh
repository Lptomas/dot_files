#!/usr/bin/env bash


# Used in "../dwm/config.def.h" with : dwm-cool-autostart-6.2.diff 

devmon &    #mount removable devices: pens etc 
xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --off &
#autorandr -c &
setxkbmap pt &
numlockx on &
slstatus &
flameshot &
#nm-applet &        # for slstatus  
volumeicon &        # for slstatus
#blueman-applet &   # for slstatus
#blueberry &        # for slstatus
#pavucontrol & 
#firefox &
xfce4-clipman &

