return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      python = { "ruff" },
      yaml = { "yamllint" },
      terraform = { "tflint" },
      ansible = { "ansible_lint" },
      dockerfile = { "hadolint" },
      markdown = { "markdownlint" },
      sql = { "sqlfluff" },
      nix = {},
      json = {},
      lua = {},
      kdl = {},
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}

