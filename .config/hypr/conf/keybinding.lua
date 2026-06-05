-- ---------
-- VARIABLES
-- ---------

local mainMod = "SUPER"
local scripts = "~/.local/scripts"

-- ------------
-- APPLICATIONS
-- ------------

-- basics
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("~/.config/ml4w/settings/filemanager"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("~/.config/ml4w/settings/calculator.sh"))

-- ----------
-- NAVIGATION
-- ----------

-- workspaces

hl.bind(mainMod .. " + SPACE", hl.dsp.focus({ workspace = "previous" }))		-- toggle previous workspace
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))		-- scroll up one workspace
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))		-- scroll down one workspace
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))				-- toggle +1 workspace
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))		-- toggle -1 workspace

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))			-- move focus to workspace i
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))		-- move windows to workspace i
end

-- windows

hl.bind(mainMod .. " + Q", hl.dsp.window.close())																		-- close window
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"))		-- close all windows
hl.bind("ALT + TAB", hl.dsp.window.cycle_next({ }))																		-- cycle through windows

hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))					-- move focus left
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" })) 					-- move focus right
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" })) 					-- move focus up
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" })) 					-- move focus down

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))		-- move windows left
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))		-- move windows right
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))		-- move windows up
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))		-- move windows down


hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))					-- toggle floating
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))		-- toggle maximizing
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))	-- toggle fullscreen
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))						-- toggle split

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })	-- move window with mouse
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })	-- resize window with mouse

-- laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- brightness control
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true })
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true })

-- -------
-- ACTIONS
-- -------

hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload")) -- Reload Hyprland configuration
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-animations.sh")) -- Toggle animations
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh")) -- Take a screenshot
hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh")) -- Take an instant full-screen screenshot
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh")) -- Take an instant area screenshot
hl.bind(mainMod .. " + ALT + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/text-extractor.sh")) -- Extract text from an area
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("qs ipc call power toggle")) -- Start Power Menu
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --random")) -- Change the wallpaper
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app")) -- Open wallpaper selector
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-automation")) -- Start random wallpaper script
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -replace -i")) -- Open application launcher
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("~/.config/hypr/scripts/keybindings.sh")) -- Show keybindings
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/launch.sh")) -- Reload waybar
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("~/.config/waybar/toggle.sh")) -- Toggle waybar
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/loadconfig.sh")) -- Reload hyprland config
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-cliphist")) -- Open clipboard manager
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd(scripts .. "/switch-theme.sh")) -- Toggle theme
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd(scripts .. "/rofi-pass.sh")) -- Open pass in rofi
hl.bind(mainMod .. " + CTRL + D", hl.dsp.exec_cmd(scripts .. "/rofi-pdf.sh")) -- Open pdfs in rofi
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("qs ipc call sidebar toggle")) -- Open ML4W Sidebar widget
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("qs ipc call calendar toggle")) -- Open ML4W Calendar widget
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh")) -- Toggle game mode
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock")) -- Lock Screen
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("~/.config/ml4w/scripts/ml4w-toggle-hyprsunset")) -- Toggle Hyprsunset
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/overview ipc call overview toggle")) -- Open Select Window Menu
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("~/.config/ml4w/themes/themes.sh")) -- Open Select Window Menu

--[[
bindm = $mainMod, mouse:272, movewindow                                                     # Move window with the mouse
bindm = $mainMod, mouse:273, resizewindow                                                   # Resize window with the mouse
bind = $mainMod SHIFT, right, resizeactive, 100 0                                           # Increase window width with keyboard
bind = $mainMod SHIFT, left, resizeactive, -100 0                                           # Reduce window width with keyboard
bind = $mainMod SHIFT, down, resizeactive, 0 100                                            # Increase window height with keyboard
bind = $mainMod SHIFT, up, resizeactive, 0 -100                                             # Reduce window height with keyboard
bind = $mainMod, G, togglegroup                                                             # Toggle window group
bind = $mainMod, K, layoutmsg, swapsplit                                                    # Swapsplit
bind = $mainMod ALT, left, swapwindow, l                                                    # Swap tiled window left
bind = $mainMod ALT, right, swapwindow, r                                                   # Swap tiled window right
bind = $mainMod ALT, up, swapwindow, u                                                      # Swap tiled window up
bind = $mainMod ALT, down, swapwindow, d                                                    # Swap tiled window down
binde = ALT,Tab,cyclenext                                                                   # Cycle between windows
binde = ALT,Tab,bringactivetotop                                                            # Bring active window to the top
]]--

hl.bind(mainMod .. " + CTRL + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

