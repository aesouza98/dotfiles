return {
	"snacks.nvim",
	opts = {
		explorer = {
			enable = true,
			replace_netrw = true,
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer.open()
			end,
			desc = "File Explorer",
		},
	},
}
