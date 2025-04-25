#!/bin/sh

#Attention: 
# Arch and VOID have some diferent setting in this FILE
# test this file on TERMINAL:  #sh ~/path/dmenu_favoritos.sh

#Software necessário:
# xinput para habilitar/desabilitar o touchpad



# PODEMos acabar com o serviço do teamvieer antes de desligar e liga-lo quando inicoiamos o team viere ??
# para isto é necessario usar PW para fazer start ao Serviço ...




#This script create a personal costum and dynamic menu for dmenu.

# Script for system states https://www.youtube.com/watch?v=Pl2mT9oAuec
#dmenu '0' -fn 'hack:size=11' -nb '#000000' -nf '#07AE06' -sb '#07AE06' -sf '#060606'



##  HOW TO:
# Make sure that all programs are instaled
# 1º Create a VARIABLE and set the "Name" to use in dmenu - Exemple: BROWSER="Firefox  "
# 2º Create a VARIABLE_CMD and set the Comand to be executed when select the "Name" to use in dmenu - Exemple: BROWSER_CMD="firefox"
# 3º ATIBUTE the VARIABLE to catagory - Exemple WEB="$BROWSER...." VARIABLES are separated with " \n"  - Exemple: WEB="$BROWSER\n$WHASTAPP\n$YOUTUBE\n...\n...\n....\n"
# 4º SET the Name to the comand in the CASE function: $VARIABLE ) VARIABLE_CMD ;;   -->  $BROWSER )  BROWSER_CMD ;;
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
YOUTUBE="  Youtube "
YOUTUBE_CMD="$BROWSER_SET_CMD https://www.youtube.com/"
YOUTUBE_Invidious="Youtube No Google "
YOUTUBE_CMD_Invidious="$BROWSER_SET_CMD https://inv.bp.projectsegfau.lt/feed/popular"
TRANSLATE="󰗊 translate"
TRANSLATE_CMD="$BROWSER_SET_CMD https://www.deepl.com"
EMAIL=" Email 󰇮"
EMAIL_CMD="$BROWSER_SET_CMD https://mail.google.com/mail/u/0/#inbox"
MAPS=" Maps 󰗵"
MAPS_CMD="$BROWSER_SET_CMD https://www.google.com/maps/"
PHOTOS=" Photos "
PHOTOS_CMD="$BROWSER_SET_CMD https://photos.google.com/"
SHEETS=" SHEETS 󱎏"
SHEETS_CMD="$BROWSER_SET_CMD https://docs.google.com/spreadsheets/u/0/"
DOCS=" DOCs "
DOCS_CMD="$BROWSER_SET_CMD https://docs.google.com/document/u/0/"
KEEP=" KEEP Notas 󰛜"
KEEP_CMD="$BROWSER_SET_CMD https://keep.google.com/u/0/"

MYCUF="MYCUF 󰩂"
MYCUF_CMD="$BROWSER_SET_CMD https://www.saudecuf.pt/mycuf/login"
NETFLIX="Netflix 󰝆"
NETFLIX_CMD="$BROWSER_SET_CMD https://www.netflix.com/browse"
IPMA="IPMA 󰖙 tempo"
IPMA_CMD="$BROWSER_SET_CMD https://www.ipma.pt/pt/index.html"
WHASTAPP="WhastApp 󰖣"
WHASTAPP_CMD="whatsapp-nativefier"
NERDFONTS="NerdFonts  "
NERDFONTS_CMD="$BROWSER_SET_CMD https://www.nerdfonts.com/cheat-sheet"
WOKWI=" WOKWI "
WOKWI_CMD="$BROWSER_SET_CMD https://wokwi.com/dashboard/projects"

PORTALFINANCAS="  Portal das Finanças"
PORTALFINANCAS_CMD="$BROWSER_SET_CMD https://www.portaldasfinancas.gov.pt"
PORTALCONTRA="󱅨  Portal Contra Ordenações"
PORTALCONTRA_CMD="$BROWSER_SET_CMD https://portalcontraordenacoes.ansr.pt"





WEB="$BROWSER\n$WHASTAPP\n$YOUTUBE\n$YOUTUBE_Invidious\n$TRANSLATE\n$NETFLIX\n$EMAIL\n$MAPS\n$PHOTOS\n$MYCUF\n$IPMA\n$NERDFONTS\n$SHEETS\n$DOCS\n$KEEP\n$PORTALFINANCAS\n$PORTALCONTRA\n$WOKWI\n"

