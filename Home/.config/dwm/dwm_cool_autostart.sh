#!/usr/bin/env bash


# Used in "../dwm/config.def.h" with : dwm-cool-autostart-6.2.diff 
slstatus &
devmon &            #mount removable devices: pens etc --verificar ARCH , void nao existe
cvt 1680 1050 59    # generate resolution for second Screen
xrandr  --newmode "1680x1050_59.00"  143.75  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync # Create a new Mode
xrandr --addmode HDMI-A-0 1680x1050_59.00  # add the new resolution mode to the avaliable  HDMI-A-0 list 
xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off # 1st switch off - this prevent the next code is well executed when Exit from DWM
#second monitor - with VGA to HMI convertera
#xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 0x0 --rotate normal --output DisplayPort-0 --off &
#autorandr -c &
setxkbmap pt &
numlockx on &


#nm-applet &         # for slstatus  netwokk   -> in dmenu
#volumeicon &        # for slstatus   -> in dmenu
#blueman-applet &    # for slstatus   -> in dmenu
#blueberry &         # for slstatus   -> in dmenu
#pavucontrol & 
#flameshot &         # not need: DWM->config.def.h ->Flameshoot is called with X11/XF86keysym 
dunst &              # for notifications, it is needed for "flameshot"
firefox &
pipewire &           # void linux: need for sound
pipewire-pulse &     # void linux: need for sound
dbus-run-session &


#xfce4-clipman &
clipit &    # for slstatus - clipboard manager
synclient tapbutton1=1 &        # VOID:  Enable double tap in touchpad
# ver se isto resolve o TEARing no ecra, mais visivel no youtube
xrandr |grep ' connected'|cut -f 1 -d ' '|while read display;do xrandr --output $display --set TearFree on;done