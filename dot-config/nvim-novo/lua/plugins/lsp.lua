return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp", -- for completion capabilities
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = {
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
				},
			})

			-- Diagnostic appearance
			vim.diagnostic.config({
				float = { border = "rounded" },
				virtual_text = { prefix = "●" },
				severity_sort = true,
			})

			-- Borders around LSP popups
			local _border = "rounded"
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border }),
			}

			-- Capabilities (for nvim-cmp)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common on_attach (keymaps, etc.)
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				local map = vim.keymap.set
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map("n", "gi", vim.lsp.buf.implementation, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end

			-- Server-specific configs
			local servers = {
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
						yaml = {
							keyOrdering = false,
						},
					},
				},
			}

			-- mason_lspconfig.setup_handlers({
			-- 	function(server_name)
			-- 		local config = servers[server_name] or {}
			-- 		config.capabilities = capabilities
			-- 		config.on_attach = on_attach
			-- 		config.handlers = handlers
			-- 		lspconfig[server_name].setup(config)
			-- 	end,
			-- })
		end,
	},
}
