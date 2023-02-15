local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

local keymap = vim.keymap

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true
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

