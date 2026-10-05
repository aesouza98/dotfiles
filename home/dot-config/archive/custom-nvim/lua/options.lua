local opt = vim.opt
local keymap = vim.keymap
local colorscheme = "catppuccin"

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Setting termcolors
opt.termguicolors = true

-- Line numbers and Relative numbers
opt.nu = true
opt.relativenumber = true

-- Tabs and Indenting
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Cursor Settings
opt.cursorline = true

-- Text Formatting
opt.wrap = false

-- Undo and Backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50

-- Search Opts
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- File Scrolling
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Define Mapleader Key
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Disable netrw (for neo-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Backspace config
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Highlight Yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Highlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- Colorschemes
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    vim.cmd.colorscheme(colorscheme)
  end,
})

vim.diagnostic.config({
  signs = false,           -- disable diagnostic signs
  virtual_text = true,     -- enable virtual text inline
  underline = true,        -- underline error/warning
})

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true     -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99        -- Open most folds by default
vim.o.foldcolumn = "0"