############################################################################################################ 
######  FM - File manager
THUNAR="Thunar  FM"s
THUNAR_CMD="thunar"
NEMO="Nemo  FM"
NEMO_CMD="nemo  FM" 
DOLPHIN="Dolphin  FM"
DOLPHIN_CMD="dolphin"
PCLOUD="pCloud "    #
PCLOUD_CMD='/home/et/AppImage_snaps_etc/pcloud'
ICEDRIVE="iceDrive "
ICEDRIVE_CMD="/usr/bin/icedrive"

SYNCTHING="sycnthing 󱓎 start"
SYNCTHING_CMD="syncthing"

if [ "$( pidof syncthing )" != "" ]; then
	SYNCTHING="sycnthing 󱓎 OFF"
	SYNCTHING_CMD="killall syncthing"
fi



FM="$DOLPHIN\n$THUNAR\n$NEMO\n$PCLOUD\n$ICEDRIVE\n$SYNCTHING\n"

############################################################################################################ 
######  OFFICE
NOTAS="Notas "
NOTAS_CMD="xed"
OFFICE_DE="LibreOffice 󰈙"
OFFICE_CMD="libreoffice"
PDF="PDF "
PDF_CMD="evince"
#PDF_CMD="okular"
PDF_Arranger="PDFarranger 󰕕"
PDF_Arranger_CMD="pdfarranger"
GIMP="GIMP "
GIMP_CMD="gimp"

OFFICE="$NOTAS\n$OFFICE_DE\n$PDF\n$PDF_Arranger\n$GIMP\n"

############################################################################################################ 
######  DEV
CODE="Code "
CODE_CMD="code-oss"
#Open with CODE in specfic folder:   dmenu does't open alias or "  code ~/path/to/folfer/"
# 1st - Create a new BIN with the same permition of code:     sudo cp /usr/bin/code /usr/bin/code_new      
# 2nd - Open the code_new:  sudo EDITOR /usr/bin/code_new
# 3th - Add this line: exec /opt/visual-studio-code/bin/code ~/path/to/use/ "$@" $CODE_USER_FLAGS
# 4th - The "code_new" appers in avaliable commands, to run in DMENU just call it: code_new  

# Testar assim-
# 1st echo "exec /opt/visual-studio-code/bin/code ~/path/to/use/ "$@" $CODE_USER_FLAGS" > code_new
# 2nd - sudo chmod u=rwx,g=rx,o=rx code_new
# 3th - sudo mv code_new /usr/bin/code_new

CODE_ARDUINO="Code  ARDUINO"
CODE_ARDUINO_CMD="code_arduino"
CODE_DOTFILES="Code   DOTFILES"
CODE_DOTFILES_CMD="code_dot_files"       # Added in  

ARDUINO="Arduino"
ARDUINO_CMD="arduino-ide"
EASYEDA="EasyEda "
EASYEDA_CMD="/opt/easyeda/easyeda %f "

DEV="$CODE\n$CODE_ARDUINO\n$CODE_DOTFILES\n$ARDUINO\n$EASYEDA\n"

############################################################################################################  		 
# *** POWER
#alacritty.yml
alacritty_power="alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty.yml -o window.dimensions.columns=30 -o window.dimensions.lines=1"

SHUNTDOWN="Shutdown 󰐥"
SHUNTDOWN_CMD="$alacritty_power -e sudo shutdown -h now"
REBOOT="Reboot 󰐥"
REBOOT_CMD="$alacritty_power -e sudo reboot"
EXIT="Exit dwm 󰩈"
EXIT_CMD="pkill dwm "
POWER_SAVER="PW_saver 󰸿"
POWER_SAVER_CMD="powerprofilesctl set power-saver"
POWER_BALANCE="PW_balanced 󰡵"
POWER_BALANCE_CMD="powerprofilesctl set balanced"
POWER_PERFORMANCE="PW_performance 󰊖"
POWER_PERFORMANCE_CMD="powerprofilesctl set performance"

PW="$SHUNTDOWN\n$REBOOT\n$EXIT\n$POWER_SAVER\n$POWER_BALANCE\n$POWER_PERFORMANCE\n"

