#!/bin/bash

CURRENT_THEME=$(cat ~/.config/ml4w/settings/system-theme.sh)

# Waybar
WAYBAR_LIGHT_THEME="/ml4w;/ml4w/light"
WAYBAR_DARK_THEME="/ml4w;/ml4w/mixed"

# GTK


# ----- Dark theme ----- #
if [ "${CURRENT_THEME}" == "dark" ]; then
    # neovim
    sed -i 's/theme = "onedark"/theme = "flexoki-light"/g' ~/.config/nvim/lua/chadrc.lua
    nvim --headless +"lua package.loaded['chadrc'] = nil" \
                  +"luafile ~/.config/nvim/lua/chadrc.lua" \
                  +"lua require('base46').load_all_highlights()" +q

    # Wallpaper
    waypaper --wallpaper ~/wallpaper/light.jpg

    # Waybar
    echo "$WAYBAR_LIGHT_THEME" > ~/.config/ml4w/settings/waybar-theme.sh
    echo "light" > ~/.config/ml4w/settings/system-theme.sh
    sed -i 's/"format": "󰽥"/"format": "󰖨"/g' ~/.config/waybar/modules.json
    $HOME/.config/waybar/launch.sh

    # GTK
    sed -i 's/color-scheme=prefer-dark/color-scheme=prefer-light/g' ~/.local/share/nwg-look/gsettings
    nwg-look -a     # Apply changes
    nwg-look -x     # Export changes

    # Dock
    pkill nwg-dock-hyprla
    $HOME/.config/nwg-dock-hyprland/launch.sh
    
    CURRENT_THEME=$(cat ~/.config/ml4w/settings/system-theme.sh)
    notify-send "Theme changed to $CURRENT_THEME"


# ----- Light theme -----#

elif [ "${CURRENT_THEME}" == "light" ]; then
    # neovim
    sed -i 's/theme = "flexoki-light"/theme = "onedark"/g' ~/.config/nvim/lua/chadrc.lua
    nvim --headless +"lua package.loaded['chadrc'] = nil" \
                  +"luafile ~/.config/nvim/lua/chadrc.lua" \
                  +"lua require('base46').load_all_highlights()" +q

    # Wallpaper
    waypaper --wallpaper ~/wallpaper/dark.jpg

    # Waybar
    echo "$WAYBAR_DARK_THEME" > ~/.config/ml4w/settings/waybar-theme.sh
    echo "dark" > ~/.config/ml4w/settings/system-theme.sh
    sed -i 's/"format": "󰖨"/"format": "󰽥"/g' ~/.config/waybar/modules.json
    $HOME/.config/waybar/launch.sh

    # GTK
    sed -i 's/color-scheme=prefer-light/color-scheme=prefer-dark/g' ~/.local/share/nwg-look/gsettings
    nwg-look -a     # Apply changes
    nwg-look -x     # Export changes

    # Dock
    pkill nwg-dock-hyprla
    $HOME/.config/nwg-dock-hyprland/launch.sh

    CURRENT_THEME=$(cat ~/.config/ml4w/settings/system-theme.sh)
    notify-send "Theme changed to $CURRENT_THEME"
fi
    
