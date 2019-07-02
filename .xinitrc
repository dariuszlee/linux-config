#!/bin/sh

if [[ $(whoami) == 'dzlyy' ]];then
	userresources=$HOME/.Xresourcesdzlyy
else
	userresources=$HOME/.Xresources
fi
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
	logger $userresources
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

export TERMINAL=rofi termite 
twm &
if [[ $(whoami) == 'dzlyy' ]];then
    export GDK_SCALE = 2
    exec xrandr --dpi 220 --output eDP-1 --mode 3200x1800 
    exec xrandr --output DP-1 --mode 1920x1080 --right-of e-DP-1
fi