############################################################################################################  		 
# *** REMOTE    https://bbs.archlinux.org/viewtopic.php?id=258188
# https://www.teamviewer.com/en/download/linux/
TEAMVIEWER="Teamviewer 󰢹"
TEAMVIEWER_CMD="teamviewer"
TEAMVIEWER_START="$alacritty_power -e sudo systemctl start teamviewerd"
TEAMVIEWER_STOP=""

REMOTE="$TEAMVIEWER\n"

############################################################################################################  		 
# *** CLI   - Comand Line Interface
alacritty_float="alacritty --hold --class float_windows --config-file /home/lpt/.config/alacritty/alacritty.yml"

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
CALENDARIO_CMD="$alacritty_float -o window.dimensions.columns=80 -o window.dimensions.lines=37 -e cal -y"
TGPT="TGPT CLI"
TGPT_CMD="sh /home/lpt/.config/dwm/tgpt.sh"

CLI="$SPEEDTEST\n$DISK_ANALIZER\n$FIND\n$TEMPO\n$CALENDARIO\n$TGPT\n"

############################################################################################################  		 
# *** GAMES
STEAM="Steam "
STEAM_CMD="steam"
GFORCE="GforceNow 󰊖"
GFORCE_CMD="chromium https://play.geforcenow.com/mall/#/layout/games"
DOOM="Doom 󰊖"
DOOM_CMD="gzdoom"
FLATPAK_BOTTLES="bottles 󰡔 Flatpak"
FLATPAK_BOTTLES_CMD="flatpak run com.usebottles.bottles"
FLATPAK_BOTTLES_BATTLE_NET=" Battle net bottles "
FLATPAK_BOTTLES_BATTLE_NET_CMD="xdg-open bottles:run/Battle/Battle.net"
FLATPAK_BOTTLES_BMX_MH="BMX Matt H bottles"
FLATPAK_BOTTLES_BMX_MH_CMD="xdg-open bottles:run/BMX/BMX"
FLATPAK_BOTTLES_BMX_DM="BMX Dave M bottles"
FLATPAK_BOTTLES_BMX_DM_CMD="xdg-open bottles:run/BMX/NgBMX"




GAME="$STEAM\n$GFORCE\n$DOOM\n$FLATPAK_BOTTLES\n$FLATPAK_BOTTLES_BATTLE_NET\n$FLATPAK_BOTTLES_BMX_DM\n$FLATPAK_BOTTLES_BMX_MH\n"

############################################################################################################  		 
# *** OPT
#### TouchPAD #### Tongle input in dmenu
# #"xinput list" dá o numero do List-Props ,  no ARCH pode ser != do void



AUDIO="audio "
AUDIO_CMD="pavucontrol"
TOUCHPAD_OFF="Touchpad Off"					# se ele está ON .. queremos por a OFF
TOUCHPAD_OFF_CMD="xinput disable 9"		#"xinput list" dá o numero do List-Props ,  no aero ARCH o touchpad é 11
TOUCHPAD_ON="Touchpad On" 					# se ele está OFF .. queremos por a ON
TOUCHPAD_ON_CMD="xinput enable 9"			#"xinput list" dá o numero do List-Props ,  no aero o touchpad é 11


if [ $(xinput list-props "9" | grep 'Device Enabled' | awk '{print $4}') -eq 1 ]; then
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
MONITOR_OFFICE_ON_L="Monitor LEFT ON HMI"
MONITOR_OFFICE_ON_R="Monitor RIGHT ON HMI"
MONITOR_OFFICE_GET='cvt 1680 1050 59'   # get the Modeline for the resolution 
MONITOR_OFFICE_NEW='xrandr  --newmode "1680x1050_59.00"  143.75  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync' # Create a new Mode
MONITOR_OFFICE_ADD='xrandr --addmode HDMI-A-0 1680x1050_59.00'  # add the new resolution mode to the avaliable  HDMI-A-0 list 
MONITOR_OFFICE_ON_L_CMD='xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 0x0 --rotate normal --output DisplayPort-0 --off'
MONITOR_OFFICE_ON_R_CMD='xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1680x1050_59.00 --pos 1920x0 --rotate normal --output DisplayPort-0 --off'
#MONITOR_OFFICE_ON_CMD='xrandr --output eDP --primary --mode 1920x1200 --pos 1680x0 --rotate normal --output HDMI-A-0 --mode 1680x1050 --pos 0x0 --rotate normal --output DisplayPort-0 --off'




