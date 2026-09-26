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



#TOUCHPAD_ID=9

## obter o ID do touchpad automaticamente

TOUCHPAD_INFO="$(xinput list | grep 'Touchpad' | awk '{print $6}')"



# o problema +e quando esta enable +e '{print $6}') quando disable é '{print $5}')
# Não Funciona , outras vezes funciona
#retira o 9, mas nao o aceita como valor
TOUCHPAD_ID=${TOUCHPAD_INFO#*=}   # retira o numero do ID, retira após o sinal "="

#TOUCHPAD_ID=$TOUCHPAD_ID_ | awk '{print $1}'   # convert para numero
#if [ $(xinput list-props "10" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then

if [ $(xinput list-props "$TOUCHPAD_ID" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then
	touchpad=$TOUCHPAD_OFF$TOUCHPAD_ID
else #touchpad is disabled: we want to turn ON, 
	touchpad=$TOUCHPAD_ON$TOUCHPAD_ID
fi