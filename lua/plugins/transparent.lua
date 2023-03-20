return {
  'xiyaowong/transparent.nvim',
  event = { 'BufRead' },
  config = function()
    require('transparent').setup({})
  end
}
