vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.confirm = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.fillchars = "eob: "
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
-- vim.opt.updatetime = 300 In case I want to use FixCursorHold
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.g.mapleader = " "
-- Undercurl
vim.cmd("hi Normal ctermbg=none guibg=none")




vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iTerm2 right now

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_command("setlocal formatoptions-=c formatoptions-=r formatoptions-=o");


vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I" -- don't show the default intro message
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.formatoptions:append { 'r' }
