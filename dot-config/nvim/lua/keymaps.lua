local keymap = vim.keymap

-- Exit insert mode
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- keymap.set("i", "kk", "<ESC>", { desc = "Exit insert mode with kk" })
-- keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Increment/Decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Lazy
keymap.set('n', '<leader>Ls', '<cmd>Lazy sync<CR>', { desc = "Reload Plugins" })

-- Dashboard
keymap.set('n', '<leader>h', ':Alpha<CR>', { noremap = true, silent = true })


-- Functions
vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>lua ReloadConfig()<CR>', { noremap = true, silent = true })

