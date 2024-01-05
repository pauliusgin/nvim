-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- file explorer
vim.keymap.set("n", "<leader>e", ":Lex 30<cr>", { noremap = true, silent = true } )

-- dealing with word wrap
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
