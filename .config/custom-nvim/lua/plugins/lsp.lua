return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      -- Install LSP servers easily
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Optional nice UI for LSP progress
      { "j-hui/fidget.nvim", opts = {} },

      -- Autocompletion bridge (required for nvim-cmp + lsp)
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      -- Setup Mason (optional but recommended)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "yamlls",
          "jsonls",
          "cssls",
          "pyright",
          "marksman",
          "lua_ls",
        },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Common on_attach function
      local function on_attach(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gi", vim.lsp.buf.implementation, "Goto Implementation")
        map("gr", vim.lsp.buf.references, "References")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
        map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
        map("<leader>e", vim.diagnostic.open_float, "Diagnostics Float")
        map("<leader>q", vim.diagnostic.setloclist, "Quickfix Diagnostics")
      end

      -- 🔥 Language Servers Config
      local servers = {
        bashls = {},
        yamlls = {
          settings = {
            yaml = { keyOrdering = false },
          },
        },
        jsonls = {},
        cssls = {},
        pyright = {},
        marksman = {}, -- Markdown
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = config.settings,
        })
      end
    end,
  },
}

