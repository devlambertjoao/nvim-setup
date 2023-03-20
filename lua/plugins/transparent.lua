return {
  'xiyaowong/transparent.nvim',
  event = { 'BufRead' },
  config = function()
    require('transparent').setup({})
    vim.cmd[[ TransparentEnable ]]
  end
}
