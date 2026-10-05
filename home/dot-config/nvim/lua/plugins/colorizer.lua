return {
	"NvChad/nvim-colorizer.lua",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {},
	config = function()
		local nvchadcolorizer = require("colorizer")

		nvchadcolorizer.setup({
			user_default_options = {
				names = false,
			},
		})

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
			callback = function()
				vim.cmd("ColorizerAttachToBuffer")
			end,
		})
	end,
}
