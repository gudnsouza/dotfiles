vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.wo.number = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.confirm = false
vim.opt.backupskip = "/tmp/*,/private/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = "start,eol,indent"
vim.opt.fillchars = "eob: "
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.updatetime = 300 In case I want to use FixCursorHold
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.g.mapleader = " "
-- Undercurl
-- vim.cmd("hi Normal ctermbg=none guibg=none")
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iTerm2 right now

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- vim.cmd([[colorscheme gruvbox]])

-- setup must be called before loading
--
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
--
-- require("catppuccin").setup()
--
-- vim.cmd([[colorscheme catppuccin]])

vim.api.nvim_command("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
-- vim.opt.shortmess:append("c") -- Do not show completion messages in command line
-- vim.opt.shortmess:append("F") -- Do not show file info when editing a file, in the command line
-- vim.opt.shortmess:append("W") -- Do not show "written" in command line when writing
-- vim.opt.shortmess:append("I") -- Do not show intro message when starting Vim

vim.o.shortmess = vim.o.shortmess .. "c" .. "F" .. "W" .. "I"

vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.formatoptions:append({ "r" })
