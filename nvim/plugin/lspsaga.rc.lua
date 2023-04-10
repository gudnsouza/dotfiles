local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	ui = {
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
	beacon = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
})

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<leader>lr", "<Cmd>Lspsaga rename<CR>", opts)

-- code action
-- local codeaction = require("lspsaga.codeaction")
-- vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
-- vim.keymap.set("v", "<leader>ca", function()
--   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
--   codeaction:range_code_action()
-- end, { silent = true })
