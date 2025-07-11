-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- or, changing the font size and color scheme.
config.font_size = 14
config.font = wezterm.font("Fira Code", { weight = "Regular", ligatures = true })
config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
-- Finally, return the configuration to wezterm:
return config
