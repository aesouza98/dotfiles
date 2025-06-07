return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.o.showmode = false
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        disabled_filetypes = {
          statusline = { "alpha", "neo-tree", "lazy" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress", "location" },
        lualine_z = {
          function()
            return os.date(" %H:%M:%S")
          end,
        },
      },
    })
  end,
}
