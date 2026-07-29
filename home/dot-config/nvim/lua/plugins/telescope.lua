return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"andrew-george/telescope-themes",
		},
		keys = {
			{ "<leader>Ut", "<cmd>Telescope themes<cr>", desc = "Change Theme" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<C-j>"] = require("telescope.actions").move_selection_next,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					themes = {
						enable_previewer = true,
						enable_live_preview = true,
						persist = {
							enabled = true,
							path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("themes")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},
}
