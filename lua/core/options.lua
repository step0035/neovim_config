-- :help options

-- ── Files & undo ─────────────────────────────────────────────────────────────
vim.opt.backup = false            -- don't create a backup file
vim.opt.writebackup = false       -- don't back up a file that's open elsewhere
vim.opt.swapfile = false          -- don't create a swapfile
vim.opt.undofile = true           -- persistent undo, kept in stdpath("state")/undo
vim.opt.fileencoding = "utf-8"    -- encoding written to a file

-- ── Editing ──────────────────────────────────────────────────────────────────
vim.opt.clipboard = "unnamedplus" -- use the system clipboard
vim.opt.mouse = ""                -- mouse disabled in all modes
vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.shiftwidth = 4            -- spaces inserted for each indentation
vim.opt.tabstop = 4               -- spaces a tab counts for
vim.opt.smartindent = true        -- smarter autoindenting on new lines
vim.opt.timeoutlen = 1000         -- ms to wait for a mapped sequence to complete
vim.opt.updatetime = 300          -- faster completion (default 4000ms)

-- ── Search ───────────────────────────────────────────────────────────────────
vim.opt.hlsearch = true           -- highlight all matches of the last search
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.smartcase = true          -- ...unless the pattern contains uppercase

-- ── UI ───────────────────────────────────────────────────────────────────────
vim.opt.number = true             -- show line numbers
vim.opt.relativenumber = false    -- absolute, not relative
vim.opt.numberwidth = 4           -- width of the number column (default 4)
vim.opt.signcolumn = "yes"        -- always show it, so text doesn't shift
vim.opt.cursorline = true         -- highlight the current line
vim.opt.cmdheight = 2             -- more room for messages in the command line
vim.opt.showtabline = 2           -- always show the tabline (bufferline)
vim.opt.pumheight = 10            -- popup menu height
vim.opt.conceallevel = 0          -- so `` stays visible in markdown
vim.opt.wrap = true               -- wrap long lines
vim.opt.scrolloff = 8             -- lines of context above/below the cursor
vim.opt.sidescrolloff = 8         -- columns of context left/right
vim.opt.termguicolors = true      -- 24-bit colour
vim.opt.guifont = "monospace:h17" -- font for graphical clients

-- ── Splits ───────────────────────────────────────────────────────────────────
vim.opt.splitbelow = true         -- horizontal splits open below
vim.opt.splitright = true         -- vertical splits open to the right

-- ── Completion ───────────────────────────────────────────────────────────────
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.shortmess:append("c")                   -- don't message about completions

-- ── Misc ─────────────────────────────────────────────────────────────────────
vim.opt.whichwrap:append("<,>,[,],h,l") -- let these keys move across line ends
vim.opt.iskeyword:append("-")           -- treat foo-bar as one word

-- Stop auto-inserting comment leaders on new lines. This has to be an autocmd:
-- setting it once at startup does not stick, because ftplugins set their own
-- formatoptions afterwards and clobber it.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("StripFormatOptions", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
