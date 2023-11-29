---- Twilight
local palette = {
  base00 = '#1e1e1e',
  base01 = '#323537',
  base02 = '#464b50',
  base03 = '#5f5a60',
  base04 = '#838184',
  base05 = '#a7a7a7',
  base06 = '#c3c3c3',
  base07 = '#ffffff',
  base08 = '#cf6a4c',
  base09 = '#cda869',
  base0A = '#f9ee98',
  base0B = '#8f9d6a',
  base0C = '#afc4db',
  base0D = '#7587a6',
  base0E = '#9b859d',
  base0F = '#9b703f'
}


-- StatusLine
vim.api.nvim_set_hl(0, 'StatusLineNormalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0D })
vim.api.nvim_set_hl(0, 'StatusLineInsertMode', { ctermbg = 0, fg = palette.base01, bg = palette.base09 })
vim.api.nvim_set_hl(0, 'StatusLineVisualMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0E })
vim.api.nvim_set_hl(0, 'StatusLineReplaceMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0B })
vim.api.nvim_set_hl(0, 'StatusLineCmdlineMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0A })
vim.api.nvim_set_hl(0, 'StatusLineTerminalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base08 })

vim.api.nvim_set_hl(0, 'StatusLineGitSignsAdd', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsChange', { ctermbg = 0, fg = palette.base0E, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsDelete', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsOnMain', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })

vim.api.nvim_set_hl(0, 'StatusLineLspError', { ctermbg = 0, fg = palette.base08, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspWarning', { ctermbg = 0, fg = palette.base0A, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspHint', { ctermbg = 0, fg = palette.base0B, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspInfo', { ctermbg = 0, fg = palette.base0D, bg = palette.base02 })

vim.api.nvim_set_hl(0, 'StatusLineFileinfo', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })

vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 0, fg = palette.base09, bg = palette.base02 })
vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })
vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })

-- IndentLine
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { ctermbg = 0, fg = palette.base03 })

-- UI
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 0, fg = palette.base05, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 0, fg = palette.base04, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 0, fg = palette.base01, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 0, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg = 0, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 0, fg = palette.base04, bg = palette.base01 })

-- Text
vim.api.nvim_set_hl(0, 'Identifier', { ctermbg = 0, fg = palette.base08 })
vim.api.nvim_set_hl(0, 'Constant', { ctermbg = 0, fg = palette.base09 })
vim.api.nvim_set_hl(0, 'Function', { ctermbg = 0, fg = palette.base0D })
vim.api.nvim_set_hl(0, 'String', { ctermbg = 0, fg = palette.base0B })
vim.api.nvim_set_hl(0, 'Statement', { ctermbg = 0, fg = palette.base0E })
vim.api.nvim_set_hl(0, 'Special', { ctermbg = 0, fg = palette.base0C })
vim.api.nvim_set_hl(0, 'Type', { ctermbg = 0, fg = palette.base0A })
vim.api.nvim_set_hl(0, 'Comment', { ctermbg = 0, fg = palette.base03 })

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { ctermbg = 0, fg = palette.base09, bg = palette.base09 })

-- NvimTree
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { ctermbg = 0, fg = palette.base05, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { ctermbg = 0, fg = palette.base04, bg = palette.base00 })
vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg = 0, fg = palette.base01, bg = palette.base01 })

-- GitSigns
vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 0, fg = palette.base0E, bg = palette.base01 })
vim.api.nvim_set_hl(0, 'DiffDelete', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { ctermbg = 0, fg = palette.base08 })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { ctermbg = 0, fg = palette.base0A })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { ctermbg = 0, fg = palette.base0B })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { ctermbg = 0, fg = palette.base0D })
