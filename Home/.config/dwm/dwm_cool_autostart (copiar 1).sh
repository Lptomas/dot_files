#!/usr/bin/env bash

# Th Used is File is caled from:  "../dwm/config.def.h" with : dwm-cool-autostart-6.2.diff 
## Background
feh --bg-scale ~/black.jpg &
## DWM slstatus   
slstatus &          
#devmon &           #mount removable devices: pens etc --verificar ARCH , void nao existe

## Screens with mon standart resolution:
cvt 1680 1050 59    # generate resolution for second Screen
xrandr  --newmode "1680x1050_59.00"  143.75  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync # Create a new Mode
xrandr --addmode HDMI-A-0 1680x1050_59.00  # add the new resolution mode to the avaliable  HDMI-A-0 list 
xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off # 1st switch off - this prevent the next code is well executed when Exit from DWM
#Esquerda
#xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 1920x0 --rotate normal --output DisplayPort-0 --off
#Cima 
xrandr --output eDP --primary --mode 1920x1200 --pos 0x1050 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 120x0 --rotate normal --output DisplayPort-0 --off

#second monitor - with VGA to HMI convertera
#xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 0x0 --rotate normal --output DisplayPort-0 --off &
#autorandr -c &

## Set keyboard to Portuguese
setxkbmap pt &      


numlockx on &


#nm-applet &         # for slstatus  netwokk   -> in dmenu
#volumeicon &        # for slstatus   -> in dmenu
#blueman-applet &    # for slstatus   -> in dmenu
#blueberry &         # for slstatus   -> in dmenu
#pavucontrol & 
## not need: DWM->config.def.h ->Flameshoot is called directly with X11/XF86keysym 
#flameshot &        
# for notifications, it is needed for "flameshot"
dunst &              
firefox &
## void linux: need for sound
pipewire &           
pipewire-pulse &   

## ?
dbus-run-session &

## for slstatus - clipboard manager
xfce4-clipman &
#clipit & 
## VOID:  Enable double tap in touchpad           
synclient tapbutton1=1 &       
# ver se isto resolve o TEARing no ecra, mais visivel no youtube
xrandr |grep ' connected'|cut -f 1 -d ' '|while read display;do xrandr --output $display --set TearFree on;done &
