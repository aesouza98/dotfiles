return {
	"snacks.nvim",
	opts = {
		rename = {
			enable = true,
		},
	},
	keys = {
		{
			"<leader>Rn",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
	},
}