#check_ports = $(xrandr -q)
#Não consigo usar string e comparar resultado no IF
#check_hmdi= $(xrandr -q | grep 'HDMI-A-0' | awk '{print $2}')					# 	#Check if HDMI-A-0 is connected
#check_Display_port= $(xrandr -q | grep 'DisplayPort-0' | awk '{print $2}' )		#	#Check if DisplayPort-0 is connected
#check_hmdi_active=$(xrandr --listmonitors | grep 'HDMI'  | awk '{print $4}')	# 	#Check if HDMI-A-0 is ACTIVE

#add new mode to randr 
#	$	cvt 1680 1050 59
#	$	xrandr --newmode "1680x1050_59.00"  143.75  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
# 	$	xrandr --addmode HDMI-A-0 1680x1050_59.00 
#	$	xrandr --output HDMI-A-0 1680x1050_59.00 
#cvt 1680 1050 60
#"1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync

#xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +v


monitores_connected=""

#if [ "$( xrandr -q | grep 'HDMI-A-0' | awk '{print $2}')" == "connected" ] || [ "$( xrandr -q | grep 'DisplayPort-0' | awk '{print $2}')" == "connected" ] ; then
#		if [ "$(xrandr --listmonitors | grep 'HDMI'  | awk '{print $4}')" == "HDMI-A-0" ]; then   # Está activo . podemos desligar
#				monitores_connected="$MONITOR_ALL_OFF\n$MONITOR_OFFICE_ON"  #$MONITOR_ALL_OFF\n$MONITOR_OFFICE_ON
#		else
#				monitores_connected="$MONITOR_OFFICE_ON" 	   # NÃO Está activo . podemos Ligar
#		fi	
#else
#	monitores_connected="not_ok"
#fi

#SCREENS="$monitores_connected\n$MONITORES\n$MONITOR_ALL_OFF\n"
SCREENS="$MONITOR_OFFICE_ON_R\n$MONITORES\n$MONITOR_ALL_OFF\n$MONITOR_OFFICE_ON_L\n"

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

case $bluetooth_power in
	'yes'	) 	bluetooth_power="$BLUETOOTH_OFF" ;;   # se está on queremos por OFF
	'no'	) 	bluetooth_power="$BLUETOOTH_ON" ;;    # se está Off queremos por ON
	*		)  	bluetooth_power="Bluetooth Power ?" ;;   
esac


#ARCH: if [ "$bluetooth_power" == "$BLUETOOTH_OFF" ]; then   # bluetooth_power =  
#VOID: if [ "$bluetooth_power" = "yes" ]; then     # bluetooth is ON





if [ "$bluetooth_power" = "$BLUETOOTH_OFF" ]; then   # bluetooth_power =  
		#2st - Check if bluetooth is Powered ON, iF yes, show the other options
		bluetooth_connected="$(bluetoothctl "info" | grep -E "Name" | awk '{print $2}' )"

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
APPS="Apps All 󰀻"
APPS_CMD="xfce4-appfinder"

APP="$APPS\n"


########################################################################################################
########################################################################################################


all="$WEB$PW$FM$OFFICE$DEV$REMOTE$TOOL$BLUETOOTH$OPT$GAME$APP$SCREENS$NET$CLI$WIFI"



########################################################################################################
########################################################################################################
# set the "NAME" with the comand to execute in this CASE function


title_up_time="$(awk '{print int($1/3600)":"int(($1%3600)/60)":"int($1%60)}' /proc/uptime)"
title_date="$(date +"%a.%d.%b")"



####case "$(printf "$all" | dmenu -p   "$title_date" )" in
case "$(printf "$all" | dmenu -p "$title_up_time"      )" in



