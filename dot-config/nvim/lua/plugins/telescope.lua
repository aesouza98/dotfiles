return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"andrew-george/telescope-themes",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.setup({
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

			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			}
			-- TODO: Add Lazynvim Keymaps
			-- Keymaps:
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy Find Files" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Fuzzy Find Git Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Navigate through buffers" })
			vim.keymap.set("n", "<leader>fB", builtin.git_branches, { desc = "Branches of current Repo" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help commands" })
			vim.keymap.set("n", "<leader>fd", function()
				builtin.find_files({
					find_command = { "fd", "--type", "d", "--hidden", "--no-ignore" },
					prompt_title = " Find Directories",
				})
			end, { desc = "Find Directories" })
		end,
		vim.keymap.set("n", "<leader>Ut", "<cmd>Telescope themes<cr>", { desc = "Change Theme" }),
	},
	-- TODO: ver e talvez arrumar o ui-select
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
