return {
  "nvimtools/none-ls.nvim",
  -- dependencies = {
  --   "jay-babu/mason-null-ls.nvim",
  -- },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
      },
    })
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with LSP" })
  end,
}
