#!/bin/bash

# use dunsk a "dunst" for notifications

if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 ;
    notify-send "Touchpad is Off" -u critical -t 800 ;

else
    synclient TouchpadOff=0 ;
    notify-send "Touchpad is On" -u normal -t 800 ;
fi
