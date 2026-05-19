#!/bin/bash          # estava !/bin/bash — faltava o #
set -euo pipefail    # sai ao primeiro erro, variável não definida, ou pipe falhado


#Verifica se é ROOT
[[ "$(id -u)" -ne 0 ]] && { echo "Erro: executa como root."; exit 1; }


echo Must be Super user to run
read choice
read choice

libs_multi_nonfree="void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree"
internet="firefox speedtest-cli yt-dlps syncthing"
office="pdfarranger libreoffice-base libreoffice-math libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-dictionaries libreoffice-i18n-pt mythes-pt_PT hunspell-pt_PT hyphen-pt vscode git gimp"
fonts="libreoffice-fonts dina-font dejavu-fonts-ttf terminus-font noto-fonts-ttf-extra noto-fonts-ttf noto-fonts-emoji mkfontscale xfontsel xorg-fonts "
file_manager="thunar-archive-plugin"
zips="file-roller"
players_codec="mpv"
tools="exiftool gparted cheese flatpak lite-xl"
amd="amdvlk amdvlk-32bit xf86-video-amdgpu mesa-vaapi mesa-vdpau"
games="steam libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mono mesa-32bit vulkan-loader mesa-dri-32bit mesa-vulkan-radeon"
wine="wine wine-common wine-gecko wine-mono wine-tools winegui winetricks protontricks wine-32bit"
Bluetooth="bluez blueman libspa-bluetooth"
virtualbox="virtualbox-ose virtualbox-ose-dkms virtualbox-ose-guest virtualbox-ose-guest-dkms"
dwm_mk="base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel"
dwm="dwm dmenu slstatus"
dwm_De="alacritty dunst lf volumeicon light udevil gsimplecal-gtk3 htop flameshot xtools arandr galculator xinput clipit xkill xdottool xprop tlp tlpui nerd-fonts-symbols-ttf nerd-fonts-ttf"
previews_lf="ueberzug odt2txt bat ffmpegthumbnailer exiftool jq lynx atool poppler poppler-utils" 



ALL="
${libs_multi_nonfree}
${internet}
${office}
${fonts}
${file_manager}
${zips}
${players_codec}
${tools}
${amd}
${games}
${wine}
${Bluetooth}
${virtualbox}
${dwm_mk}
${dwm}
${dwm_De}
${previews_lf}
"

#echo  $ALL 
#read choice
#read choice




echo "PKG LIST ######################################################################"
echo "program_name"
echo
echo "---- libs_multi_nonfree ----------------------------------------"
echo $libs_multi_nonfree
echo
echo "---- internet --------------------------------------------------"
echo $internet
echo 
echo "---- office ----------------------------------------------------"
echo $office
echo 
echo "---- fonts -----------------------------------------------------"
echo $fonts
echo 
echo "---- file_manager ----------------------------------------------"
echo $file_manager
echo 
echo "---- zips ------------------------------------------------------"
echo $zips
echo 
echo "---- players_codec ---------------------------------------------"
echo $players_codec
echo 
echo "---- tools -----------------------------------------------------"
echo $tools
echo 
echo "---- amd -------------------------------------------------------"
echo $amd
echo 
echo "---- WINE ------------------------------------------------------"
echo "# è preciso Instalar ???, testar só com o Flatpak:bottles"
echo $wine
echo 
echo "---- Bluetooth -------------------------------------------------"
echo $Bluetooth
echo 
echo "---- virtualbox ------------------------------------------------"
echo $virtualbox
echo 
echo "---- dwm_mk ----------------------------------------------------"
echo $dwm_mk
echo 
echo "---- dwm -------------------------------------------------------"
echo $dwm
echo 
echo "---- dwm_De ----------------------------------------------------"
echo $dwm_De
echo
echo "---- previews_lf -----------------------------------------------"
echo $previews_lf
echo
echo "END   ######################################################################"

echo
echo
echo

echo "UPDATE mirrors   -- PRESS Enter to Continue or EXIT manually"
read choice
xbps-install -Suv
echo
echo "Install LISTED pkg   -- PRESS Enter to Continue or EXIT manually"
read choice

xbps-install -S $ALL

echo "Now, will checks what running programs need to be restarted  -- PRESS Enter to Continue or EXIT manually"
read choice
xcheckrestart

echo
echo
echo "Enable Service:    bluetoothd        -- PRESS Enter to Continue or EXIT manually"
read choice
ln -s /etc/sv/bluetoothd/ /var/service/ 

echo
echo
echo "Enable Service:    dbus        -- PRESS Enter to Continue or EXIT manually"
read choice
ln -s /etc/sv/dbus/ /var/service/

echo
echo
echo "ADD chmod +s to use PKG without sudo: # chmod +s /usr/bin/light        -- PRESS Enter to Continue or EXIT manually"
read choice
chmod +s /usr/bin/light

echo 
echo "ADD chmod +s to use PKG without sudo:   # chmod +s /usr/bin/tlp        -- PRESS Enter to Continue or EXIT manually"
read choice
chmod +s /usr/bin/tlp

## FONTES
echo 
echo
echo "Relaod Fonts  'fc-cahe -fv '    -- PRESS Enter to Continue or EXIT manually "
read choice
cd cd /usr/share/fonts/
fc-cache -fv
echo 
echo "NerdFonts e Symblos no VSCODE?, "PREFERENCES->TEXT EDITOR->FONTS->FONT FAMILY"  add: 'Hack Nerd Font' "
read choice
echo 
echo 

## FLATPAK
echo 
echo
echo "FLATPAK install Bottles -- PRESS Enter to Continue or EXIT manually"
read choice
flatpak install bottles




echo MOUNT drive in UUID permanentemente
echo Find out the UUID of /dev/sda3 by doing:
echo sudo blkid
echo gravar o UUID pretendido, exemplo f00f00bc-d313-47f5-ae7c-d4b963fbca43
echo create a folder : -p é para criar todos os directorios se não existirem.
echo Odisco pode ser montado em qualquer lado.
echo sudo mkdir -p /path/to/folder 
echo editar o ficheiro FSTAB
echo sudo -H EDITOR(mousepad) /etc/fstab
echo adicionar:
echo UUID=UUID_pretendido /path/to/folder ext4 defaults  0      2
echo Atenção, se a pasta não existir, vai dar erro durante o boot e não dá para usar o TTY

echo permitir que a pasta seja Read-write:    " #    sudo chmod 777 /path/to/folder  " 
echo Press any key to continue
read choice


echo PlatformIo : Permission denied: '/dev/ttyACM0'
echo sudo usermod -a -G plugdev $USERNAME
echo sudo usermod -a -G dialout $USERNAME
echo tb instalei o platformio do xbps
