return {
  'xiyaowong/transparent.nvim',
  event = { 'BufRead' },
  config = function()
    -- TODO: Add transparency to telescope, and sign column "at left"
    require('transparent').setup({})
    vim.cmd[[ TransparentEnable ]]
  end
}
