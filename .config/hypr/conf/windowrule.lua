-- Window rules

-- brave-browser
hl.window_rule({
	name = "brave",
	match = {
		class = "brave-browser"
	},
	workspace = 1,
})

-- kitty
hl.window_rule({
	name = "kitty",
	match = {
		class = "kitty"
	},
	workspace = 10,
})

-- signal
hl.window_rule({
	name = "signal",
	match = {
		class = "signal"
	},
	workspace = 8,
})

-- volume control
hl.window_rule({
	name = "volume-control",
	match = {
		class = "org.pulseaudio.pavucontrol"
	},
	size = {"window_w * 1.5", "window_h * 1.5"},
	float = true,
})
