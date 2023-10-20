local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- Do not yank with X
keymap.set("n", "x", '"_x', opts)
-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)
keymap.set({ "n", "v" }, "$", "g_", { desc = "Better $, behaves as expected" })
keymap.set("n", "zR", require("ufo").openAllFolds, opts)
keymap.set("n", "zM", require("ufo").closeAllFolds, opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
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

-- Toggle NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Closing buffers and vim
keymap.set("n", "<leader>c", ":bd<Return>", opts)
keymap.set("n", "<leader>q", ":qa<Return>", opts)

-- Saving on insert mode
keymap.set("n", "<C-s>", ":w!<Return>", opts)
keymap.set("i", "<C-s>", "<Esc>:w<Return>", opts)

-- Telescope projects
keymap.set("n", "<leader><S-p>", ":Telescope projects<CR>", opts)
keymap.set("n", "<leader>st", ":Telescope live_grep<CR>", opts)

-- Telescope
keymap.set("n", "<leader>fi", ":Telescope grep_string<CR>", opts)

-- Bufferline
keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opts)
keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>", opts)

-- Comment
keymap.set("n", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op()<CR>", opts)
keymap.set("v", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Lspsaga
keymap.set("n", "<leader>vrr", ":Lspsaga finder<CR>", opts)
