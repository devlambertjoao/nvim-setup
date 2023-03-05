return { 'goolord/alpha-nvim',
  lazy = false,
  config = function()
    local alpha = require('alpha')
    local dashboard = require 'alpha.themes.dashboard'

    -- local variables
    local winHeight = vim.fn.winheight(0)

    local banner = {
      'NEOVIM',
    }
    dashboard.section.header.val = banner

    dashboard.section.buttons.val = {
      dashboard.button('p', 'Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', 'Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('f', 'Find text', ':Telescope live_grep <CR>'),
      dashboard.button('b', 'NvimTree', ':NvimTreeOpen<CR>'),
      dashboard.button('l', 'Lazy', ':Lazy<CR>'),
      dashboard.button('q', 'Quit', ':qa<CR>'),
    }

    local function getDashboardHeight()
      local bannerHeight = 0
      for _ in pairs(dashboard.section.header.val) do bannerHeight = bannerHeight + 1 end
      local buttonCount = 0
      for _ in pairs(dashboard.section.buttons.val) do buttonCount = buttonCount + 1 end
      local buttonsHeight = 2 * buttonCount
      local footerHeight = 1
      local dashboardHeight = bannerHeight + dashboard.opts.layout[3].val + buttonsHeight + footerHeight
      return dashboardHeight
    end

    if winHeight < getDashboardHeight() + 3 then
      dashboard.section.header.val = { 'Neovim' }
      table.remove(dashboard.section.buttons.val, 5)
      table.remove(dashboard.section.buttons.val, 5)
      table.remove(dashboard.section.buttons.val, 5)
      table.remove(dashboard.section.buttons.val, 5)
    end
    local topSpace = vim.fn.max { 0, vim.fn.floor((vim.fn.winheight(0) - getDashboardHeight()) / 2) }
    dashboard.opts.layout[1].val = topSpace

    alpha.setup(dashboard.config)
  end
}
