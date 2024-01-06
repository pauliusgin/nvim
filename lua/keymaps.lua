-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- file explorer
vim.keymap.set("n", "<leader>e", ":Lex 30<cr>", { noremap = true, silent = true } )

-- dealing with word wrap
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- split window
vim.keymap.set("n", "<leader>sp", ":split<CR>", { noremap = true, silent = true, desc = "[SP]lit horizontally" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "[S]plit [V]ertically" })

-- split window resize
vim.keymap.set(
  "n",
  "<leader>>",
  ":vertical resize +5<CR>",
  { noremap = true, silent = true, desc = "Increase window width" }
)
vim.keymap.set(
  "n",
  "<leader><",
  ":vertical resize -5<CR>",
  { noremap = true, silent = true, desc = "Decrease window width" }
)
vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { noremap = true, silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<leader>-", ":resize -5<CR>", { noremap = true, silent = true, desc = "Decrease window height" })

-- split window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })


--------- HARPOON ----------------
