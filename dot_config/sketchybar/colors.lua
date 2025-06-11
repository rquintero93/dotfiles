return {
	black = 0xFF1E1E2E,
	white = 0xFFCDD6F4,
	red = 0xFFF38BA8,
	green = 0xFFA6E3A1,
	blue = 0xFF89B4FA,
	yellow = 0xFFF9E2AF,
	orange = 0xFFFAB387,
	magenta = 0xFFCBA6F7,
	grey = 0xFF313243,
	transparent = 0x00000000,

	bar = {
		bg = 0x001E1E2E,
		border = 0x001E1E2E,
	},
	popup = {
		bg = 0xFF45475A,
		border = 0xFFCDD6F4,
	},
	bg1 = 0xFF313243,
	bg2 = 0xFF313243,

	rainbow = {
		0xff7f8490, -- Maroon
		0xffa6e3a1, -- Green
		0xff89b4fa, -- Blue
		0xffb4befe, -- Lavender
		0xffcba6f7, -- Mauve
		0xff74c7ec, -- Sapphire
		0xff89dceb, -- Sky
		0xfffab387, -- Peach
	},

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
