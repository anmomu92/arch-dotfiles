hl.on("hyprland.start", function ()
	-- environment for xdg-desktop-portal-hyprland
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	--set sounds
	hl.exec_cmd("~/.local/scripts/keep-audio-awake.sh")
	hl.exec_cmd("~/.local/scripts/hypr-sounds.sh")
	-- set cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
	-- setup XDG for screen sharing and start waypaper and waybar
	hl.exec_cmd("~/.config/hypr/scripts/xdg.sh")
	-- start Polkit
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	-- start swaync
	hl.exec_cmd("swaync")
	-- load GTK settings
	hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
	-- start hyprdile
	hl.exec_cmd("hypridle")
	-- start wl-paste
	hl.exec_cmd("wl-paste")
	-- autostart scripts
	hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart.sh")
	-- start autostart cleanup
	hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
	-- load configuration from ML4W Hyprland Settings App
	hl.exec_cmd("~/.config/com.ml4w.hyprlandsettings/hyprctl.sh")
	-- launch waybar
	hl.exec_cmd("~/.config/waybar/launch.sh")
	-- launch dock
	hl.exec_cmd("~/.config/nwg-dock-hyprland/launch.sh")
	-- start hyprsunset
	hl.exec_cmd("hyprsunset")
	-- start hyprpaper
	hl.exec_cmd("hyprpaper")
end)
