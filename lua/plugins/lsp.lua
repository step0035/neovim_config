return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup()

    lspconfig.clangd.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })

    lspconfig.lua_ls.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })

    lspconfig.pyright.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })

    lspconfig.dockerls.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })

    lspconfig.marksman.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })

    -- keymaps
    local keymap = vim.keymap
    keymap.set("n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
    keymap.set("n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", opts)
    keymap.set("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<S-k>", "<cmd> lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap.set("n", "gr", "<cmd> lua vim.lsp.buf.references()<CR>", opts)
    keymap.set("n", "[d", "<cmd> lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
    keymap.set("n", "]d", "<cmd> lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
    keymap.set("n", "gl", "<cmd> lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)
    keymap.set("n", "<leader>q", "<cmd> lua vim.diagnostic.setloclist()<CR>", opts)
  end
}
