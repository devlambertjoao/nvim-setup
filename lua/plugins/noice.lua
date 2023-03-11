return {
  'folke/noice.nvim',
  event = { 'BufRead' },
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('noice').setup({
      cmdline = {
        format = {
          cmdline = { pattern = "^:", icon = ">_", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "v", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "^", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = "^:%s*lua%s+", icon = "lua", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
          input = {}, -- Used by input()
        },
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
        },
      },
      health = {
        checker = false, -- Disable if you don't want health checks to run
      },
    })
  end
}
