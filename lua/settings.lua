-- hide default comments in file explorer
vim.g.netrw_banner = 0

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 2

-- sync clipboard between OS and NeoVim
vim.opt.clipboard = "unnamedplus"

-- tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- scroll margins
vim.opt.scrolloff = 8

-- pop up menu (such as completion) height in lines
vim.opt.pumheight = 10

-- highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- mouse mode
vim.opt.mouse = "a"

-- line breaks
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.smartindent = true

-- undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep sign column on by default
vim.opt.signcolumn = "yes"

-- if terminal supports this
vim.opt.termguicolors = true

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- spell-check
vim.cmd("set spell spelllang=en_us,lt")
