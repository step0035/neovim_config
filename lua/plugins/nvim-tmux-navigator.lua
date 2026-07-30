return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true, -- defaults to false
    })
    -- Keymaps live in lua/core/keymaps.lua alongside the other navigation
    -- bindings, so all six <C-…> mappings are defined in one place.
  end,
}
