return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },  -- load on file open
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
    signcolumn = true,  -- show signs in sign column
    numhl      = false, -- disable line number highlights
    linehl     = false, -- disable line highlight
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- toggle with `:Gitsigns toggle_current_line_blame`
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    update_debounce = 100,
    status_formatter = nil, -- use default
  },
  keys = {
    { "]c", function() require("gitsigns").next_hunk() end, desc = "Next Git Hunk" },
    { "[c", function() require("gitsigns").prev_hunk() end, desc = "Previous Git Hunk" },
    { "<leader>Hs", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk" },
    { "<leader>Hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo Stage Hunk" },
    { "<leader>Hr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk" },
    { "<leader>Hp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
    { "<leader>Hb", function() require("gitsigns").blame_line() end, desc = "Blame Line" },
    { "<leader>Ht", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle Current Line Blame" },
  },
}

