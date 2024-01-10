return {
    "ThePrimeagen/harpoon",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>ha",
            ":lua require('harpoon.mark').add_file()<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>hl",
            ":lua require('harpoon.ui').toggle_quick_menu()<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>1",
            ":lua require('harpoon.ui').nav_file(1)<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>2",
            ":lua require('harpoon.ui').nav_file(2)<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>3",
            ":lua require('harpoon.ui').nav_file(3)<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>4",
            ":lua require('harpoon.ui').nav_file(4)<cr>",
            { noremap = true, silent = true }
        )
    end,
}
