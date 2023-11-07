local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	diagnostic = {
		max_height = 0.8,
		max_width = 0.8,
		max_show_width = 0.7,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		border = "rounded",
		colors = {
			-- normal_bg = "#002b36",
		},
	},
	max_width = 0.8,
	beacon = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
})
