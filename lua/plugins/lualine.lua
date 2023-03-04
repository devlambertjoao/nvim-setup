return {
  'nvim-lualine/lualine.nvim',
  event = 'LazyVimStarted',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = ''
      },
      sections = {
        lualine_c = { { 'filename', file_status = false, path = 0 } },
        lualine_x = {
          {
            'diagnostics',
            sources = {
              'nvim_lsp',
              'nvim_diagnostic',
              'nvim_workspace_diagnostic'
            },
            symbols = {
              error = 'e',
              warn = 'w',
              info = 'i',
              hint = 'h'
            },
            always_visible = true,
            update_in_insert = true
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      }
    }
  end
}

