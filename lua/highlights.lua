vim.cmd([[
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
]])

local palette = {
  base00 = '#24273a',
  base01 = '#1e2030',
  base02 = '#363a4f',
  base03 = '#494d64',
  base04 = '#5b6078',
  base05 = '#cad3f5',
  base06 = '#f4dbd6',
  base07 = '#b7bdf8',
  base08 = '#ed8796',
  base09 = '#f5a97f',
  base0A = '#eed49f',
  base0B = '#a6da95',
  base0C = '#8bd5ca',
  base0D = '#8aadf4',
  base0E = '#c6a0f6',
  base0F = '#f0c6c6',
}

local hi = function(group, args)
  local command
  if args.link ~= nil then
    command = string.format('highlight! link %s %s', group, args.link)
  else
    command = string.format(
      'highlight %s guifg=%s guibg=%s gui=%s guisp=%s',
      group,
      args.fg or 'NONE',
      args.bg or 'NONE',
      args.attr or 'NONE',
      args.sp or 'NONE'
    )
  end

  vim.cmd(command)
end

-- UI
hi('StatusLineNormalMode', { fg = palette.base01, bg = palette.base0D })
hi('StatusLineInsertMode', { fg = palette.base01, bg = palette.base09 })
hi('StatusLineVisualMode', { fg = palette.base01, bg = palette.base0E })
hi('StatusLineReplaceMode', { fg = palette.base01, bg = palette.base0B })
hi('StatusLineCmdlineMode', { fg = palette.base01, bg = palette.base0A })
hi('StatusLineTerminalMode', { fg = palette.base01, bg = palette.base08 })
hi('StatusLineGitSignsAdd', { fg = palette.base0B, bg = palette.base01 })
hi('StatusLineGitSignsChange', { fg = palette.base0E, bg = palette.base01 })
hi('StatusLineGitSignsDelete', { fg = palette.base08, bg = palette.base01 })
hi('StatusLineGitSignsOnMain', { fg = palette.base05, bg = palette.base01 })
hi('StatusLineLspError', { fg = palette.base08, bg = palette.base02 })
hi('StatusLineLspWarning', { fg = palette.base0A, bg = palette.base02 })
hi('StatusLineLspHint', { fg = palette.base0B, bg = palette.base02 })
hi('StatusLineLspInfo', { fg = palette.base0D, bg = palette.base02 })
hi('StatusLineFileinfo', { fg = palette.base05, bg = palette.base01 })
hi('StatusLineNormal', { fg = palette.base09 })
hi('StatuslineNC', { fg = palette.base05, bg = palette.base03 })
hi('StatuslineInactive', { fg = palette.base05, bg = palette.base03 })
