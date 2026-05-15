return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Diagnostics appearance
			vim.diagnostic.config({
				float = { border = "rounded" },
				virtual_text = { prefix = "●" },
				severity_sort = true,
			})

			-- Borders for LSP popups
			local border = "rounded"
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			-- Capabilities (for completion)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common keymaps for all LSPs
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				local map = vim.keymap.set
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "gi", vim.lsp.buf.implementation, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			-- Define your servers and any custom settings
			local servers = {
				bashls = {},
				pyright = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
				yamlls = {
					settings = {
						yaml = { keyOrdering = false },
					},
				},
				jsonls = {},
				terraformls = {},
				nil_ls = {},
				dockerls = {},
				ansiblels = {},
				sqls = {},
				marksman = {},
			}

			-- Setup each LSP manually
			for name, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				config.handlers = handlers
				lspconfig[name].setup(config)
			end
		end,
	},
}
