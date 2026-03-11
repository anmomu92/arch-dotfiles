#!/bin/sh

PIDFILE="/tmp/hypr-sound.pid"

stop_sound() {
    if [ -f "$PIDFILE" ]; then
        PID=$(cat "$PIDFILE")
        if kill -0 "$PID" 2>/dev/null; then
            kill -TERM "$PID"
            sleep 0.02
            kill -KILL "$PID" 2>/dev/null
        fi
        rm -f "$PIDFILE"
    fi
}

play_sound() {
    # pw-play "$1" &
	play "$1" &
	# sox "$1" -d fade t 0 0.3 0.05 &
    echo $! > "$PIDFILE"
}

handle() {
	case "$1" in
		openwindow*)
			stop_sound
			play_sound /usr/share/sounds/Pop/stereo/notification/complete.oga
			;;
		closewindow*)
			stop_sound
			play_sound /usr/share/sounds/Pop/stereo/notification/window-attention-inactive.oga
			;;
		workspacev2*)
			stop_sound
			play_sound /usr/share/sounds/ocean/stereo/completion-success.oga
			;;
	esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
