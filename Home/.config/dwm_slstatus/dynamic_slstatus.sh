+#!/bin/bash
# LPT
# used in slstatus-DWM


#### DATE + TIME ####
time="$(date +"%H:%M")"
#date="$(date +"%d-%m-%y")"

date="$(date +"%a.%d.%b")"

#### INTERNET Connection TYPE ####
#show possible connections names, all most be tourned on
#ip -o -4 route show to default | awk '{print $5}'
conn_aux="$( ip route get 8.8.8.8 | sed -nr 's/.*dev ([^\ ]+).*/\1/p' )"
case $conn_aux in
'enp3s0f2')
	conn=""
;;
'wlp2s0')
	conn="直"
;;
'wlan0')    #HP aero
	conn="直"
;;
*)
	conn=""
esac

#### Audio Volume####
#_vol="$( amixer get Master | egrep -o '[0-9]{1,3}%')"
#sound=$([ "$_vol" = '0%'  ] && echo "$_vol" || echo "$_vol") #ﱝ婢


_vol="$( amixer get Master | egrep -o '[0-9]{1,3}%')"

sound=$([ "$_vol" = '0%'  ] && echo "$_vol" || echo "$_vol") #ﱝ婢



#### RAM ####
ram_used="$( free | grep Mem | awk '{printf "%1.0f%", $3/$2 * 100.0}' )"

#### BATTERY ####
bat_percentage="$(cat /sys/class/power_supply/BAT0/capacity)"
bat_state="$(cat /sys/class/power_supply/BAT0/status)"

case $bat_state in
'Full')
	bat="$bat_percentage%" #   
;;
'Charging')
	bat="$bat_percentage%"
;;
'Not charging')
	bat="$bat_percentage%"
;;
'Discharging')
	bat="$bat_percentage%"
;;
esac



#### Important settings ####
#if [ $(synclient -l | grep "TouchpadOff .*=.*" |  egrep -o '[0-9]') != "0" ]]; then 
#	touchpad="!ﳶ "
#else
#	touchpad=""
#fi



#### Important Programs that are RUNNING####
if [ "$( pidof steam )" != "" ]; then 
	steam=""
fi

if [ "$( pidof firefox )" != "" ]; then
	firefox="" 	#firefox=""
fi

if [ "$( pidof flameshot )" != "" ]; then
	flameshot=""
fi

if [ "$( pidof pcloud )" != "" ]; then
	pcloud=""
fi


#### OUTPUT ####
#echo "$ram_used $bat $conn $sound $date $time $steam $touchpad $firefox $flameshot$pcloud "
echo "$ram_used $bat  $conn $time $steam $firefox $flameshot $pcloud"
 






