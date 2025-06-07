return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()

    -- Indent guide
    require('mini.indentscope').setup({
      draw = {
        delay = 100, -- Delay in milliseconds before drawing the indent guide
        animation = require('mini.indentscope').gen_animation.none(), -- No animation
      },
      symbol = '│', -- Character used for the indent guide
      options = {
        try_as_border = true, -- Try to use as a border for floating windows
      },
    })

    -- Better buffer removal
    require('mini.bufremove').setup()

    -- Surround actions (like vim-surround)
    require('mini.surround').setup()

    -- Pair matching (like autopairs)
    require('mini.pairs').setup()

    -- Commenting functionality
    require('mini.comment').setup({
      hooks = {
        pre = function()
          -- Disable comment for certain filetypes
          if vim.bo.filetype == 'markdown' or vim.bo.filetype == 'text' then
            return false
          end
        end,
      },
    })

    -- Remove trailing whitespace
    require('mini.trailspace').setup({
      remove_on_save = true,
    })

    -- Move lines or blocks of text
    require('mini.move').setup({
      enable = true,
      speed = 500,
    })

    -- Clue system for hints and tips
    -- require('mini.clue').setup({
    --   clues = {
    --     -- Built-in operators
    --     { mode = 'n', keys = 'd', desc = 'Delete' },
    --     { mode = 'n', keys = 'y', desc = 'Yank' },
    --     { mode = 'n', keys = 'c', desc = 'Change' },
    --
    --     -- Visual mode variants
    --     { mode = 'v', keys = 'd', desc = 'Delete' },
    --     { mode = 'v', keys = 'y', desc = 'Yank' },
    --     { mode = 'v', keys = 'c', desc = 'Change' },
    --
    --     -- Other groups (like g, z, leader) if needed
    --     require('mini.clue').gen_clues.builtin_completion(),
    --     require('mini.clue').gen_clues.g(),
    --     require('mini.clue').gen_clues.marks(),
    --     require('mini.clue').gen_clues.registers(),
    --     require('mini.clue').gen_clues.windows(),
    --     require('mini.clue').gen_clues.z(),
    --   },
    --   triggers = {
    --     -- Add which key prefixes you want hints for
    --     { mode = 'n', keys = 'd' },
    --     { mode = 'n', keys = 'y' },
    --     { mode = 'n', keys = 'c' },
    --     { mode = 'v', keys = 'd' },
    --     { mode = 'v', keys = 'y' },
    --     { mode = 'v', keys = 'c' },
    --
    --     -- Common groups
    --     { mode = 'n', keys = '<Leader>' },
    --     { mode = 'n', keys = 'g' },
    --     { mode = 'n', keys = 'z' },
    --     { mode = 'n', keys = '"' },
    --     { mode = 'n', keys = "'" },
    --     { mode = 'n', keys = '<C-w>' },
    --   },
    -- })

    require('mini.operators').setup({})

    -- Bracket Navigation
    require('mini.bracketed').setup({})

    require('mini.jump').setup({})

    require('mini.colors').setup({})

  end,
}

