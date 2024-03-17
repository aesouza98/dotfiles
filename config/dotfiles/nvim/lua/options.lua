-- Setting termcolors
vim.opt.termguicolors = true

-- Line numbers and Relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs and Indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Text Formatting
vim.opt.wrap = false

-- Undo and Backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50

-- Search Opts
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- File Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Define Mapleader Key
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Highlight Yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Highlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})
