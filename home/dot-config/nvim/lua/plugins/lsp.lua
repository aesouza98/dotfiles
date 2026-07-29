return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Diagnostics appearance
			vim.diagnostic.config({
				float = { border = "rounded" },
				virtual_text = { prefix = "●" },
				severity_sort = true,
			})

			-- Capabilities (for completion)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common keymaps for all LSPs
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				local map = vim.keymap.set
				map("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
				map("n", "<C-k>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, opts)
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "gi", vim.lsp.buf.implementation, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				-- <leader>cf is handled by conform.nvim
			end

			-- Global config applied to all servers
			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Per-server overrides (only what differs from defaults)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = { keyOrdering = false },
				},
			})

			-- Enable servers (nvim-lspconfig provides the cmd/filetypes/root_dir defaults)
			vim.lsp.enable({
				"bashls",
				"pyright",
				"lua_ls",
				"yamlls",
				"jsonls",
				"terraformls",
				"nil_ls",
				"dockerls",
				"ansiblels",
				"sqls",
				"marksman",
			})
		end,
	},
}
