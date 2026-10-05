return {
	"snacks.nvim",
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
