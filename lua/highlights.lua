---- Twilight
local p = {
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

-- vim.api.nvim_set_hl(0, 'ColorColumn', { fg = nil, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Conceal', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CurSearch', { fg = p.base01, bg = p.base09,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Cursor', { fg = p.base00, bg = p.base05,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorColumn', { fg = nil, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorIM', { fg = p.base00, bg = p.base05,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorLine', { fg = nil, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorLineFold', { fg = p.base0C, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = p.base04, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = p.base0B, bg = p.base01,  sp = nil })
-- -- Differs from base16-vim, but according to general style guide
-- vim.api.nvim_set_hl(0, 'DiffChange', { fg = p.base0E, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = p.base08, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffText', { fg = p.base0D, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Directory', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = p.base03, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = p.base08, bg = p.base00,  sp = nil })
-- vim.api.nvim_set_hl(0, 'FoldColumn', { fg = p.base0C, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Folded', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'IncSearch', { fg = p.base01, bg = p.base09,  sp = nil })
-- vim.api.nvim_set_hl(0, 'lCursor', { fg = p.base00, bg = p.base05,  sp = nil })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = p.base03, bg = p.base01,  sp = nil })
-- -- Slight difference from base16, where `bg=base03` is used. This makes
-- -- it possible to comfortably see this highlighting in comments.
-- vim.api.nvim_set_hl(0, 'MatchParen', { fg = nil, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'ModeMsg', { fg = p.base0B, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'MoreMsg', { fg = p.base0B, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'MsgArea', { fg = p.base05, bg = p.base00,  sp = nil })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', { fg = p.base04, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'NonText', { fg = p.base03, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Normal', { fg = p.base05, bg = p.base00,  sp = nil })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { fg = p.base05, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'NormalNC', { fg = p.base05, bg = p.base00,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PMenu', { fg = p.base05, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PMenuSbar', { fg = nil, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PMenuSel', { fg = p.base01, bg = p.base05,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PMenuThumb', { fg = nil, bg = p.base07,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Question', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = nil, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Search', { fg = p.base01, bg = p.base0A,  sp = nil })
-- vim.api.nvim_set_hl(0, 'SignColumn', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'SpecialKey', { fg = p.base03, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'SpellBad', { fg = nil, bg = nil, undercurl = true, sp = p.base08 })
-- vim.api.nvim_set_hl(0, 'SpellCap', { fg = nil, bg = nil, undercurl = true, sp = p.base0D })
-- vim.api.nvim_set_hl(0, 'SpellLocal', { fg = nil, bg = nil, undercurl = true, sp = p.base0C })
-- vim.api.nvim_set_hl(0, 'SpellRare', { fg = nil, bg = nil, undercurl = true, sp = p.base0E })
-- vim.api.nvim_set_hl(0, 'StatusLine', { fg = p.base04, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Substitute', { fg = p.base01, bg = p.base0A,  sp = nil })
-- vim.api.nvim_set_hl(0, 'TabLine', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'TabLineFill', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'TabLineSel', { fg = p.base0B, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'TermCursor', { fg = nil, bg = nil, reverse = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'TermCursorNC', { fg = nil, bg = nil, reverse = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'Title', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = p.base02, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Visual', { fg = nil, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'VisualNOS', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'WarningMsg', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Whitespace', { fg = p.base03, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'WildMenu', { fg = p.base08, bg = p.base0A,  sp = nil })
-- vim.api.nvim_set_hl(0, 'WinBar', { fg = p.base04, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'WinBarNC', { fg = p.base03, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = p.base02, bg = p.base02,  sp = nil })
-- 
-- -- Standard syntax (affects treesitter)
-- vim.api.nvim_set_hl(0, 'Boolean', { fg = p.base09, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Character', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Comment', { fg = p.base03, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Conditional', { fg = p.base0E, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Constant', { fg = p.base09, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Debug', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Define', { fg = p.base0E, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Delimiter', { fg = p.base0F, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Error', { fg = p.base00, bg = p.base08,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Exception', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Float', { fg = p.base09, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Function', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Identifier', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Ignore', { fg = p.base0C, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Include', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Keyword', { fg = p.base0E, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Label', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Macro', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Number', { fg = p.base09, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Operator', { fg = p.base05, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PreCondit', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'PreProc', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Repeat', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Special', { fg = p.base0C, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'SpecialChar', { fg = p.base0F, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'SpecialComment', { fg = p.base0C, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Statement', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'StorageClass', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'String', { fg = p.base0B, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Structure', { fg = p.base0E, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Tag', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Todo', { fg = p.base0A, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Type', { fg = p.base0A, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Typedef', { fg = p.base0A, bg = nil,  sp = nil })
-- 
-- -- Other from 'base16-vim'
-- vim.api.nvim_set_hl(0, 'Bold', { fg = nil, bg = nil, bold = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'Italic', { fg = nil, bg = nil, italic = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'TooLong', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'Underlined', { fg = nil, bg = nil, underline = true, sp = nil })
-- 
-- -- Git diff
-- vim.api.nvim_set_hl(0, 'DiffAdded', { fg = p.base0B, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffFile', { fg = p.base08, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffLine', { fg = p.base0D, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiffNewFile', { link = 'DiffAdded' })
-- vim.api.nvim_set_hl(0, 'DiffRemoved', { link = 'DiffFile' })
-- 
-- -- Git commit
-- vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = p.base09, bg = nil, bold = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitComment', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = p.base08, bg = nil, bold = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = p.base0E, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitSelected', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = p.base0B, bg = nil, bold = true, sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { link = 'gitcommitDiscardedType' })
-- vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = p.base0B, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { link = 'gitcommitDiscardedFile' })
-- vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { link = 'gitcommitDiscardedType' })
-- vim.api.nvim_set_hl(0, 'gitcommitUntracked', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = p.base0A, bg = nil,  sp = nil })
-- 
-- -- Built-in diagnostic
-- vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = p.base08, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = p.base0D, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = p.base0C, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticOk', { fg = p.base0B, bg = nil,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = p.base0E, bg = nil,  sp = nil })
-- 
-- vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = p.base08, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = p.base0D, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = p.base0C, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticFloatingOk', { fg = p.base0B, bg = p.base01,  sp = nil })
-- vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = p.base0E, bg = p.base01,  sp = nil })
-- 
-- vim.api.nvim_set_hl(0, 'DiagnosticSignError', { link = 'DiagnosticFloatingError' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { link = 'DiagnosticFloatingHint' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { link = 'DiagnosticFloatingInfo' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { link = 'DiagnosticFloatingOk' })
-- vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { link = 'DiagnosticFloatingWarn' })
-- 
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = nil, bg = nil, underline = true, sp = p.base08 })
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = nil, bg = nil, underline = true, sp = p.base0D })
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = nil, bg = nil, underline = true, sp = p.base0C })
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineOk', { fg = nil, bg = nil, underline = true, sp = p.base0B })
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = nil, bg = nil, underline = true, sp = p.base0E })
-- 
-- -- Built-in LSP
-- vim.api.nvim_set_hl(0, 'LspReferenceText', { fg = nil, bg = p.base02,  sp = nil })
-- vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
-- vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })
-- 
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { link = 'LspReferenceText' })
-- 
-- vim.api.nvim_set_hl(0, 'LspCodeLens', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { link = 'Comment' })
-- 
-- -- Tree-sitter
-- if vim.fn.has('nvim-0.8') == 1 then
--   -- Sources:
--   -- - `:h treesitter-highlight-groups`
--   -- - https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
--   -- Included only those differing from default links
--   vim.api.nvim_set_hl(0, '@keyword.return', { fg = p.base08, bg = nil,  sp = nil })
--   vim.api.nvim_set_hl(0, '@symbol', { fg = p.base0E, bg = nil,  sp = nil })
--   vim.api.nvim_set_hl(0, '@variable', { fg = p.base05, bg = nil,  sp = nil })
-- 
--   vim.api.nvim_set_hl(0, '@text.strong', { fg = nil, bg = nil, bold = true, sp = nil })
--   vim.api.nvim_set_hl(0, '@text.emphasis', { fg = nil, bg = nil, italic = true, sp = nil })
--   vim.api.nvim_set_hl(0, '@text.strike', { fg = nil, bg = nil, strikethrough = true, sp = nil })
-- end
-- 
-- -- Semantic tokens
-- if vim.fn.has('nvim-0.9') == 1 then
--   -- Source: `:h lsp-semantic-highlight`
--   -- Included only those differing from default links
--   vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = p.base05, bg = nil,  sp = nil })
-- 
--   vim.api.nvim_set_hl(0, '@lsp.mod.defaultLibrary', { link = 'Special' })
--   vim.api.nvim_set_hl(0, '@lsp.mod.deprecated', { fg = p.base08, bg = nil,  sp = nil })
-- end

-- StatusLine
vim.api.nvim_set_hl(0, 'StatusLineNormalMode', { ctermbg = 0, fg = p.base01, bg = p.base0D })
vim.api.nvim_set_hl(0, 'StatusLineInsertMode', { ctermbg = 0, fg = p.base01, bg = p.base09 })
vim.api.nvim_set_hl(0, 'StatusLineVisualMode', { ctermbg = 0, fg = p.base01, bg = p.base0E })
vim.api.nvim_set_hl(0, 'StatusLineReplaceMode', { ctermbg = 0, fg = p.base01, bg = p.base0B })
vim.api.nvim_set_hl(0, 'StatusLineCmdlineMode', { ctermbg = 0, fg = p.base01, bg = p.base0A })
vim.api.nvim_set_hl(0, 'StatusLineTerminalMode', { ctermbg = 0, fg = p.base01, bg = p.base08 })

vim.api.nvim_set_hl(0, 'StatusLineGitSignsAdd', { ctermbg = 0, fg = p.base0B, bg = p.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsChange', { ctermbg = 0, fg = p.base0E, bg = p.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsDelete', { ctermbg = 0, fg = p.base08, bg = p.base01 })
vim.api.nvim_set_hl(0, 'StatusLineGitSignsOnMain', { ctermbg = 0, fg = p.base05, bg = p.base01 })

vim.api.nvim_set_hl(0, 'StatusLineLspError', { ctermbg = 0, fg = p.base08, bg = p.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspWarning', { ctermbg = 0, fg = p.base0A, bg = p.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspHint', { ctermbg = 0, fg = p.base0B, bg = p.base02 })
vim.api.nvim_set_hl(0, 'StatusLineLspInfo', { ctermbg = 0, fg = p.base0D, bg = p.base02 })

vim.api.nvim_set_hl(0, 'StatusLineFileinfo', { ctermbg = 0, fg = p.base05, bg = p.base01 })

vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 0, fg = p.base09, bg = p.base02 })
vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = p.base05, bg = p.base03 })
vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = p.base05, bg = p.base03 })

-- IndentLine
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { ctermbg = 0, fg = p.base03 })

-- UI
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 0, fg = p.base05, bg = p.base00 })
vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 0, fg = p.base04, bg = p.base00 })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 0, fg = p.base01, bg = p.base01 })
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 0, bg = p.base01 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg = 0, bg = p.base01 })
vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 0, fg = p.base04, bg = p.base01 })

-- Text
vim.api.nvim_set_hl(0, 'Identifier', { ctermbg = 0, fg = p.base08 })
vim.api.nvim_set_hl(0, 'Constant', { ctermbg = 0, fg = p.base09 })
vim.api.nvim_set_hl(0, 'Function', { ctermbg = 0, fg = p.base0D })
vim.api.nvim_set_hl(0, 'String', { ctermbg = 0, fg = p.base0B })
vim.api.nvim_set_hl(0, 'Statement', { ctermbg = 0, fg = p.base0E })
vim.api.nvim_set_hl(0, 'Special', { ctermbg = 0, fg = p.base0C })
vim.api.nvim_set_hl(0, 'Type', { ctermbg = 0, fg = p.base0A })
vim.api.nvim_set_hl(0, 'Comment', { ctermbg = 0, fg = p.base03 })

-- Selected Text
vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 0, bg = p.base02 })

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { ctermbg = 0, fg = p.base05, bg = p.base01 })
vim.api.nvim_set_hl(0, 'PMenuSbar', { fg = nil, bg = p.base02,  sp = nil })
vim.api.nvim_set_hl(0, 'PMenuSel', { fg = p.base01, bg = p.base05,  sp = nil })
vim.api.nvim_set_hl(0, 'PMenuThumb', { fg = nil, bg = p.base0D,  sp = nil })

-- NvimTree
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { ctermbg = 0, fg = p.base05, bg = p.base00 })
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { ctermbg = 0, fg = p.base04, bg = p.base00 })
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { ctermbg = 0, fg = p.base04, bg = p.base00 })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { ctermbg = 0, fg = p.base0E })
vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { ctermbg = 0, fg = p.base0B })
vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { ctermbg = 0, fg = p.base08 })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { ctermbg = 0, fg = p.base0A })
vim.api.nvim_set_hl(0, 'VertSplit', { ctermbg = 0, fg = p.base0E, bg = p.base03 })

-- GitSigns
vim.api.nvim_set_hl(0, 'DiffAdd', { ctermbg = 0, fg = p.base0B, bg = p.base01 })
vim.api.nvim_set_hl(0, 'DiffChange', { ctermbg = 0, fg = p.base0E, bg = p.base01 })
vim.api.nvim_set_hl(0, 'DiffDelete', { ctermbg = 0, fg = p.base08, bg = p.base01 })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { ctermbg = 0, fg = p.base08, bg = p.base01 })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { ctermbg = 0, fg = p.base0A, bg = p.base01 })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { ctermbg = 0, fg = p.base0B, bg = p.base01 })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { ctermbg = 0, fg = p.base0D, bg = p.base01 })

-- Directory
vim.api.nvim_set_hl(0, 'Directory', { ctermbg = 0, fg = p.base0D })
