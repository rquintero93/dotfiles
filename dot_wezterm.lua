-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- or, changing the font size and color scheme.
config.font_size = 14
config.font = wezterm.font("FiraCode Nerd Font Propo", { weight = "Regular" })
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
-- Finally, return the configuration to wezterm:
return config
