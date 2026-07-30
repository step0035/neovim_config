return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Pinned to v1: mason 2.x / mason-lspconfig 2.x are a breaking rewrite
    -- (setup_handlers removed, ensure_installed semantics changed).
    { "williamboman/mason.nvim", version = "^1" },
    { "williamboman/mason-lspconfig.nvim", version = "^1" },
    "hrsh7th/cmp-nvim-lsp", -- so servers can advertise cmp's capabilities
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Tell servers what nvim-cmp can handle (snippets, extra completion item
    -- properties). Without this they fall back to the minimal defaults.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      -- servers for mason to install
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pyright",
        "dockerls",
        "marksman",
        "verible",
      },
    })

    -- NOTE: this swallows all LSP diagnostics for every server below. It is
    -- deliberate, but it also means the [d / ]d / gl / <leader>q mappings at the
    -- bottom of this file have nothing to act on. Drop this to get them back.
    local function silence_diagnostics() end

    -- Per-server overrides; every server gets the diagnostics handler above.
    local servers = {
      clangd = {
        -- don't grey out inactive code
        on_attach = function(client, _)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      },
      lua_ls = {},
      pyright = {},
      dockerls = {},
      marksman = {},
      verible = {
        root_dir = function(fname)
          -- fall back to the file's own directory if there's no git root
          return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
        end,
      },
    }

    for server, config in pairs(servers) do
      config.handlers = { ["textDocument/publishDiagnostics"] = silence_diagnostics }
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end

    -- ── Keymaps ──────────────────────────────────────────────────────────────
    local opts = { noremap = true, silent = true }
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    map("gD", vim.lsp.buf.declaration, "LSP: go to declaration")
    map("gd", vim.lsp.buf.definition, "LSP: go to definition")
    map("gi", vim.lsp.buf.implementation, "LSP: go to implementation")
    map("gr", vim.lsp.buf.references, "LSP: references")
    map("K", vim.lsp.buf.hover, "LSP: hover")
    map("gs", vim.lsp.buf.signature_help, "LSP: signature help")

    map("[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, "Diagnostics: previous")
    map("]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, "Diagnostics: next")
    map("gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, "Diagnostics: show line")
    map("<leader>q", vim.diagnostic.setloclist, "Diagnostics: to loclist")
  end,
}
