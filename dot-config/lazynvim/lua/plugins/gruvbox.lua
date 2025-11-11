return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      operators = true,
      comments = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
  end,
}
