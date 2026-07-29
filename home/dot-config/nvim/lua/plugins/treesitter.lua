return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = { enable = true },

			-- ensure these languages parsers are installed
			ensure_installed = {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
				},
			},
		})
	end,
}
