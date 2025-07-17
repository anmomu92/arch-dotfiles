#!/bin/bash
#                _ _
# __      ____ _| | |_ __   __ _ _ __   ___ _ __
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
#                   |_|         |_|
#
# -----------------------------------------------------
# Restore last wallpaper
# -----------------------------------------------------

# -----------------------------------------------------
# Set defaults
# -----------------------------------------------------

DEFAULT_WALLPAPER="$HOME/.config/amm92/wallpapers/default-2.png"
STATE_PATH="$HOME/.local/state/amm92"
CACHE_FILE="$STATEPATH/current_wallpaper"

# -----------------------------------------------------
# Get current wallpaper
# -----------------------------------------------------

if [ -f "$CACHE_FILE" ]; then
    sed -i "s|~|$HOME|g" "$CACHE_FILE"
    wallpaper=$(cat $CACHE_FILE)
    if [ -f $wallpaper ]; then
        echo ":: Wallpaper $wallpaper exists"
    else
        echo ":: Wallpaper $wallpaper does not exist. Using default."
        wallpaper=$DEFAULT_WALLPAPER
    fi
else
    echo ":: $CACHE_FILE does not exist. Using default wallpaper."
    wallpaper=$DEFAULT_WALLPAPER
fi

# -----------------------------------------------------
# Set wallpaper
# -----------------------------------------------------

echo ":: Setting wallpaper with source image $wallpaper"
waypaper --wallpaper "$wallpaper"
