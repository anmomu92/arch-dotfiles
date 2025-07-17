#!/bin/bash

hyprctl clients -j | jq -r '.[].pid' | xargs -r kill

sleep 1
anki &
sleep 1
joplin-desktop &
