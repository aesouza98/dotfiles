return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy Find Files" })
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Fuzzy Find Git Files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep files" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Navigate through buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help commands" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function ()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
