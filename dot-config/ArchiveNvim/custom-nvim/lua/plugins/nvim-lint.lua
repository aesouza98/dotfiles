return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Define linters by filetype
    lint.linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      yaml = { "yamllint" },
      markdown = { "markdownlint" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
    }

    -- Run linters on save
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
    vim.keymap.set("n", "<leader>ll", function()
      require("lint").try_lint()
    end, { desc = "Lint current file" })

  end,
}

