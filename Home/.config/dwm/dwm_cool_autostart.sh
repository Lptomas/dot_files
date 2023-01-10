#!/usr/bin/env bash

devmon &    #mount removable devices: pens etc 
autorandr -c &
setxkbmap pt &
numlockx on &
slstatus &
flameshot &
#nm-applet &  # now in indication in slstatus
#volumeicon & # Now with a indication in slstatus


