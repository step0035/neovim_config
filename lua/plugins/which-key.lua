-- which-key was already installed as a cscope_maps dependency but never
-- configured. Declaring it here turns it on, so the desc= labels on the
-- mappings in core/keymaps.lua and plugins/lsp.lua actually show up.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
}
