local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	highlights = {
		-- separator = { fg = "#073642", bg = "#002b36" },
		-- separator_selected = { fg = "#073642" },
		background = { fg = "#657b83" },
		buffer_selected = { fg = "#fdf6e3" },
		buffer_visible = { fg = "#fdf6e3" },
		-- fill = { bg = "#073642" },
	},
	options = {
		active = true,
		keymap = {
			normal_mode = {},
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
		sort_by = "insert_after_current",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "packer",
				text = "Packer",
				highlight = "PanelHeading",
				padding = 1,
			},
		},
	},
})
