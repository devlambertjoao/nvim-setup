return {
  'stevearc/oil.nvim',
  opts = {},
  event = { 'VeryLazy' },
  config = function ()
    require('oil').setup({})
  end
}
