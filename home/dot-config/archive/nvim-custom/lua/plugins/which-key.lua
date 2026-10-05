return {
  "folke/which-key.nvim",
  opts = {},
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk = require("which-key")
    wk.register({
      f = {
        name = "Manipulate / Search Files",
      },
    }, { prefix = "<leader>" })
    wk.register({
      g = {
        name = "Git Commands",
      },
    }, { prefix = "<leader>" })
    wk.register({
      s = {
        name = "Split window",
      },
    }, { prefix = "<leader>" })
    wk.register({
      L = {
        name = "Lazy management",
      },
    }, { prefix = "<leader>" })
  end,
}
