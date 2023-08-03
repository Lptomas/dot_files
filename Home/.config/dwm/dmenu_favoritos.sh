#!/bin/sh

# Script for system states https://www.youtube.com/watch?v=Pl2mT9oAuec&t=201s
#dmenu '0' -fn 'hack:size=11' -nb '#000000' -nf '#07AE06' -sb '#07AE06' -sf '#060606'

#apps='Firefox \nCode \nThunar \npCloud \nIcedrive \nEasyEda \nTeamviewer 󰢹\nApps 󰀻\nTODOS\nAudio \nPower 󰐥\nShutdown 󰐥\nReboot 󰐥\nYoutube \nEmail 󰇮\nMaps 󰗵\nBlueBerry 󰂰\nblueman 󰂰\nExit dwm\nVolume\nGforceNow 󰊖\nWhastApp 󰖣'

FIREFOX="Firefox "
WHASTAPP="WhastApp 󰖣"
YOUTUBE="Youtube "

########################################################################################################
#### #### #### TouchPAD ####
# #"xinput list" dá o numero do List-Props ,  no aero é 11
if [ $(xinput list-props "11" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then
	touchpad="Off"
else #touchpad is disabled: we want to turn ON, 
	touchpad="On"
fi

########################################################################################################
#### #### #### bluetooth devices####
#1st - Check if bluetooth is Powered ON, iF yes, show the other options


bluetooth_power="$( bluetoothctl show | grep -E "Powered" )"
bluetooth_connected="$( bluetoothctl "info" | grep -E "Name")"

case $bluetooth_power in
	'	Powered: yes') 		bluetooth_power="Bluetooth Off\n" ;; 
	'	Powered: no') 		bluetooth_power="Bluetooth On\n" ;;     
	*)  bluetooth_power="Bluetooth Power ?" ;;   
esac

if [ "$bluetooth_power" == "Bluetooth Off\n" ]; then
		case $bluetooth_connected in
			'	Name: Xiaomi Buds 3') 		bluetooth_connected="Bluetooth_Xiaomi Off\nBluetooth_JBL On\n" ;; 
			'	Name: JBL E65BTNC') 		bluetooth_connected="Bluetooth_JBL Off\nBluetooth_Xiaomi On" ;;    
			*)  bluetooth_connected="Bluetooth_Xiaomi On\nBluetooth_JBL On\n" ;;   
		esac

fi



########################################################################################################
WEB="$FIREFOX\n$WHASTAPP\n$YOUTUBE\nEmail 󰇮\nMaps 󰗵\n"
FM="Thunar \npCloud \nIcedrive \n"
OFFICE="LibreOffice 󰈙\nPDF \nPDFarranger 󰕕\nNotas \n"
REMOTE="Teamviewer 󰢹\n"
AUDIO="Audio \n$bluetooth_connected\n$bluetooth_power\nBlueBerry 󰂰\nblueman 󰂰\n"
DEV="Code \nEasyEda \n"
PW="Shutdown 󰐥\nReboot 󰐥\nExit dwm 󰩈\n\nPW_saver\nPW_balanced\nPW_performance\n"
GAME="Steam \nGforceNow 󰊖\nDoom 󰊖\n"
APPS="Apps 󰀻\nTODOS\n"
NET="NetWork\nSafing\nNetWork cli\n"
OPT="Power 󰐥\nTouchPad $touchpad\n"
SCREENS="Monitors 2 ON\nMonitor Main\nMonitors Options\n"
CLI="SpeedTest cli \nDisk Analizer cli \nfind cli \n"
TOOL="Calculadora\n"



all="$WEB$FM$OFFICE$DEV$PW$REMOTE$TOOL$AUDIO$OPT$GAME$APPS$SCREENS$NET$CLI"



case "$(printf "$all" | dmenu )" in

# *** WEB
	$FIREFOX ) firefox ;;							# funciona 
	$WHASTAPP ) whatsapp-nativefier ;;
	$YOUTUBE ) firefox https://www.youtube.com/;;
	"Email 󰇮") firefox https://mail.google.com/mail/u/0/#inbox ;;
	"Maps 󰗵") firefox https://www.google.com/maps/ ;;

