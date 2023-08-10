#!/bin/sh

#This script create a personal costum and dynamic menu for dmenu.

# Script for system states https://www.youtube.com/watch?v=Pl2mT9oAuec
#dmenu '0' -fn 'hack:size=11' -nb '#000000' -nf '#07AE06' -sb '#07AE06' -sf '#060606'



##  HOW TO:
# Make sure that all programs are instaled
# 1º Create a VARIABLE and set the "Name" to use in dmenu - Exemple: BROWSER="Firefox "
# 2º Create a VARIABLE_CMD and set the Comand to be executed when select the "Name" to use in dmenu - Exemple: BROWSER_CMD="firefox"
# 3º ATIBUTE the VARIABLE to catagory - Exemple WEB="$BROWSER...." VARABLES are separated with " \n"  - Exemple: WEB="$BROWSER\n$WHASTAPP\n$YOUTUBE\n...\n...\n....\n"
# 4º SET the Name to the comand in the CASE function: $VARIABLE ) VARIABLE_CMD ;;
# ALL is set Manualy - Bluetooh devices, comands, windows sizes etc etc:
# 

# Organização: XFCE
# Acessórios
# Ciencia
# Definiçoes
# Desenvolvimento
# Educação
# Graficos
# Internet
# Jogos
# Multimédia
# Produtividade
# Sistema
# Wine
#

############################################################################################################ 
######  WEB 

BROWSER_SET_CMD="firefox"

BROWSER="Firefox "
BROWSER_CMD="$BROWSER_SET_CMD"
WHASTAPP="WhastApp 󰖣"
WHASTAPP_CMD="whatsapp-nativefier"
YOUTUBE="Youtube "
YOUTUBE_CMD="$BROWSER_SET_CMD https://www.youtube.com/"
EMAIL="Email 󰇮"
EMAIL_CMD="$BROWSER_SET_CMD https://mail.google.com/mail/u/0/#inbox"
MAPS="Maps 󰗵"
MAPS_CMD="$BROWSER_SET_CMD https://www.google.com/maps/"
PHOTOS="Maps 󰗵"
PHOTOS_CMD="$BROWSER_SET_CMD https://photos.google.com/"
MYCUF="MYCUF"
MYCUF_CMD="$BROWSER_SET_CMD https://www.saudecuf.pt/mycuf/login"

WEB="$BROWSER\n$WHASTAPP\n$YOUTUBE\n$EMAIL\n$MAPS\n$PHOTOS\n$MYCUF\n"

############################################################################################################ 
######  FM - File manager
THUNAR="Thunar  FM"
THUNAR_CMD="thunar"
NEMO="Nemo  FM"
NEMO_CMD="nemo  FM" 
DOLPHIN="Dolphin  FM"
DOLPHIN_CMD="dolphin"
PCLOUD="pCloud "
PCLOUD_CMD='~/AppImage_snaps_etc/pcloud.AppImage'   # NAO funciona ...no terminal trabalha
ICEDRIVE="iceDrive "
ICEDRIVE_CMD="/usr/bin/icedrive"

FM="$DOLPHIN\n$THUNAR\n$NEMO\n$PCLOUD\n$ICEDRIVE\n"

############################################################################################################ 
######  OFFICE
NOTAS="Notas "
NOTAS_CMD="xed"
OFFICE="LibreOffice 󰈙"
OFFICE_CMD="libreoffice"
PDF="PDF "
PDF_CMD="evince"
PDF_Arranger="PDFarranger 󰕕"
PDF_Arranger_CMD="pdfarranger"

OFFICE="$NOTAS\n$OFFICE\n$PDF\n$PDF_Arranger\n"

############################################################################################################ 
######  DEV
CODE="Code "
CODE_CMD="code"
EASYEDA="EasyEda "
EASYEDA_CMD="/opt/easyeda/easyeda %f "

DEV="$CODE\n$EASYEDA\n"

############################################################################################################  		 
# *** POWER
#alacritty.yml
alacritty_power="alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty_big_float.yml -o window.dimensions.columns=30 -o window.dimensions.lines=1"

