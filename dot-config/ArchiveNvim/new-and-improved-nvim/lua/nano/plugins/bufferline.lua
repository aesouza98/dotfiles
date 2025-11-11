return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				themable = false,
			},
		})
		vim.keymap.set("n", "<A-0>", "<Cmd>buffer #<CR>", { desc = "Go to last buffer" })
		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "[B]uffer [P]ick" })
		vim.keymap.set("n", "<leader>bc", "<Cmd>bd<CR>", { desc = "[B]uffer [C]lose current" })
		vim.keymap.set("n", "<A-c>", "<Cmd>bd<CR>", { desc = "[B]uffer [C]lose current" })
		vim.keymap.set("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
		vim.keymap.set("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
	end,
}
