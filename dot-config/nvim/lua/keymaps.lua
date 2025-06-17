local keymap = vim.keymap
local api = vim.api
local opts = { noremap = true, silent = true }

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Lazy
keymap.set("n", "<leader>Ls", "<cmd>Lazy sync<CR>", { desc = "Reload Plugins" })

-- Dashboard
keymap.set("n", "<leader>h", ":Alpha<CR>", { desc = "Open Dashboard" })

-- Functions
vim.api.nvim_set_keymap("n", "<leader>rc", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = true })

-- Center cursor after down or up
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Copy and Paste
keymap.set("v", "p", '"_dp', opts)
keymap.set("n", "<leader>Y", [["+Y]], opts)
keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- prevent x delete from registering when next paste
keymap.set("n", "x", '"_x', opts)

-- ctrl c as escape cuz Im lazy to reach up to the esc key
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Replace the word cursor is on globally
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fd", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

