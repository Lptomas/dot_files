#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi



# set keys
#setxkbmap pt &

#sleep 2 && thunar &

#system-tray do dwm
#sleep 2 && slstatus &

# sleep 1 && flameshot &

#sleep 1 && nm-applet & 

#sleep 1 && volumeicon &

#to restart dwm without exit and then do startx
while true ; do
	dwm >/dev/null 2>&1
done


# DWM - Execute
exec dwm 
#exec awesome


# https://wiki.archlinux.org/title/Xinit#xinitrc
# 4.2 - Autostart X at login 
# add 
# startx

