
# default apps
export EDITOR="xed"
export TERMINAL="alacritty"
export BROWSER="firefox"



# cleaning up home folder
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}


export MANPAGER="less -R --use-color -Dd+r -Du+b"
export WINIT_X11_SCALE_FACTOR=1.00 alacritty

#export XDG_RUNTIME_DIR=/some/directory/you/specify 
#export RUNLEVEL=3

#ignore upper and lowercase when TAB completion
# ?? bind "set completion-ignore-case on"
 
# Espaço em disco - readable output 
#alias df='df -h'

#alias sm1='xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output VGA1 --off --output VIRTUAL1 --off'
#alias sm='xrandr --output LVDS1 --primary --mode 1366x768 --pos 1680x282  --output VGA1 --mode 1680x1050 --pos 0x0 &'

alias ls='ls --color=auto'




#void Linux
#alias xi='sudo xbps-install'
#alias xu='sudo xbps-install -Suv'
#alias xs='sudo xbps-query -Rs'
#alias xr='sudo xbps-remove'
#alias xrc='man xbps-remove'	#Remove old
#alias klist='vkpurge list' #
#alias krm='sudo vkpurge rm' #  add version from vkpurgue list


alias sx="startx"
#shutdown or reboot
alias ssn="sudo poweroff"
alias sr="sudo reboot"


#hardware info --short
alias hw="hwinfo --short"


alias cdwm='cd ~/.config/dwm/'
alias mkdwm='cd ~/.config/dwm/ ; rm -f config.h ; sudo make clean install'
alias mkdmenu='cd ~/.config/dwm_dmenu/ ; rm -f config.h ; sudo make clean install'
alias mkslstatus='cd ~/.config/dwm_slstatus/ ; rm -f config.h ; sudo make clean install'
alias cd..='cd ..'
alias calculator='galculator'
alias clean='clear'


alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 " #  then paste link
alias yt-video="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 " # "URL"  then paste link inside of COTES
#youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata [url]
#alias lf='lfub'


export LC_ALL=en_US.UTF-8
    
