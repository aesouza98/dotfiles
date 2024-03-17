local lsp_zero = require('lsp-zero')
require("mason").setup()
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'bashls', 'pylsp', 'yamlls', 'jsonls', 'terraformls', 'marksman', 'dockerls', 'docker_compose_language_service', 'azure_pipelines_ls', 'ansiblels', 'typos_lsp'},
  handlers = {
    lsp_zero.default_setup,
  },
})
