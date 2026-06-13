return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},
			formatters_by_ft = {
				python = { "flake8" },
				javascript = { "eslint" },
				typescript = { "eslint" },
				sh = { "shellcheck" },
				css = { "biome-check" },
				html = { "biome-check" },
				json = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier", "markdown-toc" },
				terraform = { "terraform_fmt" },
				nix = { "nixfmt" },
				-- ["markdown.mdx"] = { "prettier", "markdownlint", "markdown-toc" },
			},
			format_on_save = {
			     lsp_fallback = true,
			     async = false,
			     timeout_ms = 1000,
			},
		})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"2",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.shfmt = { prepend_args = { "-i", "4" } }

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format whole file or range" })
	end,
}
