return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
		},
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
          ["core.highlights"] = {},
          ["core.journal"] = {
            config = {
              journal_folder = "journal",
              use_journal_dates = true,
            },
          },
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.summary"] = {},
					["core.integrations.telescope"] = {},
					["core.integrations.treesitter"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})

      -- Keybindings
      vim.keymap.set("n", "<leader>nn", "<Cmd>Neorg index<CR>", { desc = "[n]eorg [n]otes" })
      vim.keymap.set("n", "<leader>nw", "<Cmd>Telescope neorg switch_workspace<CR>", { desc = "[n]eorg [w]orkspace" })
      vim.keymap.set("n", "<leader>nL", "<Cmd>Telescope neorg insert_file_link<CR>", { desc = "[n]eorg [L]inks" })
      vim.keymap.set("n", "<leader>nl", "<Cmd>Telescope neorg find_linkable<CR>", { desc = "[n]eorg [l]inkable" })
      vim.keymap.set("n", "<leader>nf", "<Cmd>Telescope neorg find_norg_files<CR>", { desc = "[n]eorg [f]iles" })
      vim.keymap.set("n", "<leader>nj", "<Cmd>Neorg journal today<CR>", { desc = "[n]eorg [j]ournal" })
      vim.keymap.set("n", "<leader>nJ", "<Cmd>Neorg journal toc<CR>", { desc = "[n]eorg [J]ournal" })
      vim.keymap.set("n", "<leader>nh", "<Plug>(neorg.telescope.search_headings)", { desc = "[n]eorg [h]eadings" })
      vim.keymap.set("n", "<leader>n]h", "<Plug>(neorg.treesitter.next.heading)", { desc = "[n]eorg next [h]eading" })
      vim.keymap.set("n", "<leader>n[h", "<Plug>(neorg.treesitter.previous.heading)", { desc = "[n]eorg previous [h]eading" })

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
}
