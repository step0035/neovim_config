-- Modes: n = normal, i = insert, v = visual, x = visual block, t = terminal, c = command

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Normal ───────────────────────────────────────────────────────────────────

-- Window / tmux pane navigation. nvim-tmux-navigation moves seamlessly between
-- nvim splits and tmux panes, so this replaces the plain <C-w>h/j/k/l bindings.
keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", opts)
keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", opts)
keymap("n", "<C-n>", "<Cmd>NvimTmuxNavigateNext<CR>", opts)

-- Clear search highlighting
keymap("n", "<Esc>", "<Cmd>nohlsearch<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers (note: these shadow the builtin L / H / X)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-x>", ":bd<CR>", opts)

-- Open a terminal on the right; use "exit" or Ctrl-d to close it
keymap("n", "<leader>t", ":vs|:te<cr>", opts)

-- Git blame. Set here rather than in git-blame.lua: a `keys` entry there would
-- load the plugin eagerly, which turns blame on at startup.
keymap("n", "<leader>g", "<Cmd>GitBlameToggle<CR>", opts)

-- ── Visual ───────────────────────────────────────────────────────────────────

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste over a selection without clobbering the unnamed register
keymap("v", "p", '"_dP', opts)

-- ── Visual block ─────────────────────────────────────────────────────────────

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ── Terminal ─────────────────────────────────────────────────────────────────

keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", [[<C-\><C-N><C-w>h]], term_opts)
keymap("t", "<C-j>", [[<C-\><C-N><C-w>j]], term_opts)
keymap("t", "<C-k>", [[<C-\><C-N><C-w>k]], term_opts)
keymap("t", "<C-l>", [[<C-\><C-N><C-w>l]], term_opts)
