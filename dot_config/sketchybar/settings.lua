local colors = require("colors")
local icons = require("icons")

return {
	paddings = 3,
	group_paddings = 5,
	modes = {
		main = {
			icon = icons.rebel,
			color = colors.rainbow[1],
		},
		service = {
			icon = icons.nuke,
			color = 0xffff9e64,
		},
	},
	bar = {
		height = 40,
		padding = {
			x = 10,
			y = 0,
		},
		background = colors.bar.bg,
	},
	items = {
		height = 26,
		gap = 5,
		padding = {
			right = 16,
			left = 12,
			top = 0,
			bottom = 0,
		},
		default_color = function(workspace)
			return colors.rainbow[workspace + 1]
		end,
		highlight_color = function(workspace)
			return colors.rainbow[workspace + 2]
		end,
		colors = {
			background = colors.bg1,
		},
		corner_radius = 12,
	},

	icons = "sketchybar-app-font:Regular:16.0", -- alternatively available: NerdFont

	divider = {
		character = "│",
		color = colors.bg2,
		padding_left = 1,
		padding_right = 2,
	},
	font = {
		text = "FiraCode Nerd Font Propo", -- Used for text
		numbers = "FiraCode Nerd Font Propo", -- Used for numbers
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Medium",
			["Bold"] = "SemiBold",
			["Heavy"] = "Bold",
			["Black"] = "ExtraBold",
		},
	},
}
