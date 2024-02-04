return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    -- keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
  end

}
