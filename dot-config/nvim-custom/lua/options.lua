local opt = vim.opt

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

-- Disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Backspace config
optbackspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard = 'unnamedplus'

-- Highlight Yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Highlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})