SHUNTDOWN="Shutdown 󰐥"
SHUNTDOWN_CMD="$alacritty_power -e sudo shutdown now"
REBOOT="Reboot 󰐥"
REBOOT_CMD="$alacritty_power -e sudo reboot"
EXIT="Exit dwm 󰩈"
EXIT_CMD="pkill dwm "
POWER_SAVER="PW_saver"
POWER_SAVER_CMD="powerprofilesctl set power-saver"
POWER_BALANCE="PW_balanced"
POWER_BALANCE_CMD="powerprofilesctl set balanced"
POWER_PERFORMANCE="PW_performance"
POWER_PERFORMANCE_CMD="powerprofilesctl set performance"

PW="$SHUNTDOWN\n$REBOOT\n$EXIT\n$POWER_SAVER\n$POWER_BALANCE\n$POWER_PERFORMANCE\n"

############################################################################################################  		 
# *** REMOTE 
TEAMVIEWER="Teamviewer 󰢹"
TEAMVIEWER_CMD="teamviewer"

REMOTE="$TEAMVIEWER\n"

############################################################################################################  		 
# *** CLI   - Comand Line Interface
alacritty_float="alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty_big_float.yml "

SPEEDTEST="SpeedTest cli "
SPEEDTEST_CMD="$alacritty_float -o window.dimensions.columns=40 -o window.dimensions.lines=3 -e speedtest-cli --simple"
DISK_ANALIZER="Disk Analizer cli "
DISK_ANALIZER_CMD="alacritty -e ncdu "
FIND="find cli "
FIND_CMD='alacritty -e fzf -i -e --color=16 -q Keys '
TEMPO="Tempo 󰖙 cli"
#TEMPO_CMD='alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty_big_float.yml -e curl wttr.in?lang=pt'
TEMPO_CMD="$alacritty_float -o window.dimensions.columns=125 -o window.dimensions.lines=40 -e curl wttr.in?lang=pt"


CALENDARIO="Calendario cli"
#CALENDARIO_CMD='alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty_big_float.yml -e cal -y'
CALENDARIO_CMD="$alacritty_float -o window.dimensions.columns=70 -o window.dimensions.lines=35 -e cal -y"


CLI="$SPEEDTEST\n$DISK_ANALIZER\n$FIND\n$TEMPO\n$CALENDARIO\n"

############################################################################################################  		 
# *** GAMES
STEAM="Steam "
STEAM_CMD="steam"
GFORCE="GforceNow 󰊖"
GFORCE_CMD="chromium https://play.geforcenow.com/mall/#/layout/games"
DOOM="Doom 󰊖"
DOOM_CMD="gzdoom"

GAME="$STEAM\n$GFORCE\n$DOOM\n"

############################################################################################################  		 
# *** OPT
AUDIO="audio "
AUDIO_CMD="pavucontrol"
TOUCHPAD_OFF="Touchpad Off"					# se ele está ON .. queremos por a OFF
TOUCHPAD_OFF_CMD="xinput disable 11"		#"xinput list" dá o numero do List-Props ,  no aero o touchpad é 11
TOUCHPAD_ON="Touchpad On" 					# se ele está OFF .. queremos por a ON
TOUCHPAD_ON_CMD="xinput enable 11"			#"xinput list" dá o numero do List-Props ,  no aero o touchpad é 11

