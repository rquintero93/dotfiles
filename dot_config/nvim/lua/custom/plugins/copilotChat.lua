return {
	"CopilotC-Nvim/CopilotChat.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
		model = "claude-sonnet-4",
		highlight_headers = false,
		separator = "---",
		error_header = "> [!ERROR] Error",
		auto_insert_mode = false,
		context = "buffers",
		window = {
			layout = "float",
			relative = "cursor",
			width = 1,
			height = 0.4,
			row = 1,
		},
	},
}
