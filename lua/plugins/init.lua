return {
  ------------ UTILS ----------------------------
  ------------ UTILS ----------------------------

  ------------ LSP ------------------------------
  -- Base LSP
  'neovim/nvim-lsp',

  -- Base LSP Config
  'neovim/nvim-lspconfig',

  -- Completition Engine
  'hrsh7th/cmp-nvim-lsp', -- Source for native lsp completition
  'hrsh7th/cmp-buffer', -- Buffer completition
  'hrsh7th/cmp-path', -- Path completition
  'hrsh7th/cmp-cmdline', -- Cmdline completition
  'hrsh7th/cmp-vsnip', -- Snippets
  'hrsh7th/vim-vsnip', -- Snippets 

  -- Auto close tags
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'RRethy/nvim-treesitter-endwise',

  -- Better LSP Experience
  'RishabhRD/popfix',
  'RishabhRD/nvim-lsputils',
  ------------ LSP ------------------------------

  ------------ THEME ----------------------------
  -- Nightfox
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  ------------ THEME ----------------------------
}
