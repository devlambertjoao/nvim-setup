local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


  ------------ UTILS ----------------------------  
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-dispatch'
  ------------ UTILS ----------------------------

  ------------ LSP ------------------------------  
  -- Base LSP
  use 'neovim/nvim-lsp'

  -- Base LSP Config
  use 'neovim/nvim-lspconfig'

  -- Completition Engine
  use 'hrsh7th/nvim-cmp' -- Completition
  use 'hrsh7th/cmp-nvim-lsp' -- Source for native lsp completition
  use 'hrsh7th/cmp-buffer' -- Buffer completition
  use 'hrsh7th/cmp-path' -- Path completition
  use 'hrsh7th/cmp-cmdline' -- Cmdline completition
  use 'hrsh7th/cmp-vsnip' -- Snipets
  use 'hrsh7th/vim-vsnip' -- Snipets

  -- Better Visualization on pum
  use 'onsails/lspkind.nvim'

  -- Auto close tags
  use 'windwp/nvim-autopairs'
  ------------ LSP ------------------------------

  ------------ THEME ----------------------------
  -- Noctis
  use {
    'kartikp10/noctis.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      -- vim.cmd('syntax on')
      -- vim.cmd('colorscheme noctis')
    end
  }

  -- Nightfox
  use {
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd('colorscheme nightfox')
    end
  }
  ------------ THEME ----------------------------

  ------------ FILE NAVIGATION ------------------
  -- Sidebar File Navigation
  use 'kyazdani42/nvim-tree.lua'

  -- Find files
  use 'nvim-telescope/telescope.nvim'

  -- Git UI
  use 'kdheepak/lazygit.nvim'
  ------------ FILE NAVIGATION ------------------

  ------------ NEOVIM UI ------------------------
  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  -- Buffers per tab
  use "tiagovla/scope.nvim"

  -- Git integration with signs 
  use 'lewis6991/gitsigns.nvim'

  -- Which Key
  use 'folke/which-key.nvim'

  -- Highlight words under cursor
  use 'tzachar/local-highlight.nvim'

  -- Ident Line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Transparent
  use 'xiyaowong/nvim-transparent'
  ------------ NEOVIM UI ------------------------


  if packer_bootstrap then
    require('packer').sync()
  end
end)
