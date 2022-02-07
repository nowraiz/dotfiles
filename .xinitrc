#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local &
xset fp rehash &
xset -dpms
xset s off
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

#compton -b &
picom --experimental-backends --backend glx &
numlockx &
unclutter &
#xbindkeys &
nitrogen --restore &
lxpolkit &
#parcellite &
#urxvtd -q -o -f
sxhkd &
#wal -i /usr/share/wallpapers/custom/
redshift -x
redshift -O 4000K
export KDEWM=/usr/bin/bspwm
exec startplasma-x11
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session


