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
			normal_bg = "#002b36",
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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<leader>lr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>va", "<Cmd>Lspsaga finder<CR>", opts)
