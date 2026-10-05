local M = {}

function M.open_project_at(path)
  local expanded_path = vim.fn.expand(path)
  vim.cmd.cd(expanded_path)
  require('telescope.builtin').find_files()
end

return M
