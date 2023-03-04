return {
  'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup({
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
      }
    })
  end
}
