local status, lualine = pcall(require, "lualine")

if (not status) then return end

lualine.setup({
  options = {
    icons_enabled = false,
    component_separators = { left = '>', right = '<' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'packer', 'NvimTree' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { { 'mode', padding = 4 } },
    lualine_b = {
      'branch',
      'diff',
    },
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
      }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
