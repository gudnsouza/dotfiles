local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  highlights = {
    -- separator = { guifg = '#073642', guibg = '#002b36', }, separator_selected = { guifg = '#073642', },
    -- background = { guifg = '#657b83', guibg = '#002b36' },
    -- buffer_selected = { guifg = '#fdf6e3', gui = "bold", },
    -- buffer_visible = { guifg = '#fdf6e3', },
    -- fill = { guibg = '#073642' }
  },
  options = {
  active = true,
  keymap = {
    normal_mode = {},
  },
    show_buffer_close_icons = false,
    show_close_icon = false,
    -- sort_by = 'insert_after_current',
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

vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
