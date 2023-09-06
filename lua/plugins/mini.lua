-- Find base16 themes: https://github.com/chriskempson/base16-schemes-source

-- Rose Pine
local palette = {
  base00 = '#191724',
  base01 = '#1f1d2e',
  base02 = '#26233a',
  base03 = '#6e6a86',
  base04 = '#908caa',
  base05 = '#e0def4',
  base06 = '#e0def4',
  base07 = '#524f67',
  base08 = '#eb6f92',
  base09 = '#f6c177',
  base0A = '#ebbcba',
  base0B = '#31748f',
  base0C = '#9ccfd8',
  base0D = '#c4a7e7',
  base0E = '#f6c177',
  base0F = '#524f67'
}

return {
  'echasnovski/mini.nvim',
  event = { 'BufRead' },
  config = function()
    require('mini.cursorword').setup()
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

    vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 0, fg = palette.base09, bg = palette.base02 })
    vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })
    vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = palette.base05, bg = palette.base03 })

    -- IndentLine
    vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { ctermbg = 0, fg = palette.base03 })
  end
}
