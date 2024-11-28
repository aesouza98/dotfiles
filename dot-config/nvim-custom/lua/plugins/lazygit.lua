return {
  "kdheepak/lazygit.nvim",
  lazy = true, -- Lazy load the plugin
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency for lazygit
  },
  keys = {
    { "<leader>G", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  },
  config = function()
    -- Optional: You can include additional LazyGit setup here if needed
  end,
}

