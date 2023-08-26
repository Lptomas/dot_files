+#!/bin/bash
# LPT
# used in slstatus-DWM

########################################################################################################
#### DATE + TIME ####
time="$(date +"%H:%M")"

#date="$(date +"%d-%m-%y")"
date="$(date +"%a.%d.%b")"


########################################################################################################
#### Power profile ####
PF="$(powerprofilesctl get)"
PF_icon=""

case $PF in
	'performance'	) 	PF_icon="󰊖" ;;
	'balanced'		)	PF_icon="󰡵" ;;
	'power-saver'	) 	PF_icon="󰸿" ;;
	*				) 	PF_icon="" ;;
esac


########################################################################################################
#### INTERNET Connection TYPE ####
#show possible connections names, all most be tourned on
#ip -o -4 route show to default | awk '{print $5}'
conn_aux="$( ip route get 8.8.8.8 | sed -nr 's/.*dev ([^\ ]+).*/\1/p' )"
case $conn_aux in
	'enp3s0f2'	) conn="󱎔" ;;
	'enp3s0f3u2') conn="󱎔"	;;
	'wlp2s0'	) conn="󰀃"	;;
	'wlan0'		) conn="󰀃"	;;  #HP aero
	*			) conn="" ;;
esac


# name of the connected NetWork wirelles;
name_conn="$(iw dev | grep ssid | awk '{print $2}')"
case $name_conn in
	'Desvio_5G'	) name_conn="5" 		;;
	'Desvio'	) name_conn="2.4" 		;;
	*			) name_conn="$name_conn";;
esac


########################################################################################################
#### Audio Volume####
#_vol="$( amixer get Master | egrep -o '[0-9]{1,3}%')"
#sound=$([ "$_vol" = '0%'  ] && echo "$_vol" || echo "$_vol") #ﱝ婢

_vol="$( amixer get Master | egrep -o '[0-9]{1,3}%')"
sound=$([ "$_vol" = '0%'  ] && echo "$_vol" || echo "$_vol") #ﱝ婢



########################################################################################################
#### #### #### bluetooth ####  Indicate The connected Headphone device

bluetooth_power="$( bluetoothctl show | grep -E "Powered"  | awk '{print $2}' )"
bluetooth_connected="$( bluetoothctl "info" | grep -E "Name"  | awk '{print $2}' )"
if [ "$bluetooth_power" == "yes" ]; then     # bluetooth is ON
		case $bluetooth_connected in 
			''			)	bluetooth="󰂯"	;;	  # laptop		
			'Xiaomi'	)	bluetooth="X" ;; 
			'JBL'		)	bluetooth="J" ;;
			'HG00085'	)	bluetooth="C" ;;
			*			)	bluetooth="󰂯?" ;; 
		esac
else
	bluetooth="󰂲"   # bluetooth is OFF
fi



########################################################################################################
#### RAM ####
ram_used="$( free | grep Mem | awk '{printf "%1.0f%", $3/$2 * 100.0}' )"

########################################################################################################
#### BATTERY ####
bat_percentage="$(cat /sys/class/power_supply/BAT0/capacity)"
bat_state="$(cat /sys/class/power_supply/BAT0/status)"

bat_icon="";

if [ $bat_percentage -lt 15 ]; then
	bat_icon="󰂎"
elif [ $bat_percentage -lt 40 ]; then
	bat_icon=""
elif [ $bat_percentage -lt 80 ]; then
	bat_icon=""
elif [ $bat_percentage -lt 90 ]; then
	bat_icon=""
elif [ $bat_percentage -lt 100 ]; then
	bat_icon=""
else
	bat_icon="?%"
fi



# O ICON do estado da bateria nao faz falta, apenas para abaixo de x%

bat=""

case $bat_state in
	'Full'			)	bat="󰁹" ;;    #    $bat_percentage%
	'Charging'		) 	bat="$bat_percentage%󰚥" ;;
	'Not charging'	)	bat="$bat_percentage%" ;;
	'Discharging'	) 	bat="$bat_icon$bat_percentage%󱐤" ;;
esac


if [ "$bat_state" == 'Full' ] || ["$bat_percentage"-gt 95 ] ; then
	bat="󱐥"
fi



########################################################################################################
#### Important settings ####
#void
#if [ $(synclient -l | grep "TouchpadOff .*=.*" |  egrep -o '[0-9]') != "0" ]]; then 

# #"xinput list" dá o numero do List-Props ,  no aero é 11
if [ $(xinput list-props "11" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then
	touchpad=""
else #OFF
	touchpad="󱘃"
fi


########################################################################################################

if [ "$( pidof firefox )" != "" ]; then
	firefox="" 	#firefox=""
fi

if [ "$( pidof flameshot )" != "" ]; then
	flameshot=""
fi

#if [ "$( pidof pcloud )" != "" ]; then
#	pcloud=""
#fi

#### Important Programs that are RUNNING####
#if [ "$( pidof steam )" != "" ]; then 
#	steam=""
#fi



########################################################################################################
#### OUTPUT ####
#echo "$ram_used $bat $conn $sound $date $time $steam $touchpad $firefox $flameshot$pcloud " $pcloud  $steam$ firefox $monitores_connected 
echo "$PF_icon $bat $time $touchpad $conn$name_conn $bluetooth $flameshot $sound"
 






