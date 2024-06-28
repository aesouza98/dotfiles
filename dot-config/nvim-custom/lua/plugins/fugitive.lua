return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Opens Git Fugitive" })
	end,
}
