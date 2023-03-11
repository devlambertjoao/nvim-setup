local palette = {
  base00 = '#1e1e2e',
  base01 = '#181825',
  base02 = '#313244',
  base03 = '#45475a',
  base04 = '#585b70',
  base05 = '#cdd6f4',
  base06 = '#f5e0dc',
  base07 = '#b4befe',
  base08 = '#f38ba8',
  base09 = '#fab387',
  base0A = '#f9e2af',
  base0B = '#a6e3a1',
  base0C = '#94e2d5',
  base0D = '#89b4fa',
  base0E = '#cba6f7',
  base0F = '#f2cdcd'
}

-- StatusLine
vim.api.nvim_set_hl(0, 'StatusLineNormalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base07 })
vim.api.nvim_set_hl(0, 'StatusLineInsertMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0A })
vim.api.nvim_set_hl(0, 'StatusLineVisualMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0E })
vim.api.nvim_set_hl(0, 'StatusLineReplaceMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0B })
vim.api.nvim_set_hl(0, 'StatusLineCmdlineMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0F })
vim.api.nvim_set_hl(0, 'StatusLineTerminalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base08 })

vim.api.nvim_set_hl(0, 'StatusLineGitSignsAdd', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsChange', { ctermbg = 0, fg = palette.base0E, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsDelete', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsOnMain', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })

vim.api.nvim_set_hl(0, 'StatusLineLspError', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineLspWarning', { ctermbg = 0, fg = palette.base0A, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineLspHint', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineLspInfo', { ctermbg = 0, fg = palette.base0D, bg = palette.base01 })

vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 0, fg = palette.base09, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })
vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })

-- UI
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 0, fg = palette.base05, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 0, fg = palette.base04, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 0, fg = palette.base00, bg = palette.base00 })

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { ctermbg = 0, fg = palette.base0E, bg = palette.base0E })

-- NvimTree
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { ctermbg = 0, fg = palette.base04, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg = 0, fg = palette.base00, bg = palette.base00 })

-- GitSigns
vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 0, fg = palette.base0B, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 0, fg = palette.base0E, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'DiffDelete', { ctermbg = 0, fg = palette.base08, bg = palette.base00 })

