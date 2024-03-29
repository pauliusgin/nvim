print("Labas, Pauliau!")

require("keymaps")

require("settings")

------------- packet manager Lazy.nvim ---------------------
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

require("lazy").setup("plugins")
--------------------------------------------------------------

-- color scheme
vim.cmd("colorscheme codedark")
vim.api.nvim_set_hl(0, "Normal", { bg = none })
vim.api.nvim_set_hl(0, "NormalFlat", { bg = none })
