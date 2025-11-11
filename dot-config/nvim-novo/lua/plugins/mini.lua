return {
	-- Mini Nvim
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- Indent guide
			require("mini.indentscope").setup({
				draw = {
					delay = 100, -- Delay in milliseconds before drawing the indent guide
					animation = require("mini.indentscope").gen_animation.none(), -- No animation
				},
				symbol = "│", -- Character used for the indent guide
				options = {
					try_as_border = true, -- Try to use as a border for floating windows
				},
			})

			-- Better buffer removal
			require("mini.bufremove").setup()

			-- Mini Session
			require("mini.sessions").setup()

			-- Pair matching (like autopairs)
			require("mini.pairs").setup()

			-- Move lines or blocks of text
			require("mini.move").setup({
				enable = true,
				speed = 500,
			})

			require("mini.operators").setup({})

			-- Bracket Navigation
			require("mini.bracketed").setup({})

			require("mini.jump").setup({})

			require("mini.colors").setup({})
		end,
	},
	-- Comments
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- disable the autocommand from ts-context-commentstring
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			require("mini.comment").setup({
				-- tsx, jsx, html , svelte comment support
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = "commentstring",
						}) or vim.bo.commentstring
					end,
				},
			})
		end,
	},
	-- Surround
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 300,

			-- Module mappings. Use `''` (empty string) to disable one.
			-- INFO:
			-- saiw surround with no whitespace
			-- saw surround with whitespace
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			respect_selection_type = false,

			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},
	-- Get rid of whitespace
	{
		"echasnovski/mini.trailspace",
		event = { "BufReadPost", "BufNewFile" },
		remove_on_save = true,
		config = function()
			local miniTrailspace = require("mini.trailspace")

			miniTrailspace.setup({
				only_in_normal_buffers = true,
			})
			vim.keymap.set("n", "<leader>cw", function()
				miniTrailspace.trim()
			end, { desc = "Erase Whitespace" })

			-- Ensure highlight never reappears by removing it on CursorMoved
			vim.api.nvim_create_autocmd("CursorMoved", {
				pattern = "*",
				callback = function()
					require("mini.trailspace").unhighlight()
				end,
			})
		end,
	},
	-- Split & join
	{
		"echasnovski/mini.splitjoin",
		config = function()
			local miniSplitJoin = require("mini.splitjoin")
			miniSplitJoin.setup({
				mappings = { toggle = "" }, -- Disable default mapping
			})
			vim.keymap.set({ "n", "x" }, "sj", function()
				miniSplitJoin.join()
			end, { desc = "Join arguments" })
			vim.keymap.set({ "n", "x" }, "sk", function()
				miniSplitJoin.split()
			end, { desc = "Split arguments" })
		end,
	},
	{
		"echasnovski/mini.files",
		opts = {
			options = {
				use_as_default_explorer = false,
			},
		},
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					close = "q",
					go_in = "<CR>", -- Map both Enter and L to enter directories or open files
					go_in_plus = "L",
					go_out = "<BS>",
					go_out_plus = "H",
					reset = "<C-BS>",
				},
			})
			vim.keymap.set("n", "<leader>Fe", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" }) -- toggle file explorer
			vim.keymap.set("n", "<leader>Ff", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Toggle into currently opened file" })
		end,
	},
}