# *** WEB
	$BROWSER	) $BROWSER_CMD 	;;
	$WHASTAPP 	) $WHASTAPP_CMD ;;
	$YOUTUBE 	) $YOUTUBE_CMD	;;
	$YOUTUBE_Invidious 	) $YOUTUBE_CMD_Invidious	;;
	$TRANSLATE	) $TRANSLATE_CMD ;;
	$NETFLIX	) $NETFLIX_CMD	;;
	$EMAIL		) $EMAIL_CMD 	;;
	$MAPS		) $MAPS_CMD 	;;
	$PHOTOS		) $PHOTOS_CMD 	;;
	$MYCUF		) $MYCUF_CMD 	;;
	$IPMA		) $IPMA_CMD 	;;
	$NERDFONTS	) $NERDFONTS_CMD ;;
	$DOCS		) $DOCS_CMD 	;;
	$SHEETS		) $SHEETS_CMD 	;;
	$KEEP		) $KEEP_CMD 	;;
	$WOKWI		) $WOKWI_CMD	;;

	$PORTALFINANCAS ) $PORTALFINANCAS_CMD ;;
	$PORTALCONTRA) $PORTALCONTRA_CMD ;;

# *** FM
	$THUNAR		) $THUNAR_CMD 	;;
	$NEMO		) $NEMO_CMD 	;;
	$DOLPHIN	) $DOLPHIN_CMD	;;

# *** Clould
	$PCLOUD		) $PCLOUD_CMD 	;;
	$ICEDRIVE	) $ICEDRIVE_CMD ;;
	$SYNCTHING	) $SYNCTHING_CMD ;;



# *** OFFICE
	$NOTAS			) $NOTAS_CMD		;;
	$OFFICE_DE		) $OFFICE_CMD		;;
	$PDF			) $PDF_CMD			;;
	$PDF_Arranger 	) $PDF_Arranger_CMD ;;
	$GIMP			) $GIMP_CMD 		;;

# *** DEV
	$CODE 			) $CODE_CMD 			;;
	$CODE_ARDUINO 	) $CODE_ARDUINO_CMD 	;;
	$CODE_DOTFILES 	) $CODE_DOTFILES_CMD 	;;
	$ARDUINO		) $ARDUINO_CMD			;;
	$EASYEDA		) $EASYEDA_CMD 	;;  

# *** POWER
	$SHUNTDOWN			) $SHUNTDOWN_CMD 			;;
	$REBOOT				) $REBOOT_CMD 				;;
	$EXIT				) $EXIT_CMD 				;;	
	$POWER_SAVER		) $POWER_SAVER_CMD 			;;	
	$POWER_BALANCE		) $POWER_BALANCE_CMD 		;;	
	$POWER_PERFORMANCE	) $POWER_PERFORMANCE_CMD	;;	

# *** REMOTE
    $TEAMVIEWER	) 	$TEAMVIEWER_START     
					$TEAMVIEWER_CMD ;;

# *** OPT
	$AUDIO			) $AUDIO_CMD 			;;
	$TOUCHPAD_ON	) $TOUCHPAD_ON_CMD 		;;
	$TOUCHPAD_OFF	) $TOUCHPAD_OFF_CMD 	;;
	$BLUEBERRY		) $BLUEBERRY_CMD 		;;
	$BLUEMAN		) $BLUEMAN_CMD 			;;

# *** SCREENS
	$MONITORES			) 	$MONITORES_CMD	;;
	$MONITOR_ALL_OFF	) 	$MONITOR_ALL_OFF_CMD 	;;
	$MONITOR_OFFICE_ON_L	) 	$MONITOR_ALL_OFF_CMD
							$MONITOR_OFFICE_ON_L_CMD 	;;
	$MONITOR_OFFICE_ON_R	) 	$MONITOR_ALL_OFF_CMD
							$MONITOR_OFFICE_ON_R_CMD 	;;

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

    $NETWORKCLI ) $NETWORKCLI_CMD ;;

# *** TOOLS   + Monitores 
	$CALCULADORA )  $CALCULADORA_CMD ;;

# *** Games
	$STEAM	) $STEAM_CMD	;;
	$GFORCE	) $GFORCE_CMD	;;
	$DOOM	) $DOOM_CMD		;;
	$FLATPAK_BOTTLES ) $FLATPAK_BOTTLES_CMD ;;
	$FLATPAK_BOTTLES_BATTLE_NET ) $FLATPAK_BOTTLES_BATTLE_NET_CMD ;;
	$FLATPAK_BOTTLES_BMX_DM ) $FLATPAK_BOTTLES_BMX_DM_CMD ;;



# ** CLI  
	$TGPT			) $TGPT_CMD 			;;
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


