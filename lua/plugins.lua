local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",

    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ------------ UTILS ----------------------------
  'nvim-lua/plenary.nvim',
  'tpope/vim-dispatch',
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
  'hrsh7th/cmp-vsnip', -- Snipets
  'hrsh7th/vim-vsnip', -- Snipets

  -- Better Visualization on pum
  'onsails/lspkind.nvim',

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
  ---- Noctis
  --{ 'kartikp10/noctis.nvim',
  --  cmd = 'colorscheme noctis',
  --  dependencies = 'rktjmp/lush.nvim'
  --},

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
  -- Sidebar File Navigation
  'kyazdani42/nvim-tree.lua',

  -- Find files
  'nvim-telescope/telescope.nvim',
  ------------ FILE NAVIGATION ------------------

  ------------ NEOVIM UI ------------------------
  -- Lualine
  'nvim-lualine/lualine.nvim',

  -- Bufferline
  'akinsho/bufferline.nvim',

  -- Buffers per tab
  "tiagovla/scope.nvim",

  -- Git integration with signs
  'lewis6991/gitsigns.nvim',

  -- Which Key
  'folke/which-key.nvim',

  -- Highlight words under cursor
  'tzachar/local-highlight.nvim',

  -- Indent Line
  'lukas-reineke/indent-blankline.nvim',

  -- Terminal
  'akinsho/toggleterm.nvim',

  -- Messages, cmdline and popupmenu
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    }
  }
  ------------ NEOVIM UI ------------------------
}, {})
