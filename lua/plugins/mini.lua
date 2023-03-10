-- Default mini base16
local mini_base16 = {
  base00 = '#112641',
  base01 = '#3a475e',
  base02 = '#606b81',
  base03 = '#8691a7',
  base04 = '#d5dc81',
  base05 = '#e2e98f',
  base06 = '#eff69c',
  base07 = '#fcffaa',
  base08 = '#ffcfa0',
  base09 = '#cc7e46',
  base0A = '#46a436',
  base0B = '#9ff895',
  base0C = '#ca6ecf',
  base0D = '#42f7ff',
  base0E = '#ffc4ff',
  base0F = '#00a5c5',
}

-- https://github.com/catppuccin/base16
local catppuccin_base16 = {
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
  base0F = '#f2cdcd',
}

return {
  'echasnovski/mini.nvim',
  event = { 'BufRead' },
  config = function()
    require('mini.cursorword').setup()
    require('mini.completion').setup()
    require('mini.pairs').setup()
    require('mini.tabline').setup()
    require('mini.splitjoin').setup()
    require('mini.indentscope').setup()
    require('mini.base16').setup({
      palette = catppuccin_base16
    })
  end
}
