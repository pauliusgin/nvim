-- hide default comments in file explorer
vim.g.netrw_banner = 0

-- browsing directory is current directory
-- vim.g.netrw_keepdir = 0

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- sync clipboard between OS and NeoVim
vim.opt.clipboard = "unnamedplus"

-- tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")


