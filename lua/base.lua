vim.cmd("autocmd!")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set mouse=a")

vim.opt.showmode = false
vim.opt.showcmd = false

vim.opt.relativenumber = true
vim.wo.number = false
vim.opt.signcolumn = 'yes:1'

vim.g.mapleader = ";"

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.cmd("colorscheme default")
