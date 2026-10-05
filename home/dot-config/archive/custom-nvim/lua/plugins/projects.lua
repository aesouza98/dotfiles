return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = true,
  },
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    local history = require("project_nvim.utils.history")
    history.delete_project = function(project)
      for k, v in pairs(history.recent_projects) do
        if v == project.value then
          history.recent_projects[k] = nil
          return
        end
      end
    end
    pcall(function()
      require("telescope").load_extension("projects")
    end)

  end,
}
