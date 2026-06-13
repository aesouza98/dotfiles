return {
	"snacks.nvim",
	opts = {
		git = {
			enable = true,
		},
	},
	keys = {
		{
			"<leader>gBl",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
	},
}
