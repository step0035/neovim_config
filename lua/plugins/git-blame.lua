return {
  "f-person/git-blame.nvim",
  event = "VeryLazy", -- load at startup; the <leader>g toggle lives in core/keymaps.lua
  opts = {
    enabled = false, -- start disabled, toggle with <leader>g
    message_template = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
}
