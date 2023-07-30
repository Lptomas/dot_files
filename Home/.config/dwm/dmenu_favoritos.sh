#!/bin/sh

# Script for system states https://www.youtube.com/watch?v=Pl2mT9oAuec&t=201s
#dmenu '0' -fn 'hack:size=11' -nb '#000000' -nf '#07AE06' -sb '#07AE06' -sf '#060606'

#apps='Firefox \nCode \nThunar \npCloud \nIcedrive \nEasyEda \nTeamviewer 󰢹\nApps 󰀻\nTODOS\nAudio \nPower 󰐥\nShutdown 󰐥\nReboot 󰐥\nYoutube \nEmail 󰇮\nMaps 󰗵\nBlueBerry 󰂰\nblueman 󰂰\nExit dwm\nVolume\nGforceNow 󰊖\nWhastApp 󰖣'


FIREFOX="Firefox "
WHASTAPP="WhastApp 󰖣"
YOUTUBE="Youtube "

WEB="$FIREFOX\n$WHASTAPP\n$YOUTUBE\nEmail 󰇮\nMaps 󰗵\n"
FM="Thunar \npCloud \nIcedrive \n"
OFFICE="LibreOffice 󰈙\nPDF \nPDFarranger 󰕕\nNotas \n"
REMOTE="Teamviewer 󰢹\n"
AUDIO="Audio \nBlueBerry 󰂰\nblueman 󰂰\n"
DEV="Code \nEasyEda \n"
PW="Shutdown 󰐥\nReboot 󰐥\nExit dwm 󰩈\n\nPW_saver\nPW_balanced\nPW_performance\n"
GAME="Steam \nGforceNow 󰊖\nDoom 󰊖\n"
APPS="Apps 󰀻\nTODOS\n"
NET="NetWork\nSafing\nNetWork cli\n"
OPT="Power 󰐥\n"
SCREENS="Monitors 2 ON\nMonitor Main\nMonitors Options\n"
CLI="SpeedTest cli \nDisk Analizer cli \nfind cli \n"



all="$WEB$FM$OFFICE$DEV$PW$REMOTE$AUDIO$OPT$GAME$APPS$SCREENS$NET$CLI"



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



# *** REMOTE
    "Teamviewer 󰢹") teamviewer ;;				 		# funciona ????

# *** Audio 
	"Audio ") pavucontrol ;;
	"BlueBerry 󰂰") blueberry ;;
	"Blueman 󰂰") bluebman-applet ;;

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




#pactl set-card-profile bluez_card.88_D0_39_8C_4F_A4 a2dp-sink-sbc_xq JBL  
#pactl set-card-profile alsa_card.pci-0000_03_00.1 hifi