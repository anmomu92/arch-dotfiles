-- Window rules

-- brave-browser
hl.window_rule({
	name = "brave",
	match = {
		class = "brave-browser",
	},
	no_blur = false,
	workspace = 1,
})

-- kitty
hl.window_rule({
	name = "kitty",
	match = {
		class = "kitty",
	},
	no_blur = false,
	workspace = 10,
})

-- signal
hl.window_rule({
	name = "signal",
	match = {
		class = "signal",
	},
	no_blur = false,
	workspace = 8,
})

-- volume control
hl.window_rule({
	name = "volume-control",
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	size = { "window_w * 1.5", "window_h * 1.5" },
	no_blur = false,
	float = true,
})

-- anki
hl.window_rule({
	name = "anki",
	match = {
		class = "anki",
	},
	no_blur = false,
	workspace = 7,
})

-- audacity
hl.window_rule({
	name = "audacity",
	match = {
		class = "Audacity",
	},
	no_blur = false,
	workspace = 9,
})

-- zathura
hl.window_rule({
	name = "zathura",
	match = {
		class = "org.pwmt.zathura",
	},
	no_blur = false,
	workspace = 10,
})

-- nautilus
hl.window_rule({
	name = "nautilus",
	match = {
		class = "org.gnome.Nautilus",
	},
	no_blur = false,
	float = true,
})
