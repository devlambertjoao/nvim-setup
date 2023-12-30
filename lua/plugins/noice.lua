return {
  'folke/noice.nvim',
  event = { 'VeryLazy' },
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('noice').setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {},
        format = {
          cmdline = { pattern = "^:", icon = ">", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "s", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "S", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "lua", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "h" },
          input = {}
        }
      },
      popupmenu = {
        kind_icons = false
      }
    })
  end
}
