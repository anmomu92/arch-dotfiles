#!/bin/bash

STATE_PATH="$HOME/.local/state/amm92"

if [ ! -d "$STATE_PATH" ]; then 
	mkdir -p "$STATE_PATH"
	echo "claro" > "$STATE_PATH/system-theme"
elif [ ! -f "$STATE_PATH/system-theme" ]; then
	echo "claro" > "$STATE_PATH/system-theme"
fi

CURRENT_THEME=$(<"$STATE_PATH/system-theme")

# We switch the theme
if [ "${CURRENT_THEME}" == "dark" ]; then
	# We update the global option
	echo "light" > "$STATE_PATH/system-theme"

    # GTK
    sed -i 's/color-scheme=prefer-dark/color-scheme=prefer-light/g' ~/.local/share/nwg-look/gsettings

elif [ "${CURRENT_THEME}" == "light" ]; then
	# We update the global option
	echo "dark" > "$STATE_PATH/system-theme"

    # GTK
    sed -i 's/color-scheme=prefer-light/color-scheme=prefer-dark/g' ~/.local/share/nwg-look/gsettings
fi

# Qutebrowser
if [ $(pgrep qutebrowser) ]; then
	qutebrowser ":config-cycle colors.webpage.darkmode.enabled false true"
fi

# Dock
nwg-look -a     # Apply changes
nwg-look -x     # Export changes
$HOME/.config/nwg-dock-hyprland/launch.sh
    
# We notify the change 
NEW_THEME=$(<"$STATE_PATH/system-theme")
notify-send "Theme switched to $NEW_THEME"
