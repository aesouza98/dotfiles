return {
  "iamcco/markdown-preview.nvim",
  -- Lazy load on command so it doesn't slow startup
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

  -- Build step: install required dependencies automatically
  build = function()
    vim.fn["mkdp#util#install"]()
  end,

  -- Optional keybinding for toggle (can be changed)
  keys = {
    {
      "<leader>cp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Toggle Markdown Preview",
      mode = { "n", "v" },
    },
  },

  config = function()
    -- Force reload filetype detection to enable preview properly
    vim.cmd([[do FileType]])
  end,
}

