return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({})
    vim.opt.termguicolors = true

    local keymap = vim.keymap.set

    keymap("n", "<A-x>", ":bd<CR>", { desc = "Close buffer", silent = true })
    keymap("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer", silent = true })

    keymap("n", "<A-p>", ":BufferLinePick<CR>", { desc = "Pick buffer", silent = true })

    for i = 1, 9 do
      keymap("n", "<A-" .. i .. ">", ":BufferLineGoToBuffer " .. i .. "<CR>", {
        desc = "Go to buffer " .. i,
        silent = true,
    })
    end
  end,
}
