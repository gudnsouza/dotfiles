local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Do not yank with X
keymap.set("n", "x", '"_x', opts)
keymap.set("x", "p", '"_dP', opts)
-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
keymap.set({ "n", "v" }, "$", "g_", { desc = "Better $, behaves as expected" })

-- Folds
keymap.set("n", "zR", require("ufo").openAllFolds, opts)
keymap.set("n", "zM", require("ufo").closeAllFolds, opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window
keymap.set("n", "<Space>", "<C-w>w", opts)
keymap.set("", "s<left>", "<C-w>h", opts)
keymap.set("", "s<up>", "<C-w>k", opts)
keymap.set("", "s<right>", "<C-w>l", opts)
keymap.set("", "s<down>", "<C-w>j", opts)
keymap.set("", "sh", "<C-w>h", opts)
keymap.set("", "sk", "<C-w>k", opts)
keymap.set("", "sl", "<C-w>l", opts)
keymap.set("", "sj", "<C-w>j", opts)

-- Move block
keymap.set("v", "K", ":move'<-2<CR>gv-gv", opts)
keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

-- Toggle nvimtree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Closing buffers and vim
keymap.set("n", "<leader>c", ":bd<Return>", opts)
keymap.set("n", "<leader>q", ":qa<Return>", opts)

-- Saving on insert mode
keymap.set("n", "<C-s>", ":silent w!<Return>", opts)
keymap.set("i", "<C-s>", "<Esc>:silent w!<Return>", opts)

-- Telescope
keymap.set("n", "<leader>fi", ":Telescope grep_string<CR>", opts)
keymap.set("n", "<leader>st", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fr", ":Telescope resume<CR>", opts)

-- Bufferline
keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)
keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })

-- Comment
keymap.set("n", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op()<CR>", opts)
keymap.set("v", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Lspsaga
keymap.set("n", "<leader>vrr", ":Lspsaga finder<CR>", opts)
keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "gl", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
keymap.set("n", "<leader>lr", "<Cmd>Lspsaga rename<CR>", opts)
keymap.set("n", "<leader>va", "<Cmd>Lspsaga finder<CR>", opts)
