return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
    cmd = 'Telescope',
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "target",
            "bin",
            "obj",
            "lsp/",
            "lsp\\",
            "lazy-lock.json"
          }
        },
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          }
        }
      })

      telescope.load_extension('ui-select')
    end
  },
}
