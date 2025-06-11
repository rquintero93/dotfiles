local settings = require("settings")
local icons = require("icons")
local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple_logo = sbar.add("item", {
	icon = {
		font = {
			size = 22.0,
		},
		string = settings.modes.main.icon,
		padding_right = 8,
		padding_left = 8,
		highlight_color = settings.modes.service.color,
	},
	label = {
		drawing = false,
	},
	background = {
		color = settings.items.colors.background,
		-- border_color = settings.modes.main.color,
		border_width = 1,
	},

	padding_left = 1,
	padding_right = 1,
	click_script = popup_toggle,
})

-- Padding to the right of the main button
sbar.add("item", {
	width = 7,
})

local apple_prefs = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.preferences,
	label = "Preferences",
})

apple_prefs:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'System Preferences'")
	apple_logo:set({ popup = { drawing = false } })
end)

local apple_sysinfo = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.preferences,
	label = "System Information",
})

apple_sysinfo:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'System Information'")
	apple_logo:set({ popup = { drawing = false } })
end)

local apple_activity = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.preferences,
	label = "Activity Monitor",
})

apple_activity:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'Activity Monitor'")
	apple_logo:set({ popup = { drawing = false } })
end)

apple_logo:subscribe("mouse.exited.global", function()
	apple_logo:set({ popup = { drawing = false } })
end)
