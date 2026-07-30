return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>",
      vim.tbl_extend("force", opts, { desc = "Telescope: find files" }))
    vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<cr>",
      vim.tbl_extend("force", opts, { desc = "Telescope: live grep" }))
  end,
}
