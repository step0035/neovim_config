require("nvim-treesitter").setup {
  ensure_installed = "all",

  auto_install = true,

  indent = {
    enable = true
  },

  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "c" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
}
