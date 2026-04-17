return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local servers = {
        bashls = {},
        pyright = {},
        lua_ls = {},
        yamlls = {},
        jsonls = {},
        terraformls = {},
        nil_ls = {},
        dockerls = {},
        ansiblels = {},
        sqls = {},
        marksman = {},
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      for name, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[name].setup(config)
      end
    end,
  },
}

