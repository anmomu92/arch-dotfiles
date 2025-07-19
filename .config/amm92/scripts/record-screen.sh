#!/bin/bash

OUTPUT="$HOME/Videos/recordings/$(date +%d-%m-%Y_%H-%M).mp4"

if [[ $(pgrep wf-recorder) ]]; then
	pkill wf-recorder
	notify-send "Recording saved at $OUTPUT"
else
	notify-send "Recording starts in 5 seconds"
	sleep 5
	wf-recorder -a -f $OUTPUT
fi
