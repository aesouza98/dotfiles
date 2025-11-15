return {
	"snacks.nvim",
	opts = {
		picker = {
			enable = true,
		},
	},
	keys = {
		-- NOTE: Find Files - ff
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files in current directory",
		},
		-- NOTE: Open Buffers - fb
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Navigate through open buffers",
		},
		-- NOTE: Git Files - gf
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Navigate through Git Files",
		},
		-- NOTE: Git Log - gl
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Navigate through open buffers",
		},
		-- NOTE: Smart Find Files - space space
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		-- NOTE: Grep Files - /
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Files",
		},
		-- NOTE: Find git branches - gb
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Find Git Branches",
		},
		-- NOTE: Find Projects - fp
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
	},
}
