return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local map = vim.api.nvim_set_keymap

    -- Move to previous/next
    map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Go to previous buffer" })
    map("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Go to next buffer" })

    -- Re-order to previous/next
    map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer to previous" })
    map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer to next" })

    -- Goto buffer in position...
    map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
    map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
    map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
    map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
    map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { desc = "Go to buffer 5" })
    map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { desc = "Go to buffer 6" })
    map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { desc = "Go to buffer 7" })
    map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { desc = "Go to buffer 8" })
    map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { desc = "Go to buffer 9" })
    map("n", "<A-0>", "<Cmd>BufferLast<CR>", { desc = "Go to last buffer" })

    -- Pin/unpin buffer
    map("n", "<A-p>", "<Cmd>BufferPin<CR>", { desc = "Pin/Unpin current buffer" })
    -- Close buffer
    map("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close current buffer" })
    -- Buffer picker
    map("n", "<C-p>", "<Cmd>BufferPick<CR>", { desc = "Open buffer picker" })
  end,
}
