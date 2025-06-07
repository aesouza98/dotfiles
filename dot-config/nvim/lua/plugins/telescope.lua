return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy Find Files" })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Fuzzy Find Git Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep files" })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = "Grep files" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Navigate through buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help commands" })
      keys = {
        { "<leader>fp", pick, desc = "Projects" },
      }
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    condition = function()
      equire('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
      vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser,
        { desc = "File Browser" })
      vim.keymap.set("n", "<leader>fp", function()
        require("functions").pick_directory_with_fzf()
      end, { desc = "Find files in picked dir (FZF)" })
    end,
  }
}
