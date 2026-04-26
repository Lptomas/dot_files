#!/usr/bin/env bash
# Chamado por: ../dwm/config.def.h  pelo patch  " dwm-cool-autostart-6.2.diff "

# ___ Fundo __________________________________________________________________
feh --bg-scale ~/black.jpg &

# ___ Barra de estado ________________________________________________________
slstatus &


#devmon &   # montar dispositivos removíveis (pen drives, etc.) — só no Arch

# ___ Configuração de ecrãs __________________________________________________
# Gera os parâmetros do modo para o segundo ecrã (1680×1050 @ 59 Hz)
cvt 1680 1050 59

# Cria o modo personalizado e adiciona-o ao ecrã externo
xrandr --newmode "1680x1050_59.00" 143.75 \
        1680 1784 1960 2240 \
        1050 1053 1059 1089 \
        -hsync +vsync

xrandr --addmode HDMI-A-0 1680x1050_59.00

# Desliga o HDMI antes de aplicar a configuração final
# (evita artefactos ao sair do DWM)
xrandr --output eDP        --primary --mode 1920x1200 --pos 0x0    --rotate normal \
       --output HDMI-A-0   --off \
       --output DisplayPort-0 --off

# Disposição: HDMI à esquerda do ecrã principal
#xrandr --output eDP       --primary --mode 1920x1200 --pos 1680x0 --rotate normal \
#       --output HDMI-A-0  --mode 1680x1050_59.00    --pos 0x0    --rotate normal \
#       --output DisplayPort-0 --off

# Disposição: HDMI em CIMA do ecrã principal (ativo)
xrandr --output eDP        --primary --mode 1920x1200    --pos 0x1050   --rotate normal \
       --output HDMI-A-0   --mode 1680x1050_59.00        --pos 120x0    --rotate normal \
       --output DisplayPort-0 --off

# Disposição: HDMI à direita (conversor VGA→HDMI)
#xrandr --output eDP       --primary --mode 1920x1200    --pos 1680x0   --rotate normal \
#       --output HDMI-A-0  --mode 1680x1050_59.00        --pos 0x0      --rotate normal \
#       --output DisplayPort-0 --off &

# detecta e define automaticamente nao funcionada, talvez numa resolução standard ou sem HMI->Adaptador-> VGA
#autorandr -c &

# ___ Teclado e rato _________________________________________________________
setxkbmap pt &
numlockx on &
# VOID: ativa o toque no touchpad (tap-to-click)
synclient tapbutton1=1 &

# ___ Rede / áudio / Bluetooth (geridos via dmenu / slstatus) ________________
#nm-applet &       # rede
#volumeicon &      # volume
#blueman-applet &  # bluetooth
#blueberry &       # bluetooth (alternativo)
#pavucontrol &     # mixer PulseAudio

# ___ Notificações ___________________________________________________________
# Necessário para o Flameshot (screenshot chamado diretamente via XF86keysym)
dunst &

# ___ Aplicações de arranque _________________________________________________
firefox &

# ___ Áudio (PipeWire) _______________________________________________________
pipewire &
pipewire-pulse &
dbus-run-session &

# ___ Gestor de área de transferência ________________________________________
xfce4-clipman &
#clipit &   # alternativo

# ___ Correção de tearing no ecrã (ex.: YouTube) _____________________________
xrandr | grep ' connected' | cut -f1 -d' ' | while read display; do
    xrandr --output "$display" --set TearFree on
done &