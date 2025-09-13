#!/bin/bash

LOG_PATH="$HOME/.local/log"
LOG_FILE="$LOG_PATH/switch-theme.log"
STATE_PATH="$HOME/.local/state/amm92"
DOCK_STATE=$(<"$STATE_PATH/dock")

if [ ! -d "$STATE_PATH" ]; then 
	mkdir -p "$STATE_PATH"
	echo "light" > "$STATE_PATH/system-theme"
elif [ ! -f "$STATE_PATH/system-theme" ]; then
	echo "light" > "$STATE_PATH/system-theme"
fi

CURRENT_THEME=$(<"$STATE_PATH/system-theme")

echo "SWITCH THEME SCRIPT LOG" | tee $LOG_FILE 
echo "-----------------------" | tee -a $LOG_FILE 
echo "" | tee -a $LOG_FILE 
echo "Current theme is $CURRENT_THEME" | tee -a $LOG_FILE 

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
	echo "Qutebrowser theme changed" | tee -a $LOG_FILE 
	qutebrowser ":config-cycle colors.webpage.darkmode.enabled false true"
fi

nwg-look -a     # Apply changes
nwg-look -x     # Export changes

# Dock
if [ $(pgrep -f nwg-dock-hyprland) ]; then 
	echo "Dock theme changed" | tee -a $LOG_FILE 
	$HOME/.config/nwg-dock-hyprland/launch.sh
fi
    
# We notify the change 
NEW_THEME=$(<"$STATE_PATH/system-theme")
notify-send "Theme switched to $NEW_THEME"

echo "" | tee -a $LOG_FILE 
echo "New theme is $CURRENT_THEME" | tee -a $LOG_FILE 
