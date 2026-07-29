local M = {}

function M.open_project_at(path)
  local expanded_path = vim.fn.expand(path)
  vim.cmd.cd(expanded_path)
  require('telescope.builtin').find_files()
end

function ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match("^opts") or name:match("^plugins") or name:match("^colorscheme") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end

return M
