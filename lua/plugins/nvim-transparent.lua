return {
  'xiyaowong/nvim-transparent',
  event = 'BufRead',
  config = function()
    local nvim_transparent = require('transparent')
    nvim_transparent.setup({
      enable = true,
      ignore_linked_group = true
    })
  end
}
