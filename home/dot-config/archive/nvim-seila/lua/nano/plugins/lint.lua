return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		local eslint = lint.linters.eslint_d

		-- if Eslint error configuration not found : change MasonInstall eslint@version or npm i -g eslint at a specific version
		lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "flake8" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			yaml = { "yamllint" },
			markdown = { "prettier", "markdown-toc" },
			sh = { "shellcheck" },
			json = { "jsonlint" },
		}

		eslint.args = {
			"--no-warn-ignored",
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.fn.expand("%:p")
			end,
		}

		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		-- 	group = lint_augroup,
		-- 	callback = function()
		-- 		lint.try_lint()
		-- 	end,
		-- })

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
