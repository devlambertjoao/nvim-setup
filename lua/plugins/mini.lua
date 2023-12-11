-- Find base16 themes: https://github.com/chriskempson/base16-schemes-source

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


---- Gruvbox Darf Soft
-- local palette = {
--   base00 = '#32302f',
--   base01 = '#3c3836',
--   base02 = '#504945',
--   base03 = '#665c54',
--   base04 = '#bdae93',
--   base05 = '#d5c4a1',
--   base06 = '#ebdbb2',
--   base07 = '#fbf1c7',
--   base08 = '#fb4934',
--   base09 = '#fe8019',
--   base0A = '#fabd2f',
--   base0B = '#b8bb26',
--   base0C = '#8ec07c',
--   base0D = '#83a598',
--   base0E = '#d3869b',
--   base0F = '#d65d0e'
-- }

return {
  'echasnovski/mini.nvim',
  event = { 'VeryLazy' },
  config = function()
    -- require('mini.cursorword').setup()
    require('mini.pairs').setup()
    require('mini.tabline').setup()
    require('mini.splitjoin').setup()
    require('mini.indentscope').setup()
    require('mini.base16').setup({
      palette = palette
    })

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

    vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 'none', fg = palette.base09, bg = 'none' })
    vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })
    vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })

    -- IndentLine
    vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { ctermbg = 0, fg = palette.base03 })

    -- Transparent
    vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 'none', bg = 'none' })

    vim.api.nvim_set_hl(0, 'TelescopeNormal', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePrompt', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreview', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeResults', { ctermbg = 'none', bg = 'none' })

    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'WhichKeySeparator', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'WhichKeyBorder', { ctermbg = 'none', bg = 'none', fg = palette.base08 })

    vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 'none', bg = palette.base01 })

    vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg = 'none', bg = 'none' })

    vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { ctermbg = 'none', bg = 'none' })

    vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = palette.base08, ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = palette.base0E, ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = palette.base0D, ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = palette.base0C, ctermbg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingOk', { fg = palette.base0B, ctermbg = 'none', bg = 'none' })

    vim.api.nvim_set_hl(0, 'DiagnosticSignError', { link = 'DiagnosticFloatingError' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { link = 'DiagnosticFloatingHint' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { link = 'DiagnosticFloatingInfo' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { link = 'DiagnosticFloatingOk' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { link = 'DiagnosticFloatingWarn' })

    vim.api.nvim_set_hl(0, 'DiagnosticError', { link = 'DiagnosticFloatingError' })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'DiagnosticFloatingWarn' })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { link = 'DiagnosticFloatingHint' })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { link = 'DiagnosticFloatingInfo' })
    vim.api.nvim_set_hl(0, 'DiagnosticOk', { link = 'DiagnosticFloatingOk' })

    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = nil, bg = nil, underline = true, sp = palette.base08 })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = nil, bg = nil, underline = true, sp = palette.base0D })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = nil, bg = nil, underline = true, sp = palette.base0C })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineOk', { fg = nil, bg = nil, underline = true, sp = palette.base0B })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = nil, bg = nil, underline = true, sp = palette.base0E })
  end
}
