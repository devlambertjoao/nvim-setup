return {
  'xiyaowong/nvim-transparent',
  lazy = false,
  priority = 900,
  config = function()
    local nvim_transparent = require('transparent')
    nvim_transparent.setup({
      enable = true,
      ignore_linked_group = true,
      extra_groups = {
        "NvimTreeNormal"
      }
    })
  end
}
