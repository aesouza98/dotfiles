return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
            },
        })
        vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "File Explorer"})
    end
}
