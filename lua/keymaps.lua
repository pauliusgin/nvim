-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ctrl-s to save
vim.keymap.set("n", "<C-s>", ":w<cr>", { noremap = true, silent = true })

-- Ctrl-q to  quit
vim.keymap.set("n", "<C-q>", ":q<cr>", { noremap = true, silent = true })

-- file explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", { noremap = true, silent = true })

--move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the copy register while pasting
vim.keymap.set("x", "<leader>p", '"_dP')

-- cursor stays in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- dealing with word wrap
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- split window
vim.keymap.set("n", "<leader>sp", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontally - " })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertically | " })

-- split window resize
vim.keymap.set(
	"n",
	"<leader><Right>",
	":vertical resize +5<CR>",
	{ noremap = true, silent = true, desc = "Increase window width" }
)
vim.keymap.set(
	"n",
	"<leader><Left>",
	":vertical resize -5<CR>",
	{ noremap = true, silent = true, desc = "Decrease window width" }
)
vim.keymap.set(
	"n",
	"<leader><Up>",
	":resize +5<CR>",
	{ noremap = true, silent = true, desc = "Increase window height" }
)
vim.keymap.set(
	"n",
	"<leader><Down>",
	":resize -5<CR>",
	{ noremap = true, silent = true, desc = "Decrease window height" }
)

-- split window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- stay in place while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- remove highlights after search
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { noremap = true, silent = true })

-- vertical motions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
