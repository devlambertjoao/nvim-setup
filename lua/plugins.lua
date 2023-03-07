local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {
  defaults = {
    lazy = true,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  checker = {
    enabled = false,
  },
  install = {
    colorscheme = { "nightfox" }
  },
  ui = {
    icons = {
      cmd = ">_",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "",
      loaded = "●",
      not_loaded = "○",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "",
      list = {
        "",
        "",
        "",
        "",
      },
    }
  },
  performance = {
    cache = {
      enabled = true
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
