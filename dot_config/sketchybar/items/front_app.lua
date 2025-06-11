local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
	icon = {
		font = {
			family = settings.font.numbers,
		},
	},
	label = {
		font = {
			font = settings.icons,
		},
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	local icon_line = ""
	local lookup = app_icons[env.INFO]
	local icon = ((lookup == nil) and app_icons["default"] or lookup)

	icon_line = icon_line .. " " .. icon
	sbar.animate("tanh", 10, function()
		front_app:set({
			label = icon,
		})
	end)
end)

front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
