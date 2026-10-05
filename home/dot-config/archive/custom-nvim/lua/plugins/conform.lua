return {
  'stevearc/conform.nvim',
  opts = {},
  config = function(_, opts)
    require('conform').setup(opts)
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black', 'isort' },
      css = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
      sh = { 'shfmt' },
      yaml = { 'prettier' },
    }

    -- Set up conform to run on save
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave' }, {
      callback = function()
        require('conform').format()
      end,
    })

    -- Keymap to format current buffer
    -- vim.keymap.set('n', '<leader>lf', function()
    --   require('conform').format()
    -- end, { desc = 'Format current file' })
  end,
}
