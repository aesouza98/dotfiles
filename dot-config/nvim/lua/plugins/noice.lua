return {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
  config = function()
    require('noice').setup({
      lsp = {
        progress = { enabled = true },
        signature = { enabled = true },
        hover = { enabled = true },
      },
      messages = {
        enabled = true, -- capture :w written, etc.
      },
      cmdline = {
        enabled = true, -- floating command line
      },
      popupmenu = {
        enabled = true, -- better wildmenu / completion
      },
      presets = {
        bottom_search = true, -- keep / and ? at the bottom
        command_palette = true, -- center command line in splits
        lsp_doc_border = true, -- add border to hover/signature
      },
    })
  end,
}

