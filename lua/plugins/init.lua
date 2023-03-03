return {
  ------------ UTILS ----------------------------
  'nvim-lua/plenary.nvim',
  ------------ UTILS ----------------------------

  ------------ LSP ------------------------------
  -- Base LSP
  'neovim/nvim-lsp',

  -- Base LSP Config
  'neovim/nvim-lspconfig',

  -- Completition Engine
  'hrsh7th/nvim-cmp', -- Completition
  'hrsh7th/cmp-nvim-lsp', -- Source for native lsp completition
  'hrsh7th/cmp-buffer', -- Buffer completition
  'hrsh7th/cmp-path', -- Path completition
  'hrsh7th/cmp-cmdline', -- Cmdline completition

  -- Auto close tags
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'RRethy/nvim-treesitter-endwise',

  -- Better LSP Experience
  'RishabhRD/popfix',
  'RishabhRD/nvim-lsputils',

  -- Diagnostics
  "folke/trouble.nvim",

  -- Tree Sitter
  'nvim-treesitter/nvim-treesitter',
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

  ------------ FILE NAVIGATION ------------------
  -- Find files
  'nvim-telescope/telescope.nvim',
  ------------ FILE NAVIGATION ------------------

  ------------ NEOVIM UI ------------------------
  -- Which Key
  'folke/which-key.nvim',

  -- Highlight words under cursor
  'tzachar/local-highlight.nvim',

  -- Indent Line
  'lukas-reineke/indent-blankline.nvim',

  ------------ NEOVIM UI ------------------------
}