#### TouchPAD #### Tongle input in dmenu
# #"xinput list" dá o numero do List-Props ,  no aero é 11
if [ $(xinput list-props "11" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then
	touchpad=$TOUCHPAD_OFF
else #touchpad is disabled: we want to turn ON, 
	touchpad=$TOUCHPAD_ON
fi

OPT="$AUDIO\n$touchpad\n"

############################################################################################################  		 
# *** SCREENS
MONITORES="Monitores OPT"
MONITORES_CMD="arandr"
MONITOR_ALL_OFF="Monitors OFF ALL"
MONITOR_ALL_OFF_CMD="xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off"
MONITOR_OFFICE_ON="Monitor ON HMI"
MONITOR_OFFICE_ON_CMD='xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --off'


#check_ports = $(xrandr -q)
#Não consigo usar string e comparar resultado no IF
#check_hmdi= $(xrandr -q | grep 'HDMI-A-0' | awk '{print $2}')					# 	#Check if HDMI-A-0 is connected
#check_Display_port= $(xrandr -q | grep 'DisplayPort-0' | awk '{print $2}' )		#	#Check if DisplayPort-0 is connected
#check_hmdi_active=$(xrandr --listmonitors | grep 'HDMI'  | awk '{print $4}')	# 	#Check if HDMI-A-0 is ACTIVE

monitores_connected=""

if [ "$( xrandr -q | grep 'HDMI-A-0' | awk '{print $2}')" == "connected" ] || [ "$( xrandr -q | grep 'DisplayPort-0' | awk '{print $2}')" == "connected" ] ; then
		if [ "$(xrandr --listmonitors | grep 'HDMI'  | awk '{print $4}')" == "HDMI-A-0" ]; then   # Está activo . podemos desligar
				monitores_connected="$MONITOR_ALL_OFF"
		else
				monitores_connected="$MONITOR_OFFICE_ON" 	   # NÃO Está activo . podemos Ligar
		fi	
else
	monitores_connected="not_ok"
fi


#SCREENS="$MONITORES\n$MONITOR_ALL_OFF\n$MONITOR_OFFICE_ON\n"
SCREENS="$MONITORES\n$monitores_connected\n"

############################################################################################################  		 
# *** BLUETOOTH
BLUETOOTH_ON="Bluetooth On"
BLUETOOTH_ON_CMD="bluetoothctl power on"
BLUETOOTH_OFF="Bluetooth Off"
BLUETOOTH_OFF_CMD="bluetoothctl power off"
BLUEBERRY="BlueBerry 󰂰"
BLUEBERRY_CMD='blueberry'
BLUEMAN="Blueman 󰂰"
BLUEMAN_CMD="blueman-applet"

BLUETOOTH_1_ON="Bluetooth_Xiaomi On"
BLUETOOTH_1_ON_CMD="bluetoothctl connect 14:0A:29:30:0E:A9"
BLUETOOTH_1_OFF="Bluetooth_Xiaomi Off"
BLUETOOTH_1_OFF_CMD="bluetoothctl disconnect 14:0A:29:30:0E:A9"

BLUETOOTH_2_ON="Bluetooth_JBL On"
BLUETOOTH_2_ON_CMD="bluetoothctl connect 88:D0:39:8C:4F:A4"
BLUETOOTH_2_OFF="Bluetooth_JBL Off"
BLUETOOTH_2_OFF_CMD="bluetoothctl disconnect 88:D0:39:8C:4F:A4"

BLUETOOTH_3_ON="Bluetooth_Lild On"
BLUETOOTH_3_ON_CMD="bluetoothctl connect FC:58:FA:42:44:93"
BLUETOOTH_3_OFF="Bluetooth_Lild Off"
BLUETOOTH_3_OFF_CMD="bluetoothctl disconnect FC:58:FA:42:44:93"




# Directamente no SWITCH-CASE podemos fazer:     bluetoothctl disconnect 14:0A:29:30:0E:A9 &&  bluetoothctl connect 88:D0:39:8C:4F:A4 ;;
#     echo -e "show\ndisconnect 14:0A:29:30:0E:A9\nconnect 88:D0:39:8C:4F:A4\nquit" | bluetoothctl    - turn on JBL   
#     echo -e "show\ndisconnect 88:D0:39:8C:4F:A4\nconnect 14:0A:29:30:0E:A9\nquit" | bluetoothctl    - turn on XIAOMI
#	  echo -e 'show\npower off\npower on\nquit' | bluetoothct
# no terminal :   echo -e 'show\ndisconnect 88:D0:39:8C:4F:A4\nconnect 14:0A:29:30:0E:A9\nquit' | bluetoothctl"

#### bluetooth devices ####
#1st - Check if bluetooth is Powered ON, iF yes, show the other options

bluetooth_power="$( bluetoothctl show | grep -E "Powered"  | awk '{print $2}')"    # awk vai retirar a palavra: $2
bluetooth_connected="$(bluetoothctl "info" | grep -E "Name" | awk '{print $2}' )"

case $bluetooth_power in
	'yes'	) 	bluetooth_power="$BLUETOOTH_OFF" ;;   # se está on queremos por OFF
	'no'	) 	bluetooth_power="$BLUETOOTH_ON" ;;    # se está Off queremos por ON
	*		)  	bluetooth_power="Bluetooth Power ?" ;;   
esac

