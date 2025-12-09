#!/bin/sh

# Start the device with a very soft sound
play -q -n synth 1 sine 10 vol 0.1

sleep 0.5

# Startup sound
pw-play /usr/share/sounds/Pop/stereo/notification/system-ready.oga &

sleep 0.5
