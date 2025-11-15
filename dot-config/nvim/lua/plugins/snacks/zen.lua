return {
	"snacks.nvim",
	opts = {
		zen = {
			enable = true,
		},
	},
	keys = {
		{
			"<leader>Z",
			function()
				Snacks.zen.zen()
			end,
			desc = "Rename File",
		},
	},
}