if [ "$bluetooth_power" == "$BLUETOOTH_OFF" ]; then   # bluetooth_power =  
		case $bluetooth_connected in
			# 	se está ligado ao Xiaomi, queremos ligar ao JBL ou Outro Device
			'Xiaomi'	) 	bluetooth_connected="$BLUETOOTH_1_OFF\n$BLUETOOTH_2_ON\n$BLUETOOTH_3_ON" ;; 
			'JBL'		) 	bluetooth_connected="$BLUETOOTH_2_OFF\n$BLUETOOTH_1_ON\n$BLUETOOTH_3_ON" ;;
			'HG00085'	)   bluetooth_connected="$BLUETOOTH_3_OFF\n$BLUETOOTH_1_ON\n$BLUETOOTH_2_ON" ;;
			*			) 	bluetooth_connected="$BLUETOOTH_1_ON\n$BLUETOOTH_2_ON\n$BLUETOOTH_3_ON"  ;;   
		esac
fi

BLUETOOTH="$bluetooth_power\n$bluetooth_connected\n$BLUEBERRY\n$BLUEMAN\n"

########################################################################################################
# *** NET 

NETWORK="NetWork wifi Ethet"
NETWORK_CMD="nm-applet"
SAFING="Safing"
SAFING_CMD="/opt/safing/portmaster/portmaster-start app --data=/opt/safing/portmaster"
NETWORKCLI="NetWork cli wifi Ethet"
NETWORKCLI_CMD="alacritty -e nmtui"

NET="$NETWORKCLI\n$NETWORK\n$SAFING\n"

########################################################################################################
# *** WIFI  - We realy need this ???

# name of the connected NetWork wirelles;
name_conn="$(iw dev | grep ssid | awk '{print $2}')"
#WIFI_SSID_1="Desvio_5G"
#WIFI_SSID_2="Desvio"
#case $name_conn in
	#"$WIFI_SSID_1"	) name_conn=" WIFI: $WIFI_SSID_1" 		;;
	#"$WIFI_SSID_2"	) name_conn=" WIFI: $WIFI_SSID_2" 		;;
	#*				) name_conn="$name_conn";;
#esac

WIFI="WIFI: $name_conn\n"


########################################################################################################
# *** TOOLS
CALCULADORA="Calculadora"
CALCULADORA_CMD='galculator'

TOOL="$CALCULADORA\n"

########################################################################################################
# ***  APPS   -  Gestores de APPs
APPS="Apps 󰀻"
APPS_CMD="xfce4-appfinder"

APP="$APPS\n"


########################################################################################################
########################################################################################################
# ***  SET ALL TAGSs
FAVORITOS="$BROWSER\n$DOLPHIN\n$CODE\n"

all="$FAVORITOS$WEB$FM$OFFICE$DEV$PW$REMOTE$TOOL$BLUETOOTH$OPT$GAME$APP$SCREENS$NET$CLI$WIFI"



########################################################################################################
########################################################################################################
# set the "NAME" with the comand to execute in this CASE function

case "$(printf "$all" | dmenu -p "$(date +"%a.%d.%b")" )" in

# *** WEB
	$BROWSER	) $BROWSER_CMD 	;;
	$WHASTAPP 	) $WHASTAPP_CMD ;;
	$YOUTUBE 	) $YOUTUBE_CMD	;;
	$EMAIL		) $EMAIL_CMD 	;;
	$MAPS		) $MAPS_CMD 	;;
	$PHOTOS		) $PHOTOS_CMD 	;;
	$MYCUF		) $MYCUF_CMD 	;;

# *** FM
	$THUNAR		) $THUNAR_CMD 	;;
	$NEMO		) $NEMO_CMD 	;;
	$DOLPHIN	) $DOLPHIN_CMD	;;

	$PCLOUD		) $PCLOUD_CMD 	;;
	$ICEDRIVE	) $ICEDRIVE_CMD ;;

# *** OFFICE
	$NOTAS			) $NOTAS_CMD		;;
	$OFFICE			) $OFFICE_CMD		;;
	$PDF			) $PDF_CMD			;;
	$PDF_Arranger 	) $PDF_Arranger_CMD ;;

# *** DEV
	$CODE 		) $CODE_CMD 	;;
	$EASYEDA	) $EASYEDA_CMD 	;;  

# *** POWER
	$SHUNTDOWN			) $SHUNTDOWN_CMD 			;;
	$REBOOT				) $REBOOT_CMD 				;;
	$EXIT				) $EXIT_CMD 				;;	
	$POWER_SAVER		) $POWER_SAVER_CMD 			;;	
	$POWER_BALANCE		) $POWER_BALANCE_CMD 		;;	
	$POWER_PERFORMANCE	) $POWER_PERFORMANCE_CMD	;;	

