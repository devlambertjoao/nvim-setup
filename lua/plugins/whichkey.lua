return {
  'folke/which-key.nvim',
  keys = { '<leader>', '<C-w>' },
  cmd = 'WhichKey',
  config = function()
    local whichkey = require('which-key')

    vim.o.timeout = true
    vim.o.timeoutlen = 150

    whichkey.setup({
      icons = {
        breadcrumb = ">",
        separator = "|",
        group = "+",
      },
      window = {
        border = 'single',
        position = 'bottom',
        margin = { 2, 2, 2, 2 },
        padding = { 4, 4, 4, 4 },
        winbled = 0
      },
      layout = {
        height = { min = 40, max = 50 },
        width = { min = 4, max = 50 },
        spacing = 0,
        align = 'center'
      },
    })

    whichkey.register({
      f = {
        name = 'File Navigation',
        o = { '<cmd>Oil<CR>', 'Oil' }
      }
    }, { prefix = '<leader>' })

    whichkey.register({ prefix = "<C-w>" })
  end

}
