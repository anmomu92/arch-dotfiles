#!/bin/sh

handle() {
  case $1 in
    openwindow*) pw-play /usr/share/sounds/Pop/stereo/notification/complete.oga ;;
    closewindow*) pw-play /usr/share/sounds/Pop/stereo/notification/window-attention-inactive.oga ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
