local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  -- git repos for the plugin will be cloned into ~/.local/share/nvim/site/pack/packer/start

  use "wbthomason/packer.nvim" -- Have packer manage itself

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
    config = [[ require('plugins/nvim-tree') ]]
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[ require("plugins/treesitter") ]]
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = [[ require("plugins/telescope") ]]
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = [[ require("plugins/bufferline") ]]
  }

  use {
    "onsails/lspkind-nvim",
    config = [[ require("plugins/lspkind") ]]
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
      "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
      "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
      "hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
      "saadparwaiz1/cmp_luasnip" -- luasnip completion source for nvim-cmp
    },
    config = [[ require("plugins/cmp") ]]
  }

  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = [[ require("plugins/lsp") ]]
  }

  use {
    "catppuccin/nvim", as = "catppuccin",
    config = [[ require("plugins/catppuccin") ]]
  }

  use {
    "dhananjaylatkar/cscope_maps.nvim",
    requires = {
      "folke/which-key.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = [[ require("plugins/cscope_maps") ]]
  }

  use {
    "akinsho/toggleterm.nvim",
    config = [[ require("plugins/toggleterm") ]]
  }

  use {
    "windwp/nvim-autopairs",
    config = [[ require("plugins/nvim-autopairs") ]]
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
