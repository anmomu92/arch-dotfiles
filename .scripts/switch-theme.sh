#!/bin/bash

# DEPENDENCIES
# ------------
#
# - matugen
# - zsh
# - nwg-dock-hyprland

# VARIABLES

LOG_PATH="$HOME/.local/log"
WP_PATH="${HOME}/.local/share/wallpapers/${SYS_THEME}"
STATE_PATH="$HOME/.local/state/amm92"

LOG_FILE="$LOG_PATH/switch-theme.log"
DOCK_STATE=$(<"$STATE_PATH/dock")
WP="${WP_PATH}/default.jpg"

# Check system theme state existance
if [ ! -d "$STATE_PATH" ]; then 
	mkdir -p "$STATE_PATH"
elif [ ! -f "$STATE_PATH/system-theme" ]; then
	touch "${STATE_PATH}/system-theme"
fi

CURRENT_THEME=$(<"$STATE_PATH/system-theme")

# Log
echo "SWITCH THEME SCRIPT LOG" | tee $LOG_FILE 
echo "-----------------------" | tee -a $LOG_FILE 
echo "" | tee -a $LOG_FILE 
echo "Current theme is $CURRENT_THEME" | tee -a $LOG_FILE 

# Theme switch
if [ "${CURRENT_THEME}" == "dark" ]; then

	# We update the global option and variable
	NEW_THEME="light"
	echo ${NEW_THEME} > "${STATE_PATH}/system-theme"

	# TODO - Find a simpler fix
	source ~/.zshenv

    # GTK
    sed -i 's/color-scheme=prefer-dark/color-scheme=prefer-light/g' ~/.local/share/nwg-look/gsettings

	# Zathura
	cp "$HOME/.config/zathura/light-theme" "$HOME/.config/zathura/zathurarc"

	# Wallpaper
	#hyprctl hyprpaper wallpaper 'HDMI-A-1, '$LIGHT_WP''
	hyprpaper &

elif [ "${CURRENT_THEME}" == "light" ]; then

	# We update the global option and variable
	NEW_THEME="dark"
	echo ${NEW_THEME} > "$STATE_PATH/system-theme"

	# TODO - Find a simpler fix
	source ~/.zshenv

    # GTK
    sed -i 's/color-scheme=prefer-light/color-scheme=prefer-dark/g' ~/.local/share/nwg-look/gsettings

	# Zathura
	cp "$HOME/.config/zathura/dark-theme" "$HOME/.config/zathura/zathurarc"

	# Wallpaper
	# hyprctl hyprpaper wallpaper 'HDMI-A-1, '$DARK_WP''
	hyprpaper &


fi

# Matugen
matugen image "${WP}"

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
#NEW_THEME=$(<"$STATE_PATH/system-theme")
notify-send "Theme switched to $NEW_THEME"

echo "" | tee -a $LOG_FILE 
echo "New theme is $CURRENT_THEME" | tee -a $LOG_FILE 
