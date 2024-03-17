-- Dependencies
--require("plugins")
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Run Packer
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

-- Plugins
  -- packer 
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
  })
  use ({
	  'catppuccin/nvim',
	  as = 'catppuccin',
  })

  -- telescope (fuzzy finder)
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter (lsp colors)
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- undotree (undo visually)
  use ('mbbill/undotree')

  -- nvim-tree (explorer)
  use ('nvim-tree/nvim-tree.lua')

  -- fugitive
  use ('tpope/vim-fugitive')

  use ('williamboman/mason.nvim')
  use ('williamboman/mason-lspconfig.nvim')

  -- LSPZero (Setup LSP)
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

-- Tabs (Buffer bar)
use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
use 'romgrk/barbar.nvim'

-- LuaLine (status bar)
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- Startup
use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup()
  end
}

-- Which Key
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
    }
  end
}

end)
