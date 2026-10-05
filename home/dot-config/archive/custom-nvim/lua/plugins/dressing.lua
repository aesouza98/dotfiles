return {
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "gd", function()
        builtin.lsp_definitions({ reuse_win = true })
      end, { desc = "Goto Definition" })

      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "References" })

      vim.keymap.set("n", "gI", function()
        builtin.lsp_implementations({ reuse_win = true })
      end, { desc = "Goto Implementation" })

      vim.keymap.set("n", "gy", function()
        builtin.lsp_type_definitions({ reuse_win = true })
      end, { desc = "Goto Type Definition" })
    end,
  },
}

