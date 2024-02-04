return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Telescope keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
    -- keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ }))<cr>", opts)
    keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
  end
}
