local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- [[Normal]] --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Open terminal on the right, use "exit" or "Ctrl-d" to exit terminal
keymap("n", "<leader>t", ":vs|:te<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-x>", ":bd<CR>", opts)

-- Telescope keymaps
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ }))<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)

-- [[Visual]] --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- [[Visual Block]] --
-- Move text up and down in visual block mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- language server
keymap("n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<S-k>", "<cmd> lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "gr", "<cmd> lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "[d", "<cmd> lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
keymap("n", "]d", "<cmd> lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
keymap("n", "gl", "<cmd> lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)
keymap("n", "<leader>q", "<cmd> lua vim.diagnostic.setloclist()<CR>", opts)

-- [[Terminal]] --
-- Better terminal navigation
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", [[<C-\><C-N><C-w>h]], term_opts)
keymap("t", "<C-j>", [[<C-\><C-N><C-w>j]], term_opts)
keymap("t", "<C-k>", [[<C-\><C-N><C-w>k]], term_opts)
keymap("t", "<C-l>", [[<C-\><C-N><C-w>l]], term_opts)
