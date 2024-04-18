vim.cmd([[
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
]])

local palette = {
	base00 = "#1b1818",
	base01 = "#292424",
	base02 = "#585050",
	base03 = "#655d5d",
	base04 = "#7e7777",
	base05 = "#8a8585",
	base06 = "#e7dfdf",
	base07 = "#f4ecec",
	base08 = "#ca4949",
	base09 = "#b45a3c",
	base0A = "#a06e3b",
	base0B = "#4b8b8b",
	base0C = "#5485b6",
	base0D = "#7272ca",
	base0E = "#8464c4",
	base0F = "#bd5187",
}

local hi = function(group, args)
	local command
	if args.link ~= nil then
		command = string.format("highlight! link %s %s", group, args.link)
	else
		command = string.format(
			"highlight %s guifg=%s guibg=%s gui=%s guisp=%s",
			group,
			args.fg or "NONE",
			args.bg or "NONE",
			args.attr or "NONE",
			args.sp or "NONE"
		)
	end

	vim.cmd(command)
end

-- stylua: ignore start

-- StatusLine
hi('StatusLineNormalMode',        {fg=palette.base01, bg=palette.base0D,  attr='bold',      sp=nil})
hi('StatusLineInsertMode',        {fg=palette.base01, bg=palette.base09,  attr='bold',      sp=nil})
hi('StatusLineVisualMode',        {fg=palette.base01, bg=palette.base0E,  attr='bold',      sp=nil})
hi('StatusLineReplaceMode',       {fg=palette.base01, bg=palette.base0B,  attr='bold',      sp=nil})
hi('StatusLineCmdlineMode',       {fg=palette.base01, bg=palette.base0A,  attr='bold',      sp=nil})
hi('StatusLineTerminalMode',      {fg=palette.base01, bg=palette.base08,  attr='bold',      sp=nil})
hi('StatusLineGitSignsAdd',       {fg=palette.base0B, bg=palette.base01,  attr=nil,         sp=nil})
hi('StatusLineGitSignsChange',    {fg=palette.base0E, bg=palette.base01,  attr=nil,         sp=nil})
hi('StatusLineGitSignsDelete',    {fg=palette.base08, bg=palette.base01,  attr=nil,         sp=nil})
hi('StatusLineGitSignsOnBranch',  {fg=palette.base05, bg=palette.base01,  attr='bold',      sp=nil})
hi('StatusLineLspError',          {fg=palette.base08, bg=palette.base02,  attr=nil,         sp=nil})
hi('StatusLineLspWarning',        {fg=palette.base0A, bg=palette.base02,  attr=nil,         sp=nil})
hi('StatusLineLspHint',           {fg=palette.base0B, bg=palette.base02,  attr=nil,         sp=nil})
hi('StatusLineLspInfo',           {fg=palette.base0D, bg=palette.base02,  attr=nil,         sp=nil})
hi('StatusLineFileinfo',          {fg=palette.base05, bg=palette.base01,  attr=nil,         sp=nil})
hi('StatusLineNormal',            {fg=palette.base09, bg=nil,             attr=nil,         sp=nil})
hi('StatuslineNC',                {fg=palette.base05, bg=palette.base03,  attr=nil,         sp=nil})
hi('StatuslineInactive',          {fg=palette.base05, bg=palette.base03,  attr=nil,         sp=nil})