# *** REMOTE
    $TEAMVIEWER	) $TEAMVIEWER_CMD ;;

# *** OPT
	$AUDIO			) $AUDIO_CMD 			;;
	$TOUCHPAD_ON	) $TOUCHPAD_ON_CMD 		;;
	$TOUCHPAD_OFF	) $TOUCHPAD_OFF_CMD 	;;
	$BLUEBERRY		) $BLUEBERRY_CMD 		;;
	$BLUEMAN		) $BLUEMAN_CMD 			;;

# *** SCREENS
	$MONITORES	) $MONITORES_CMD	;;
	$MONITOR_ALL_OFF	) $MONITOR_ALL_OFF_CMD 	;;
	$MONITOR_OFFICE_ON	) $MONITOR_OFFICE_ON_CMD 	;;

# *** BLUETOOTH
	$BLUETOOTH_ON		) 	$BLUETOOTH_ON_CMD 		;;
	$BLUETOOTH_OFF		) 	$BLUETOOTH_OFF_CMD 		;;
	$BLUEBERRY			) 	$BLUEBERRY_CMD 			;;
	$BLUEMAN			) 	$BLUEMAN_CMD 			;;


# Ligar Headphones Bluetooth. Primeiros vamos desligar os outros dispositivos, depois vamos ligar o que queremos, desta forma é muito mais rápido
	$BLUETOOTH_1_OFF	)	$BLUETOOTH_1_OFF_CMD 	;;
	$BLUETOOTH_1_ON		) 	$BLUETOOTH_2_OFF_CMD	# 1º - desligar o JBL
							$BLUETOOTH_3_OFF_CMD	# 1º - desligar o lidl
							$BLUETOOTH_1_ON_CMD		# 2º - LIGAR o XIAOMI 	
						;;
	$BLUETOOTH_2_OFF	) 	$BLUETOOTH_2_OFF_CMD 	;;
	$BLUETOOTH_2_ON		)	$BLUETOOTH_1_OFF_CMD 	# 1º - desligar o Xiaomi
							$BLUETOOTH_3_OFF_CMD							
							$BLUETOOTH_2_ON_CMD  	# 2º - LIGAR o JBL
						;;
	$BLUETOOTH_3_OFF	) 	$BLUETOOTH_3_OFF_CMD 	;;
	$BLUETOOTH_3_ON		)	$BLUETOOTH_1_OFF_CMD 	# 1º - desligar o Xiaomi
							$BLUETOOTH_2_OFF_CMD							
							$BLUETOOTH_3_ON_CMD  	# 2º - LIGAR o JBL
						;;



# *** NET 
	$NETWORK 	) $NETWORK_CMD 	;;
	$SAFING  	) $SAFING_CMD 	;;
	$NETWORK 	) $NETWORK_CMD 	;;

# *** TOOLS   + Monitores 
	$CALCULADORA )  $CALCULADORA_CMD ;;

# *** Games
	$STEAM	) $STEAM_CMD	;;
	$GFORCE	) $GFORCE_CMD	;;
	$DOOM	) $DOOM_CMD		;;

# ** CLI  
	$SPEEDTEST 		) $SPEEDTEST_CMD 		;;
	$DISK_ANALIZER 	) $DISK_ANALIZER_CMD 	;;
	$FIND 			) $FIND_CMD 			;;
	$TEMPO 			) $TEMPO_CMD			;;
	$CALENDARIO 	) $CALENDARIO_CMD		;;

# *** APPS	
	$APPS ) $APPS_CMD ;;
	#"TODOS") dmenu_run -m "0" -fn "hack:size=11" -nb "#000000" -nf "#07AE06" -sb "#07AE06" -sf "#060606" ;;   #nao funciona


#   submenu

	"Power 󰐥") case "$(printf "Shutdown\nReboot\nLock\nExit dwm\n" | dmenu )" in
			"Shutdown") 'sudo shutdown -h now';;
			"Reboot") sudo reboot ;;
			"Lock") slock ;;
			"Exit dwm") pkill dwm ;;
			*) exit 1 ;;
			esac ;;


	*) exit 1 #xfce4-appfinder ;;  #


esac


