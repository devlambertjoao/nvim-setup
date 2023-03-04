return {
  'nvim-lualine/lualine.nvim',
  event = { 'VeryLazy' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = ''
      }
    }
  end
}
