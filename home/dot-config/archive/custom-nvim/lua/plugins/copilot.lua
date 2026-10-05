return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })
    vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot" })
  end,
}
