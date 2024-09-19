#!/usr/bin/env bash


# Used in "../dwm/config.def.h" with : dwm-cool-autostart-6.2.diff 

devmon &            #mount removable devices: pens etc 
cvt 1680 1050 59    # generate resolution for second Screen
xrandr  --newmode "1680x1050_59.00"  143.75  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync # Create a new Mode
xrandr --addmode HDMI-A-0 1680x1050_59.00  # add the new resolution mode to the avaliable  HDMI-A-0 list 
xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off # 1st switch off - this prevent the next code is well executed when Exit from DWM
#second monitor - with VGA to HMI convertera
#xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 0x0 --rotate normal --output DisplayPort-0 --off &
#autorandr -c &
setxkbmap pt &
numlockx on &
slstatus &
flameshot &
#nm-applet &         # for slstatus  
#volumeicon &        # for slstatus
xfce4-clipman &
#blueman-applet &    # for slstatus
#blueberry &         # for slstatus
#pavucontrol & 
dunst &              # for notifications, it is needed for " flameshot"
firefox &


