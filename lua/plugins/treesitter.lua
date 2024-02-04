return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = "all",
        indent = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        }
      })
    end
  }
}
