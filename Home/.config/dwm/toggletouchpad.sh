#!/bin/bash

# use dunsk a "dunst" for notifications

declare -i ID
ID=$(xinput list | grep -Eio '(touchpad|glidepoint)\s*id=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}')
declare -i STATE
STATE=$(xinput list-props "$ID" | grep 'Device Enabled' | awk '{print $4}')
if [ "$STATE" -eq 1 ]
then
    xinput disable "$ID"
    echo "Touchpad disabled."
    # notify-send -a 'Touchpad' 'Touchpad Disabled' -i input-touchpad
else
    xinput enable "$ID"
    echo "Touchpad enabled."
    # notify-send -a 'Touchpad' 'Touchpad Enabled' -i input-touchpad
fi


#Asus
#if synclient -l | grep "TouchpadOff .*=.*0" ; then
#    synclient TouchpadOff=1 ;
#    notify-send "Touchpad is Off" -u critical -t 800 ;

#else
#    synclient TouchpadOff=0 ;
#    notify-send "Touchpad is On" -u normal -t 800 ;
#fi
