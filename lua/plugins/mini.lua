-- Find base16 themes: https://github.com/chriskempson/base16-schemes-source

-- Nightfox
-- local palette = {
--   base00 = '#131a24',
--   base01 = '#192330',
--   base02 = '#212e3f',
--   base03 = '#39506d',
--   base04 = '#aeafb0',
--   base05 = '#d6d6d7',
--   base06 = '#cdcecf',
--   base07 = '#9d79d6',
--   base08 = '#c94f6d',
--   base09 = '#f4a261',
--   base0A = '#dbc074',
--   base0B = '#81b29a',
--   base0C = '#63cdcf',
--   base0D = '#719cd6',
--   base0E = '#d67ad2',
--   base0F = '#dfdfe0',
-- }

-- Dracula
-- local palette = {
--   base00 = '#282936',
--   base01 = '#3a3c4e',
--   base02 = '#4d4f68',
--   base03 = '#626483',
--   base04 = '#62d6e8',
--   base05 = '#e9e9f4',
--   base06 = '#f1f2f8',
--   base07 = '#f7f7fb',
--   base08 = '#ea51b2',
--   base09 = '#b45bcf',
--   base0A = '#00f769',
--   base0B = '#ebff87',
--   base0C = '#a1efe4',
--   base0D = '#62d6e8',
--   base0E = '#b45bcf',
--   base0F = '#00f769',
-- }


local palette = {
base00= '#1e1e1e',
base01= '#323537',
base02= '#464b50',
base03= '#5f5a60',
base04= '#838184',
base05= '#a7a7a7',
base06= '#c3c3c3',
base07= '#ffffff',
base08= '#cf6a4c',
base09= '#cda869',
base0A= '#f9ee98',
base0B= '#8f9d6a',
base0C= '#afc4db',
base0D= '#7587a6',
base0E= '#9b859d',
base0F= '#9b703f',
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
