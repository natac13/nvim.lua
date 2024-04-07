return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  config = function()
    local ufo = require('ufo')
    ufo.setup({
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end
    })

    vim.opt.foldcolumn = '1'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zA', require('ufo').closeAllFolds)
  end
}
