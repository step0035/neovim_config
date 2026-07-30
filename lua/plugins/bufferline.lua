return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      numbers = "none", -- "ordinal" | "buffer_id" | "both" | function
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,

      indicator = { icon = "▎", style = "icon" },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",

      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,

      diagnostics = false, -- "nvim_lsp" | "coc"
      diagnostics_update_in_insert = false,

      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- keep custom buffer sort order
      separator_style = "thin",   -- "slant" | "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
  },
}
