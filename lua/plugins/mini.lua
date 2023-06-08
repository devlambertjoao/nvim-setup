-- Default mini base16
-- local mini_base16 = {
--   base00 = '#112641',
--   base01 = '#3a475e',
--   base02 = '#606b81',
--   base03 = '#8691a7',
--   base04 = '#d5dc81',
--   base05 = '#e2e98f',
--   base06 = '#eff69c',
--   base07 = '#fcffaa',
--   base08 = '#ffcfa0',
--   base09 = '#cc7e46',
--   base0A = '#46a436',
--   base0B = '#9ff895',
--   base0C = '#ca6ecf',
--   base0D = '#42f7ff',
--   base0E = '#ffc4ff',
--   base0F = '#00a5c5',
-- }

-- https://github.com/catppuccin/base16
-- local palette = {
--   base00 = '#1e1e2e',
--   base01 = '#181825',
--   base02 = '#313244',
--   base03 = '#45475a',
--   base04 = '#585b70',
--   base05 = '#cdd6f4',
--   base06 = '#f5e0dc',
--   base07 = '#b4befe',
--   base08 = '#f38ba8',
--   base09 = '#fab387',
--   base0A = '#f9e2af',
--   base0B = '#a6e3a1',
--   base0C = '#94e2d5',
--   base0D = '#89b4fa',
--   base0E = '#cba6f7',
--   base0F = '#f2cdcd',
-- }

-- Nightfox
local palette = {
  base00 = '#131a24',
  base01 = '#192330',
  base02 = '#212e3f',
  base03 = '#29394f',
  base04 = '#39506d',
  base05 = '#d6d6d7',
  base06 = '#cdcecf',
  base07 = '#9d79d6',
  base08 = '#c94f6d',
  base09 = '#f4a261',
  base0A = '#dbc074',
  base0B = '#81b29a',
  base0C = '#63cdcf',
  base0D = '#719cd6',
  base0E = '#d67ad2',
  base0F = '#dfdfe0',
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
