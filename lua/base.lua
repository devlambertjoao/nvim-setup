vim.cmd("autocmd!")

vim.g.mapleader = ";"

vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.swapfile = false;
vim.opt.updatetime = 100
vim.opt.list = true

-- Enable mouse suport
vim.cmd [[set mouse=a]]

---- Bottom Bar
-- No Show Mode Below Lualine
vim.opt.showmode = false

-- No show keystrokes
vim.opt.showcmd = true

---- Left Column
-- Numbers
vim.opt.relativenumber = true
vim.wo.number = false
-- Sign Column
vim.opt.signcolumn = 'yes:1'

-- Indent
vim.filetype.indent = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

---- Custom Idents
-- C#
vim.api.nvim_command([[
  autocmd Filetype cs setlocal shiftwidth=4 tabstop=4 softtabstop=4
]])

-- File ecoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.cmd [[ colorscheme habamax ]]
