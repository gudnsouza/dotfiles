
local lsp = require("lsp-zero").preset({})


lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'tailwindcss'
})



-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--
-- vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga diagostic_jump_prev<CR>', opts)
-- vim.keymap.set('i', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- vim.keymap.set('n', 'lr', '<Cmd>Lspsaga rename<CR>', opts)
--
-- end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
