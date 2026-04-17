return {
  "stevearc/conform.nvim",
  opts = {
    -- format_on_save = {
    --   timeout_ms = 2000,
    --   lsp_fallback = true,
    -- },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      nix = { "alejandra" },
      terraform = { "terraform_fmt" },
      sql = { "sqlfluff" },
      dockerfile = { "prettier" },
      ansible = { "prettier" },
      kdl = {},
    },
  },
}


