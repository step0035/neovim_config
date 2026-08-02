-- Seamless <C-h/j/k/l> between Neovim splits and herdr panes.
--
-- From paulbkim-dev/vim-herdr-navigation (editor/nvim.lua), with the tmux
-- fallback adapted: upstream calls christoomey's TmuxNavigate<Dir>, but this
-- config uses alexghergh/nvim-tmux-navigation, whose commands are
-- NvimTmuxNavigate<Dir>.
--
-- Lives in after/plugin/ so it loads last and wins over the <C-h/j/k/l> maps
-- set in lua/core/keymaps.lua. Those maps stay in place as the tmux-only path;
-- this file supersedes them whenever nvim is running inside a herdr pane.
--
-- Behaviour: move within nvim splits; at a split edge, cross into the
-- neighbouring herdr pane (or tmux pane when $TMUX is set instead).

local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then
    return -- moved within Neovim
  end

  -- At a split edge: cross into the surrounding multiplexer.
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH
    if herdr == nil or herdr == "" then
      herdr = "herdr"
    end
    -- Target this pane explicitly: --current resolves to the server's globally
    -- focused pane, which is not necessarily the one we are in.
    vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--pane", vim.env.HERDR_PANE_ID })
  elseif vim.env.TMUX and vim.env.TMUX ~= "" then
    local suffix = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "NvimTmuxNavigate" .. suffix[dir])
  end
end

local function map(lhs, wincmd, dir, desc)
  vim.keymap.set("n", lhs, function()
    nav(wincmd, dir)
  end, { silent = true, noremap = true, desc = desc })
end

map("<C-h>", "h", "left", "Navigate left (vim/herdr)")
map("<C-j>", "j", "down", "Navigate down (vim/herdr)")
map("<C-k>", "k", "up", "Navigate up (vim/herdr)")
map("<C-l>", "l", "right", "Navigate right (vim/herdr)")
