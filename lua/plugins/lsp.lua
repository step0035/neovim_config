require("mason").setup({
  icons = {
    ui = {
      server_installed = "",
      server_pending = "➜",
      server_uninstalled = ""
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "dockerls",
    "jsonls",
    "lua_ls",
    "marksman",
    "pyright",
    "rust_analyzer",
    "svlangserver"
  }
})

require("lspconfig").clangd.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").svlangserver.setup {}
