local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	folding = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	context_commentstring = {
		enable = true,
	},
	ensure_installed = {
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"graphql",
		"markdown",
		"markdown_inline",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
		"typescript",
		"javascript",
		"prisma",
	},
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername =
	{ "javascript", "typescript.tsx", "typescript", "javascript.jsx", "typescriptreact", "graphql" }
