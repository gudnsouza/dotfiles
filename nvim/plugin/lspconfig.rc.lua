local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


local function format(opts)

  if vim.lsp.buf.format then
    return vim.lsp.buf.format(opts)
  end

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.buf_get_clients(bufnr)
  if opts.filter then
    clients = opts.filter(clients)
  elseif opts.id then
    clients = vim.tbl_filter(function(client)
      return client.id == opts.id
    end, clients)
  elseif opts.name then
    clients = vim.tbl_filter(function(client)
      return client.name == opts.name
    end, clients)
  end
  clients = vim.tbl_filter(function(client)
    return client.supports_method "textDocument/formatting"
  end, clients)
  if #clients == 0 then
    vim.notify_once "[LSP] Format request failed, no matching language servers."
  end
  local timeout_ms = opts.timeout_ms or 1000
  for _, client in pairs(clients) do
    local params = vim.lsp.util.make_formatting_params(opts.formatting_options)
    local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, bufnr)
    if result and result.result then
      vim.lsp.util.apply_text_edits(result.result, bufnr, client.offset_encoding)
    elseif err then
      vim.notify(string.format("[LSP][%s] %s", client.name, err), vim.log.levels.WARN)
    end
  end
end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  if client.server_capabilities.documentHighlightProvider then
    vim.keymap.set('n', 'gh', vim.lsp.buf.document_highlight, { noremap = true, silent = true })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
    })
  end

  -- formatting

  -- The big problem with the buffer switching bullshit was solved by not defining an augroup and using the custom format fn
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function() format(
        { name = 'null-ls', bufnr = bufnr }
      )
    end
  })
end

protocol.CompletionItemKind = {
  '???', -- Text
  '???', -- Method
  '???', -- Function
  '???', -- Constructor
  '???', -- Field
  '???', -- Variable
  '???', -- Class
  '???', -- Interface
  '???', -- Module
  '???', -- Property
  '???', -- Unit
  '???', -- Value
  '???', -- Enum
  '???', -- Keyword
  '???', -- Snippet
  '???', -- Color
  '???', -- File
  '???', -- Reference
  '???', -- Folder
  '???', -- EnumMember
  '???', -- Constant
  '???', -- Struct
  '???', -- Event
  '???', -- Operator
  '???', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
-- nvim_lsp.flow.setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

nvim_lsp.marksman.setup {}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

-- nvim_lsp.sourcekit.setup {
--   on_attach = on_attach,
-- }

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}



nvim_lsp.tailwindcss.setup {}

nvim_lsp.prismals.setup {}



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "???" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "??? ", Warn = "??? ", Hint = "??? ", Info = "??? " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '???'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
