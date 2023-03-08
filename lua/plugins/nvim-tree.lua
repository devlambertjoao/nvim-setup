return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeFindFileToggle', 'NvimTreeOpen' },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
      renderer = {
        group_empty = false,
        icons = {
          show = {
            file = false,
            folder = true,
            folder_arrow = false,
          },
          glyphs = {
            git = {
              unstaged = "~",
              staged = "S",
              unmerged = "[M]",
              renamed = "R",
              untracked = "+",
              deleted = "x",
              ignored = "i",
            },
            folder = {
              default = ">",
              open = "v",
            }
          }
        },
      },
      filters = {
        dotfiles = false,
      },
    })
  end
}