-- UI
hi('ColorColumn',                 {fg=nil,            bg=palette.base01,  attr=nil,         sp=nil})
hi('Conceal',                     {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('Cursor',                      {fg=palette.base00, bg=palette.base05,  attr=nil,         sp=nil})
hi('CursorColumn',                {fg=nil,            bg=palette.base01,  attr=nil,         sp=nil})
hi('CursorIM',                    {fg=palette.base00, bg=palette.base05,  attr=nil,         sp=nil})
hi('CursorLine',                  {fg=nil,            bg=palette.base01,  attr=nil,         sp=nil})
hi('CursorLineFold',              {fg=palette.base0C, bg=palette.base01,  attr=nil,         sp=nil})
hi('CursorLineNr',                {fg=palette.base04, bg=palette.base01,  attr=nil,         sp=nil})
hi('CursorLineSign',              {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiffAdd',                     {fg=palette.base0B, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiffChange',                  {fg=palette.base0E, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiffDelete',                  {fg=palette.base08, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiffText',                    {fg=palette.base0D, bg=palette.base01,  attr=nil,         sp=nil})
hi('Directory',                   {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('EndOfBuffer',                 {fg=palette.base03, bg=nil,             attr=nil,         sp=nil})
hi('ErrorMsg',                    {fg=palette.base08, bg=palette.base00,  attr=nil,         sp=nil})
hi('FoldColumn',                  {fg=palette.base0C, bg=palette.base01,  attr=nil,         sp=nil})
hi('Folded',                      {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('IncSearch',                   {fg=palette.base01, bg=palette.base09,  attr=nil,         sp=nil})
hi('lCursor',                     {fg=palette.base00, bg=palette.base05,  attr=nil,         sp=nil})
hi('LineNr',                      {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('LineNrAbove',                 {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('LineNrBelow',                 {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('MatchParen',                  {fg=nil,            bg=palette.base02,  attr=nil,         sp=nil})
hi('ModeMsg',                     {fg=palette.base0B, bg=nil,             attr=nil,         sp=nil})
hi('MoreMsg',                     {fg=palette.base0B, bg=nil,             attr=nil,         sp=nil})
hi('MsgArea',                     {fg=palette.base05, bg=palette.base00,  attr=nil,         sp=nil})
hi('MsgSeparator',                {fg=palette.base04, bg=palette.base02,  attr=nil,         sp=nil})
hi('NonText',                     {fg=palette.base03, bg=nil,             attr=nil,         sp=nil})
hi('Normal',                      {fg=palette.base05, bg=palette.base00,  attr=nil,         sp=nil})
hi('NormalFloat',                 {fg=palette.base05, bg=palette.base01,  attr=nil,         sp=nil})
hi('NormalNC',                    {fg=palette.base05, bg=palette.base00,  attr=nil,         sp=nil})
hi('PMenu',                       {fg=palette.base05, bg=palette.base01,  attr=nil,         sp=nil})
hi('PMenuSbar',                   {fg=nil,            bg=palette.base02,  attr=nil,         sp=nil})
hi('PMenuSel',                    {fg=palette.base01, bg=palette.base05,  attr=nil,         sp=nil})
hi('PMenuThumb',                  {fg=nil,            bg=palette.base07,  attr=nil,         sp=nil})
hi('Question',                    {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('QuickFixLine',                {fg=nil,            bg=palette.base01,  attr=nil,         sp=nil})
hi('Search',                      {fg=palette.base01, bg=palette.base0A,  attr=nil,         sp=nil})
hi('SignColumn',                  {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('SpecialKey',                  {fg=palette.base03, bg=nil,             attr=nil,         sp=nil})
hi('SpellBad',                    {fg=nil,            bg=nil,             attr='undercurl', sp=palette.base08})
hi('SpellCap',                    {fg=nil,            bg=nil,             attr='undercurl', sp=palette.base0D})
hi('SpellLocal',                  {fg=nil,            bg=nil,             attr='undercurl', sp=palette.base0C})
hi('SpellRare',                   {fg=nil,            bg=nil,             attr='undercurl', sp=palette.base0E})
hi('StatusLine',                  {fg=palette.base04, bg=palette.base02,  attr=nil,         sp=nil})
hi('StatusLineNC',                {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('Substitute',                  {fg=palette.base01, bg=palette.base0A,  attr=nil,         sp=nil})
hi('TabLine',                     {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('TabLineFill',                 {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('TabLineSel',                  {fg=palette.base0B, bg=palette.base01,  attr=nil,         sp=nil})
hi('TermCursor',                  {fg=nil,            bg=nil,             attr='reverse',   sp=nil})
hi('TermCursorNC',                {fg=nil,            bg=nil,             attr='reverse',   sp=nil})
hi('Title',                       {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('VertSplit',                   {fg=palette.base02, bg=palette.base02,  attr=nil,         sp=nil})
hi('Visual',                      {fg=nil,            bg=palette.base02,  attr=nil,         sp=nil})
hi('VisualNOS',                   {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('WarningMsg',                  {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Whitespace',                  {fg=palette.base03, bg=nil,             attr=nil,         sp=nil})
hi('WildMenu',                    {fg=palette.base08, bg=palette.base0A,  attr=nil,         sp=nil})
hi('WinBar',                      {fg=palette.base04, bg=palette.base02,  attr=nil,         sp=nil})
hi('WinBarNC',                    {fg=palette.base03, bg=palette.base01,  attr=nil,         sp=nil})
hi('WinSeparator',                {fg=palette.base02, bg=palette.base02,  attr=nil,         sp=nil})

-- Syntax
hi('Boolean',                     {fg=palette.base09, bg=nil,             attr=nil,         sp=nil})
hi('Character',                   {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Comment',                     {fg=palette.base03, bg=nil,             attr=nil,         sp=nil})
hi('Conditional',                 {fg=palette.base0E, bg=nil,             attr=nil,         sp=nil})
hi('Constant',                    {fg=palette.base09, bg=nil,             attr=nil,         sp=nil})
hi('Debug',                       {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Define',                      {fg=palette.base0E, bg=nil,             attr=nil,         sp=nil})
hi('Delimiter',                   {fg=palette.base0F, bg=nil,             attr=nil,         sp=nil})
hi('Error',                       {fg=palette.base00, bg=palette.base08,  attr=nil,         sp=nil})
hi('Exception',                   {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Float',                       {fg=palette.base09, bg=nil,             attr=nil,         sp=nil})
hi('Function',                    {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('Identifier',                  {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Ignore',                      {fg=palette.base0C, bg=nil,             attr=nil,         sp=nil})
hi('Include',                     {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('Keyword',                     {fg=palette.base0E, bg=nil,             attr=nil,         sp=nil})
hi('Label',                       {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Macro',                       {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Number',                      {fg=palette.base09, bg=nil,             attr=nil,         sp=nil})
hi('Operator',                    {fg=palette.base05, bg=nil,             attr=nil,         sp=nil})
hi('PreCondit',                   {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('PreProc',                     {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Repeat',                      {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Special',                     {fg=palette.base0C, bg=nil,             attr=nil,         sp=nil})
hi('SpecialChar',                 {fg=palette.base0F, bg=nil,             attr=nil,         sp=nil})
hi('SpecialComment',              {fg=palette.base0C, bg=nil,             attr=nil,         sp=nil})
hi('Statement',                   {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('StorageClass',                {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('String',                      {fg=palette.base0B, bg=nil,             attr=nil,         sp=nil})
hi('Structure',                   {fg=palette.base0E, bg=nil,             attr=nil,         sp=nil})
hi('Tag',                         {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Todo',                        {fg=palette.base0A, bg=palette.base01,  attr=nil,         sp=nil})
hi('Type',                        {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Typedef',                     {fg=palette.base0A, bg=nil,             attr=nil,         sp=nil})
hi('Bold',                        {fg=nil,            bg=nil,             attr='bold',      sp=nil})
hi('Italic',                      {fg=nil,            bg=nil,             attr='italic',    sp=nil})
hi('TooLong',                     {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('Underlined',                  {fg=nil,            bg=nil,             attr='underline', sp=nil})

-- Diagnostics
hi('DiagnosticError',             {fg=palette.base08, bg=nil,             attr=nil,         sp=nil})
hi('DiagnosticHint',              {fg=palette.base0D, bg=nil,             attr=nil,         sp=nil})
hi('DiagnosticInfo',              {fg=palette.base0C, bg=nil,             attr=nil,         sp=nil})
hi('DiagnosticOk',                {fg=palette.base0B, bg=nil,             attr=nil,         sp=nil})
hi('DiagnosticWarn',              {fg=palette.base0E, bg=nil,             attr=nil,         sp=nil})
hi('DiagnosticFloatingError',     {fg=palette.base08, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiagnosticFloatingHint',      {fg=palette.base0D, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiagnosticFloatingInfo',      {fg=palette.base0C, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiagnosticFloatingOk',        {fg=palette.base0B, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiagnosticFloatingWarn',      {fg=palette.base0E, bg=palette.base01,  attr=nil,         sp=nil})
hi('DiagnosticSignError',         {link='DiagnosticFloatingError'})
hi('DiagnosticSignHint',          {link='DiagnosticFloatingHint'})
hi('DiagnosticSignInfo',          {link='DiagnosticFloatingInfo'})
hi('DiagnosticSignOk',            {link='DiagnosticFloatingOk'})
hi('DiagnosticSignWarn',          {link='DiagnosticFloatingWarn'})
hi('DiagnosticUnderlineError',    {fg=nil,            bg=nil,             attr='underline', sp=palette.base08})
hi('DiagnosticUnderlineHint',     {fg=nil,            bg=nil,             attr='underline', sp=palette.base0D})
hi('DiagnosticUnderlineInfo',     {fg=nil,            bg=nil,             attr='underline', sp=palette.base0C})
hi('DiagnosticUnderlineOk',       {fg=nil,            bg=nil,             attr='underline', sp=palette.base0B})
hi('DiagnosticUnderlineWarn',     {fg=nil,            bg=nil,             attr='underline', sp=palette.base0E})
hi('LspReferenceText',            {fg=nil,            bg=palette.base02,  attr=nil,         sp=nil})
hi('LspReferenceRead',            {link='LspReferenceText'})
hi('LspReferenceWrite',           {link='LspReferenceText'})
hi('LspSignatureActiveParameter', {link='LspReferenceText'})
hi('LspCodeLens',                 {link='Comment'})
hi('LspCodeLensSeparator',        {link='Comment'})

-- Nvim CMP
hi('CmpItemAbbr',                 {fg=palette.base05, bg=nil,            attr=nil,          sp=nil})
hi('CmpItemAbbrDeprecated',       {fg=palette.base03, bg=nil,            attr=nil,          sp=nil})
hi('CmpItemAbbrMatch',            {fg=palette.base0A, bg=nil,            attr='bold',       sp=nil})
hi('CmpItemAbbrMatchFuzzy',       {fg=palette.base0A, bg=nil,            attr='bold',       sp=nil})
hi('CmpItemKind',                 {fg=palette.base0F, bg=palette.base01, attr=nil,          sp=nil})
hi('CmpItemMenu',                 {fg=palette.base05, bg=palette.base01, attr=nil,          sp=nil})
hi('CmpItemKindClass',            {link='Type'})
hi('CmpItemKindColor',            {link='Special'})
hi('CmpItemKindConstant',         {link='Constant'})
hi('CmpItemKindConstructor',      {link='Type'})
hi('CmpItemKindEnum',             {link='Structure'})
hi('CmpItemKindEnumMember',       {link='Structure'})
hi('CmpItemKindEvent',            {link='Exception'})
hi('CmpItemKindField',            {link='Structure'})
hi('CmpItemKindFile',             {link='Tag'})
hi('CmpItemKindFolder',           {link='Directory'})
hi('CmpItemKindFunction',         {link='Function'})
hi('CmpItemKindInterface',        {link='Structure'})
hi('CmpItemKindKeyword',          {link='Keyword'})
hi('CmpItemKindMethod',           {link='Function'})
hi('CmpItemKindModule',           {link='Structure'})
hi('CmpItemKindOperator',         {link='Operator'})
hi('CmpItemKindProperty',         {link='Structure'})
hi('CmpItemKindReference',        {link='Tag'})
hi('CmpItemKindSnippet',          {link='Special'})
hi('CmpItemKindStruct',           {link='Structure'})
hi('CmpItemKindText',             {link='Statement'})
hi('CmpItemKindTypeParameter',    {link='Type'})
hi('CmpItemKindUnit',             {link='Special'})
hi('CmpItemKindValue',            {link='Identifier'})
hi('CmpItemKindVariable',         {link='Delimiter'})

-- Git Signs
hi('GitSignsAdd',                 {fg=palette.base0B, bg=palette.base01, attr=nil,          sp=nil})
hi('GitSignsAddLn',               {link='GitSignsAdd'})
hi('GitSignsAddInline',           {link='GitSignsAdd'})
hi('GitSignsChange',              {fg=palette.base0E, bg=palette.base01, attr=nil,          sp=nil})
hi('GitSignsChangeLn',            {link='GitSignsChange'})
hi('GitSignsChangeInline',        {link='GitSignsChange'})
hi('GitSignsDelete',              {fg=palette.base08, bg=palette.base01, attr=nil,          sp=nil})
hi('GitSignsDeleteLn',            {link='GitSignsDelete'})
hi('GitSignsDeleteInline',        {link='GitSignsDelete'})
hi('GitSignsUntracked',           {fg=palette.base0D, bg=palette.base01, attr=nil,          sp=nil})
hi('GitSignsUntrackedLn',         {link='GitSignsUntracked'})
hi('GitSignsUntrackedInline',     {link='GitSignsUntracked'})

-- Telescope
hi('TelescopeBorder',             {fg=palette.base0F, bg=nil,            attr=nil,           sp=nil})
hi('TelescopeMatching',           {fg=palette.base0A, bg=nil,            attr=nil,           sp=nil})
hi('TelescopeMultiSelection',     {fg=nil,            bg=palette.base01, attr='bold',        sp=nil})
hi('TelescopeSelection',          {fg=nil,            bg=palette.base01, attr='bold',        sp=nil})

-- stylua: ignore end

-- Set terminal colors
vim.g.terminal_color_0 = palette.base00
vim.g.terminal_color_1 = palette.base08
vim.g.terminal_color_2 = palette.base0B
vim.g.terminal_color_3 = palette.base0A
vim.g.terminal_color_4 = palette.base0D
vim.g.terminal_color_5 = palette.base0E
vim.g.terminal_color_6 = palette.base0C
vim.g.terminal_color_7 = palette.base05
vim.g.terminal_color_8 = palette.base03
vim.g.terminal_color_9 = palette.base08
vim.g.terminal_color_10 = palette.base0B
vim.g.terminal_color_11 = palette.base0A
vim.g.terminal_color_12 = palette.base0D
vim.g.terminal_color_13 = palette.base0E
vim.g.terminal_color_14 = palette.base0C
vim.g.terminal_color_15 = palette.base07