# *** FM
	"Thunar ") thunar ;;								# funciona 
	"pCloud ") '~/AppImage_snaps_etc/pcloud' %U ;;	# NAO funciona 
	"Icedrive ") /usr/bin/icedrive ;;		 		# funciona 

# *** OFFICE
	"LibreOffice 󰈙") libreoffice ;;							# funciona 
	"PDF ") whatsapp-nativefier ;;
	"PDFarranger 󰕕") pdfarranger ;; 
	"Notas ") xed ;;

# *** DEV
	"Code ") code ;;									# funciona 
	"EasyEda ") /opt/easyeda/easyeda %f ;;    		# funciona 

# *** POWER
	"Shutdown 󰐥") alacritty --class power --config-file /home/lpt/.config/alacritty/alacritty_dwm_power.yml -e sudo shutdown now ;;
	"Reboot 󰐥") alacritty --class power --config-file /home/lpt/.config/alacritty/alacritty_dwm_power.yml -e sudo reboot  ;;        # regra propria No DWM
	"Exit dwm 󰩈") pkill dwm ;;
	"PW_saver") powerprofilesctl set power-saver ;;
	"PW_balanced") powerprofilesctl set balanced ;;
	"PW_performance") powerprofilesctl set performance ;;


	#"TouchPad") alacritty --class power --config-file /home/lpt/.config/alacritty/alacritty_dwm_power.ym -e ~/dot_files/Home/.config/dwm/toggletouchpad.sh ;;
	# #"xinput list" dá o numero do List-Props ,  no aero é 11
	"TouchPad Off") xinput disable 11 ;;
	"TouchPad On") xinput enable 11 ;;

# *** REMOTE
    "Teamviewer 󰢹") teamviewer ;;				 		# funciona ????


# *** TOOLS
	"Calculadora") galculator ;;

# *** Audio 
	"Audio ") pavucontrol ;;
	"BlueBerry 󰂰") blueberry ;;
	"Blueman 󰂰") bluebman-applet ;;

	
	"Bluetooth On") bluetoothctl power on ;;
	"Bluetooth Off") bluetoothctl power off ;;
	"Bluetooth_Xiaomi On")bluetoothctl disconnect 88:D0:39:8C:4F:A4 && bluetoothctl connect 14:0A:29:30:0E:A9 ;;
	"Bluetooth_Xiaomi Off") bluetoothctl disconnect 14:0A:29:30:0E:A9 ;;
	"Bluetooth_JBL On") bluetoothctl disconnect 14:0A:29:30:0E:A9  && bluetoothctl connect 88:D0:39:8C:4F:A4 ;;
	"Bluetooth_JBL Off") bluetoothctl disconnect 88:D0:39:8C:4F:A4 ;;	

# *** NET 
	"NetWork") nm-applet ;;
	"Safing") /opt/safing/portmaster/portmaster-start app --data=/opt/safing/portmaster ;;
	"NetWork cli") alacritty -e nmtui;;


# *** Momitors 
	"Monitors 2 ON") xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --off ;;
	"Monitor Main") xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off ;;
	"Monitors Options") arandr ;;   

	
# *** APPS	
    "Apps 󰀻") xfce4-appfinder ;;				 		# funciona 
	"TODOS") dmenu_run -m "0" -fn "hack:size=11" -nb "#000000" -nf "#07AE06" -sb "#07AE06" -sf "#060606" ;;

# *** Games
	"Steam ") steam ;;
	"GforceNow 󰊖") chromium https://play.geforcenow.com/mall/#/layout/games ;;
	"Doom 󰊖") gzdoom ;;

# ** Comandline Interface

	# nao funciona "SpeedTest cli") alacritty --class power --config-file /home/lpt/.config/alacritty/alacritty_dwm_scratchpad.yml -e speedtest | grep Download ;;
	"SpeedTest cli ") alacritty -e speedtest ;;
	"Disk Analizer cli ")  alacritty -e ncdu ;;
	"find cli ") alacritty -e fzf -i -e --color=16 -q "key1 key2 .." ;;

#   submenu

	"Power 󰐥") case "$(printf "Shutdown\nReboot\nLock\nExit dwm\n" | dmenu )" in
			"Shutdown") 'sudo shutdown -h now';;
			"Reboot") sudo reboot ;;
			"Lock") slock ;;
			"Exit dwm") pkill dwm ;;
			*) exit 1 ;;
			esac ;;
esac


