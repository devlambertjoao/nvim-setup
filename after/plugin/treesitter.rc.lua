local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup({
  ensure_installed = {
    'c',
    'lua',
    'c_sharp',
    'cpp',
    'css',
    'java',
    'javascript',
    'json',
    'make',
    'python',
    'ruby',
    'rust',
    'scss',
    'tsx',
    'vue',
    'yaml'
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  autotag = {
    enable = true,
    filetypes = {
      'html',
      'xml',
      'eruby',
      'embedded_template',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'vue',
      'tsx'
    }
  },
  endwise = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
