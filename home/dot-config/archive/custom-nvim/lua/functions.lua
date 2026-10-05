function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end

local M = {}
function M.find_files_in_selected_dir()
  local builtin = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  require("telescope").extensions.file_browser.file_browser({
    prompt_title = "Select Directory",
    path = ".",
    select_buffer = true,
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if not selection then return end
        actions.close(prompt_bufnr)
        local dir = selection[1] or selection.path
        if dir then
          builtin.find_files({
            cwd = dir,
            hidden = true,
          })
        end
      end)
      return true
    end,
  })
end

function M.pick_directory_with_fzf()
  local builtin = require("telescope.builtin")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values
  local scan = require("plenary.scandir")

  local home = vim.fn.expand("~")
  local dirs = {}
  scan.scan_dir(home, {
    hidden = true,
    only_dirs = true,
    respect_gitignore = true,
    depth = 5,
    on_insert = function(entry)
      table.insert(dirs, entry)
    end,
  })

  pickers.new({}, {
    prompt_title = "Pick directory (FZF)",
    finder = finders.new_table({ results = dirs }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        local dir = selection[1]
        builtin.find_files({
          cwd = dir,
          hidden = true,
        })
      end)
      return true
    end,
  }):find()
end

return M
