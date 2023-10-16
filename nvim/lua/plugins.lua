local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installer")
end

vim.cmd([[packadd packer.nvim]])

function _G.get_runtime_dir()
	local lvim_runtime_dir = os.getenv("LUNARVIM_RUNTIME_DIR")
	if not lvim_runtime_dir then
		-- when nvim is used directly
		return vim.call("stdpath", "data")
	end
	return lvim_runtime_dir
end

packer.startup({
	function(use)
		use({ "catppuccin/nvim", as = "catppuccin" })
		use({ "nvim-tree/nvim-web-devicons" })
		use("wbthomason/packer.nvim") -- Plugin manager
		use({ "sainnhe/everforest", as = "everforest" })
		use({ "nvim-lualine/lualine.nvim" })
		use({
			"nvimdev/lspsaga.nvim",
			after = "nvim-lspconfig",
		})

		use({ "mhartington/formatter.nvim", as = "formatter" })
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
		})
		use({
			"VonHeikemen/lsp-zero.nvim",
			branch = "v1.x",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
		use("akinsho/nvim-bufferline.lua") -- Bufferline lol
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		}) -- Project selection through telescope
		use("windwp/nvim-autopairs") -- Autopairs like () {} ""
		use("windwp/nvim-ts-autotag") -- Autotags like <div></div>
		use("nvim-telescope/telescope.nvim") -- Find files, grep text
		use({
			"numToStr/Comment.nvim",
			commit = "fe9bbdbcd2f1b85cc8fccead68122873d94f8397",
			config = function()
				require("Comment").setup()
			end,
		}) -- Commenting
		use("kabouzeid/nvim-lspinstall")
		use("nvim-lua/plenary.nvim") -- Common lua utilities
		use("JoosepAlviste/nvim-ts-context-commentstring") -- Needed to make multi line commenting work on React code
		use("MunifTanjim/prettier.nvim") -- Code formatting
		use("norcalli/nvim-colorizer.lua") -- Code colorizing like #0000ff
		use("folke/tokyonight.nvim")
		use({
			"svrana/neosolarized.nvim",
			requires = { "tjdevries/colorbuddy.nvim" },
		}) -- Takuya's favorite colorscheme
		use("gruvbox-community/gruvbox") -- Gruvbox colorscheme
		-- Navigation tree
		use({
			"kyazdani42/nvim-tree.lua",
			commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icons
			},
		})
	end,
})
