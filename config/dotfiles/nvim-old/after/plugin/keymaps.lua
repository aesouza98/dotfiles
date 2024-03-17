vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "File Explorer"})

-- Packer
vim.keymap.set("n", "<leader>Ps", vim.cmd.PackerSync, { desc = "Sync Packer Plugins" })

-- Mason
vim.keymap.set("n", "<leader>mi", vim.cmd.Mason, { desc = "Open Mason Interface" })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy Find Files" })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Fuzzy Find Git Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Navigate through buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help commands" })

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

-- fugitive
vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = "Opens Git Fugitive" })

-- tabs
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { desc = "Go to previous buffer" })
map('n', '<A-.>', '<Cmd>BufferNext<CR>', { desc = "Go to next buffer" })

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { desc = "Move buffer to previous" })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { desc = "Move buffer to next" })

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = "Go to buffer 1" })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = "Go to buffer 2" })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = "Go to buffer 3" })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = "Go to buffer 4" })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = "Go to buffer 5" })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = "Go to buffer 6" })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { desc = "Go to buffer 7" })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { desc = "Go to buffer 8" })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { desc = "Go to buffer 9" })
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { desc = "Go to last buffer" })

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { desc = "Pin/Unpin current buffer" })
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', { desc = "Close current buffer" })
-- Buffer picker
map('n', '<C-p>', '<Cmd>BufferPick<CR>', { desc = "Open buffer picker" })
