return {
  'xiyaowong/transparent.nvim',
  event = { 'BufRead' },
  config = function()
    require('transparent').setup({
      groups = {
        'Normal',
        'NormalNC',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'EndOfBuffer',
      },
      extra_groups = {},
      exclude_groups = {
        'Pmenu',
        'PmenuThumb',
        'PmenuSel',
        'PmenuSbar',
        'Float',
        'NormalFloat',
      },
    })
    vim.cmd [[ TransparentEnable ]]
  end
}
