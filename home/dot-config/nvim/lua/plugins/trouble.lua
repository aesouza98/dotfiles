return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle workspace diagnostics" },
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "TODOs (from todo-comments)" },
	},
	opts = {
		focus = true,
		auto_preview = false, -- avoids annoying popups when moving through list
		use_diagnostic_signs = true, -- uses your LSP diagnostic signs
		modes = {
			diagnostics = {
				auto_open = false,
				auto_close = false,
				win = { size = 0.3 }, -- 30% of screen height
			},
			todo = {
				mode = "todo",
				preview = { type = "none" },
			},
		},
	},
}
