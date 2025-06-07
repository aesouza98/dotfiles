return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GRemove", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
  },
  config = function()
    -- Optional: Custom Fugitive commands or mappings can go here
    -- Example: automatically open :Git when opening Neovim in a git repo
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local git_dir = vim.fn.finddir(".git", ".;")
        if git_dir ~= "" then
          vim.cmd("Git")
        end
      end,
    })
  end,
}

