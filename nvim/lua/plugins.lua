local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installer")
end

vim.cmd [[packadd packer.nvim]]

function _G.get_runtime_dir()
  local lvim_runtime_dir = os.getenv "LUNARVIM_RUNTIME_DIR"
  if not lvim_runtime_dir then
    -- when nvim is used directly
    return vim.call("stdpath", "data")
  end
  return lvim_runtime_dir
end

packer.startup({ function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'hoob3rt/lualine.nvim' --Statusline use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- LspInstall
  use 'williamboman/mason-lspconfig.nvim' -- LspInstall
  use 'akinsho/nvim-bufferline.lua' -- Bufferline lol
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Syntax highlighting
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  } -- Project selection through telescope
  use 'windwp/nvim-autopairs' -- Autopairs like () {} ""
  use 'windwp/nvim-ts-autotag' -- Autotags like <div></div>
  use 'nvim-telescope/telescope.nvim' -- Find files, grep text
  use {
    'numToStr/Comment.nvim',
    commit = "fe9bbdbcd2f1b85cc8fccead68122873d94f8397",
    config = function()
      require('Comment').setup()
    end
  } -- Commenting
  -- use 'github/copilot.vim'
  use { 'saadparwaiz1/cmp_luasnip' }
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup({
  --         cmp = {
  --           enabled = true,
  --           method = "getCompletionsCycling",
  --         }
  --       })
  --     end, 100)
  --   end,
  -- } -- Lua engine for copilot
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   module = "copilot_cmp",
  -- } -- Make copilot suggestions appear on nvim-vmp
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'nvim-lua/plenary.nvim' -- Common lua utilities
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Needed to make multi line commenting work on React code
  use 'MunifTanjim/prettier.nvim' -- Code formatting
  use 'norcalli/nvim-colorizer.lua' -- Code colorizing like #0000ff
  use 'folke/tokyonight.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  } -- Takuya's favorite colorscheme
  use 'gruvbox-community/gruvbox' -- Gruvbox colorscheme
  use {
    "rafamadriz/friendly-snippets",
    commit = "b2446100d9f6609526cf1839b4ce3dc1ff07ada0"

  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  } -- Navigation tree
end })
